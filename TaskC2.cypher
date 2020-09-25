//QUERIES


// 1

MATCH (l:Listings)-[x:REVIEWED]-()
WITH l, count(x) AS cnt
WHERE l.name CONTAINS ("Sunny 1950s Apartment, St Kilda East")
RETURN cnt AS numberOfReviews


// 2

MATCH (l:Listings {neighbourhood:'Port Phillip'})-[x:REVIEWED]-(r:Reviewers)
RETURN r AS reviewers, x AS reviews



// 3

MATCH (r:Reviewers)-[x:REVIEWED]-(l:Listings)
WHERE NOT r.reviewerId = 4162110 AND r.reviewerId = 317848 AND x.reviewScoresRating > 90
RETURN l AS recommendedAccommodations



// 4

MATCH (l:Listings)
WITH l, collect ( {neighbourhood:l.neighbourhood, street:l.street, zipcode:l.zipcode} ) AS listingLocation
WHERE NOT 'Wifi' IN l.amenities
RETURN l.name AS listingName, listingLocation



// 5

MATCH (r:Reviewers)-[x:REVIEWED]-()
RETURN r AS reviewer, count(x) AS numberOfReviews



// 6

MATCH (l1:Listings), (l2:Listings)
WHERE NOT l1.name = l2.name AND length(filter(a IN l1.amenities WHERE a IN l2.amenities)) > 3
RETURN l1 AS accommodation1, l2 AS accommodation2


// 7

MATCH (l:Listings)
WHERE NOT ()-[:REVIEWED]->(l)
RETURN l AS listings



// 8

MATCH (l:Listings)-[x:OWNS]-(h:Hosts)
WITH h, count(x) AS cnt, collect( {listingName:l.name, listingPrice:l.price} ) AS listingDetails
WHERE cnt > 1
RETURN h AS hostDetails, listingDetails



// 9

MATCH ( l:Listings {neighbourhood:'Melbourne'} )
RETURN l.neighbourhood AS neighbourhood, avg(l.price) AS averagePrice



// 10

MATCH (l:Listings)--(h:Hosts)
WITH l, collect( {hostName:h.hostName, hostId:h.hostId} ) AS hostInformation, collect ( {neighbourhood:l.neighbourhood, street:l.street, zipcode:l.zipcode} ) AS listingLocation
RETURN listingLocation, hostInformation, l.name AS listingName
ORDER BY l.price DESC
LIMIT 5



// 11

MATCH (r:Reviewers)-[x:REVIEWED]-(l:Listings)
WHERE x.date.year = 2017
RETURN count(l) as noOfAccommodationsReviewedIn2017



// 12

MATCH (l:Listings)-[x:REVIEWED]-(r:Reviewers)
RETURN l.neighbourhood AS neighbourhood, avg(x.reviewScoresRating) AS averageReviewScoresRating
ORDER BY averageReviewScoresRating DESC
LIMIT 10



// 13

MATCH (h:Hosts)--(l:Listings)
WITH h, l, collect ( {neighbourhood:l.neighbourhood, street:l.street, zipcode:l.zipcode} ) AS listingLocation
WHERE NOT h.hostLocation = l.street
RETURN h.hostName AS hostName, h.hostLocation AS hostLocation, l.name AS listingName, listingLocation



// 14

MATCH (l:Listings)
WITH l, collect ( {neighbourhood:l.neighbourhood, street:l.street, zipcode:l.zipcode} ) AS listingLocation
RETURN l.name AS listingName, listingLocation, l.price AS pricePerNight, l.extraPeople AS extraPeopleCharge, 5 * (l.price + (2 * l.extraPeople)) AS totalPrice
ORDER BY totalPrice


// 15

MATCH (l1:Listings), (l2:Listings)
WHERE l1.listingId <> l2.listingId
WITH l1, l2, point( {latitude:l1.latitude, longitude:l1.longitude} ) AS p1, point( {latitude:l2.latitude, longitude:l2.longitude} ) AS p2
RETURN distance(p1, p2) AS distance, l1 AS listings, collect(l2) AS closeListings
ORDER BY l1.name, distance



//ADDITIONAL QUERIES


// 1
// Assuming that the accommodation price mentioned is for 2 people per night, find out all the accommodation names whose hosts are from Fitzroy and calculate the price for each accommodation for 2 people staying for 10 nights, with 1 extra person joining and staying for the last 2 days. Sort the accommodations with their average review ratings score, displaying the highest one first.

MATCH (h:Hosts)--(l:Listings)-[x:REVIEWED]-(r:Reviewers)
WITH h, l, avg(x.reviewScoresRating) AS averageReviewScoresRating
WHERE h.hostLocation STARTS WITH 'Fitzroy'
RETURN l.name AS accommodationName, (8 * l.price) + (2 * (l.price + l.extraPeople)) as totalPrice, averageReviewScoresRating
ORDER BY averageReviewScoresRating DESC


// 2
// Display the unique listing locations whose prices per night are less than $300 and are not available for 365 days.  Display all the prices (per night and extra people charge) for each location. Sort alphabetically with the location.

MATCH (l:Listings)
WHERE l.price < 300 AND NOT l.availability365 = 365
RETURN l.street AS listingLocation, collect(l.price) AS priceList, collect(l.extraPeople) AS extraPeoplePriceList
ORDER BY listingLocation


// 3
// Find the host details of the listings having either 'Oven' or 'TV' as one of their amenities. Also display the listing name along with its location and price per night.

MATCH (l:Listings)--(h:Hosts)
UNWIND l.amenities AS amenities1
WITH l, h, amenities1, ['Oven', 'TV'] AS amenities2, collect( {hostId: h.hostId, hostName: h.hostName} ) AS hostDetails, collect ( {neighbourhood:l.neighbourhood, street:l.street, zipcode:l.zipcode} ) AS listingLocation
WHERE amenities1 IN amenities2
RETURN DISTINCT hostDetails, l.name AS listingName, listingLocation, l.price AS pricePerNight


// 4
// Extract the top 10 reviews based on the score rating received, which are 2 to 4 years old whose listing's zipcode is 3000, and its host responds within an hour and also is a superhost.

MATCH (r:Reviewers)-[x:REVIEWED]-(l:Listings {zipcode: 3000})--(h:Hosts {hostResponseTime: 'within an hour', hostIsSuperhost: true})
WITH r, x, date() AS currentDate
WHERE (currentDate.year - x.date.year) > 1 AND (currentDate.year - x.date.year) < 5
RETURN r AS reviewers, x AS reviews
ORDER BY x.reviewScoresRating DESC
LIMIT 10


// 5
// Find the listings with room type as private room and have more than 300 reviews each. 

MATCH ()-[x:REVIEWED]-(l:Listings {roomType: 'Private room'})
WITH l, count(x) AS cnt
WHERE cnt > 300
RETURN l, cnt



//INDICES


CREATE INDEX ON: Listings(neighbourhood)

CREATE INDEX ON: Listings(amenities)

CREATE INDEX ON: Listings(street, price)



//JUSTIFICATION//

//Indices have been chosen according to the occurrences of the properties of the nodes in the queries.
//Being a travel accommodation booking system, the major search criteria runs based on the neighbourhood, amenities and review ratings that listings have received.
//To begin a search query for travel booking, location and price, together are key properties of the listings or accommodations, and hence, are used to create a composite index.