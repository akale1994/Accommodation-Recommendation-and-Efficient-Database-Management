// HOSTS

LOAD CSV WITH HEADERS FROM "file:///host_v2.csv" AS line
WITH line
WHERE line.host_id IS NOT NULL
MERGE (h: Hosts { 	hostId: toInt(line.host_id),
					hostUrl: line.host_url,
					hostName: line.host_name,
					hostVerifications: line.host_verifications,
					hostSince: Date(line.host_since),
					hostLocation: line.host_location,
					hostResponseTime: line.host_response_time,
					hostIsSuperhost: (case line.host_is_superhost when 't' then true else false end)
					})
ON CREATE SET 	h.hostVerifications = replace(h.hostVerifications, "[", ""),
				h.hostVerifications = replace(h.hostVerifications, "]", ""),
				h.hostVerifications = replace(h.hostVerifications, " ", ""),
				h.hostVerifications = replace(h.hostVerifications, "'", ""),
				h.hostVerifications = split(h.hostVerifications, ",")


// LISTINGS

LOAD CSV WITH HEADERS FROM "file:///listing_v2.csv" AS line
WITH line
WHERE line.id IS NOT NULL
MATCH (h: Hosts { hostId: toInt(line.host_id) })
MERGE (l: Listings {	listingId: toInt(line.id),
						name: line.name,
						summary: line.summary,
						listingUrl: line.listing_url,
						pictureUrl: line.picture_url,
						neighbourhood: line.neighbourhood,
						street: line.street,
						zipcode: toInt(line.zipcode),
						latitude: toFloat(line.latitude),
						longitude: toFloat(line.longitude),
						roomType: line.room_type,
						amenities: line.amenities,
						price: toFloat(line.price),
						extraPeople: line.extra_people,
						minimumNights: toInt(line.minimum_nights),
						calculatedHostListingsCount: toInt(line.calculated_host_listings_count),
						availability365: toInt(line.availability_365)
						})
ON CREATE SET	l.amenities = replace(l.amenities, "{", ''),
				l.amenities = replace(l.amenities, "}", ''),
				l.amenities = replace(l.amenities, '"', ''),
				l.amenities = split(l.amenities, ","),
				l.extraPeople = replace(l.extraPeople, "$", ""),
				l.extraPeople = replace(l.extraPeople, " ", ""),
				l.extraPeople = toFloat(l.extraPeople)
MERGE (h)-[:OWNS]->(l)


// REVIEWS

LOAD CSV WITH HEADERS FROM "file:///review_v2.csv" AS line
WITH line
WHERE line.id IS NOT NULL
MATCH (l: Listings { listingId: toInt(line.listing_id) })
MERGE (r: Reviewers {	reviewerId: toInt(line.reviewer_id),
						reviewerName: line.reviewer_name
						})
MERGE (r)-[:REVIEWED {	id: toInt(line.id),
						date: Date(line.date),
						reviewScoresRating: toFloat(line.review_scores_rating),
						comments: line.comments
						}]->(l)



//EXPLANATION//

//MonashBnB have provided us with a set of data split into 3 parts, namely, Hosts, Listings and Reviews.
//This data has been represented using 3 nodes, Hosts, Listings and Reviewers, with details stored as properties using their appropriate data types.
//These nodes are connected by relationships, Hosts-'OWNS'->Listings and Reviewers-'REVIEWED'->Listings with all the review details stored in the 'REVIEWED' relationship. 
//These sets of vertices and edges together comprise of the whole graph database of the MonashBnB system.
//The nodes are linked to each other using their respective ID properties, which makes it easy to run queries leading us to the desired results.