//The accommodation recommendation system has been created on the existing graph database.
//The system works on K-Nearest Neighbours (kNN) and Cosine Similarity techniques.


//1 - Create the cosine similarity relationships among all the reviewers based on their review scores ratings on the accommodations.

MATCH	(r1:Reviewers)-[x:REVIEWED]->(l:Listings)<-[y:REVIEWED]-(r2:Reviewers)
WITH 	SUM(x.reviewScoresRating * y.reviewScoresRating) AS xyDotProduct,
		SQRT(REDUCE(xDot = 0.0, a IN COLLECT(x.reviewScoresRating) | xDot + a^2)) AS xLength,
		SQRT(REDUCE(yDot = 0.0, b IN COLLECT(y.reviewScoresRating) | yDot + b^2)) AS yLength,
		r1, r2
MERGE	(r1)-[s:SIMILARITY]-(r2)
SET 	s.similarity = xyDotProduct / (xLength * yLength)




// 2 - View the 5 nearest neighbours for a reviewer based on their similarities.

MATCH    (r1:Reviewers {reviewerId: 336664})-[s:SIMILARITY]-(r2:Reviewers)
WHERE 	 s.similarity <= 1
WITH     r2, s.similarity AS sim
RETURN   r2.reviewerName AS neighbours, sim AS similarity
ORDER BY sim




// 3 - Get the accommodation recommendations for any reviewer using the reviewer ID.

//EXAMPLE 1 - Here, reviewerId = 763817 and k = 2

MATCH    (r1:Reviewers)-[x:REVIEWED]->(l:Listings), (r1)-[s:SIMILARITY]-(r2:Reviewers {reviewerId: 763817})
WHERE    NOT((r2)-[:REVIEWED]->(l))
WITH     l, s.similarity AS similarity, x.reviewScoresRating AS rating
ORDER BY l.name, similarity
WITH     l.name AS listing, COLLECT(rating)[0..2] AS ratings
WITH     listing, REDUCE(s = 0, i IN ratings | s + i) * 1.0 / SIZE(ratings) AS recommend
ORDER BY recommend DESC
RETURN   listing AS listings, recommend AS recommendations



//EXAMPLE 2 - Here, reviewerId = 321095 and k = 5

MATCH    (r1:Reviewers)-[x:REVIEWED]->(l:Listings), (r1)-[s:SIMILARITY]-(r2:Reviewers {reviewerId: 321095})
WHERE    NOT((r2)-[:REVIEWED]->(l))
WITH     l, s.similarity AS similarity, x.reviewScoresRating AS rating
ORDER BY l.name, similarity
WITH     l.name AS listing, COLLECT(rating)[0..5] AS ratings
WITH     listing, REDUCE(s = 0, i IN ratings | s + i) * 1.0 / SIZE(ratings) AS recommend
ORDER BY recommend DESC
RETURN   listing AS listings, recommend AS recommendations