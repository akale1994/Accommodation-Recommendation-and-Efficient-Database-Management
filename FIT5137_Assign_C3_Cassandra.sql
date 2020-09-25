CREATE keyspace FIT5137_Assign_C3 
WITH replication = {'class': 'SimpleStrategy',
'replication_factor': 1};


USE FIT5137_Assign_C3;


CREATE TABLE review (
  listing_id int,
  id int,
  date date,
  reviewer_id int,
  reviewer_name text,
  review_scores_rating int,
  comments text,
  PRIMARY KEY ((id), listing_id, reviewer_id)
);


COPY FIT5137_Assign_C3.review (listing_id, id, date, reviewer_id, reviewer_name, review_scores_rating, comments)
FROM '/Users/sameekshaingle/Documents/Monash/Sem3/ADB/Assignment 1/assignment_data/review.csv' WITH HEADER = TRUE;




***Q15***

CREATE INDEX ON review (listing_ID);
SELECT listing_ID, id, max(date), reviewer_id, review_scores_rating, comments FROM review WHERE listing_ID = 10803;



***Q16***

SELECT * FROM review WHERE review_scores_rating > 70 AND review_scores_rating < 90 ALLOW FILTERING;



***Q17***

SELECT listing_id, reviewer_id, reviewer_name, comments FROM review WHERE review_scores_rating < 50 ALLOW FILTERING;



***Q18***

SELECT count(*) FROM review WHERE date >= '2015-01-01' AND date <= '2015-12-31' ALLOW FILTERING;



***Q19***

CREATE INDEX ON review (date);
SELECT id, reviewer_id, max(review_scores_rating), comments FROM review WHERE date = '2017-03-26';



***Q20***
SELECT listing_ID, reviewer_name, max(review_scores_rating) FROM review;




***ADDITIONAL QUERIES***

***Query 4***

Display the reviewers along with their ratings who have provided the reviews 219559474 and 46191285.

SELECT id, reviewer_id, reviewer_name, review_scores_rating FROM review WHERE id IN (219559474, 46191285) ALLOW FILTERING;




***Query 5***

What is the average of all the ratings provided for the listing?

CREATE INDEX on review (listing_ID);
SELECT avg(review_scores_rating) from review WHERE listing_ID = 51592;