// 1


//I

MERGE (h: Hosts { 	hostId: 111111,
					hostUrl: "https://www.airbnb.com.au/users/show/106130712",
					hostName: 'Frank and Justine',
					hostVerifications: ['Government ID', 'Email address', 'Phone number'],
					hostSince: Date("2016-10-24"),
					hostLocation: 'Melbourne, Victoria, Australia',
					hostResponseTime: 'within an hour',
					hostIsSuperhost: true
					})
-[:OWNS]->	(l: Listings {	listingId: 1111111,
							name: 'Executive Luxury Condo with City and Lake Views',
							summary: "Take in the sprawling views of Albert Park Lake and Port Phillip Bay from the balcony of this spacious and tastefully styled apartment. Unwind in a contemporary design space with contrasting black and white throughout and access to a building gym.",
							listingUrl: "https://www.airbnb.com.au/rooms/plus/17914380?check_in=2019-10-30&check_out=2019-10-31&source_impression_id=p3_1571818039_AdscHndShYsAkLAt",
							pictureUrl: "https://www.airbnb.com.au/rooms/17914380?s=67&shared_item_type=1&virality_entry_point=1",
							neighbourhood: 'Melbourne',
							street: 'Melbourne, Victoria, Australia',
							zipcode: 3000,
							latitude: -37.8155,
							longitude: 144.95894,
							roomType: 'Entire home/apt',
							amenities: ['Self check_in', 'Gym', 'Kitchen', 'Washing machine', 'Dryer', 'Wifi', 'Coffee maker'],
							price: 328.87,
							extraPeople: 50.0,
							minimumNights: 1,
							calculatedHostListingsCount: 1,
							availability365: 365
							})
<-[:REVIEWED {	id: 12345,
				date: Date("2019-09-27"),
				reviewScoresRating: 99,
				comments: "This apartment has everything you need for a short or long stay. The views are magnificent and peaceful. Located on St Kilda Road with easy access and parking. The tram stop is just across the street making it extremely easy to travel to city or St Kilda."
}]-	(r: Reviewers {	reviewerId: 11111,
					reviewerName: 'Lyn'
					})


//II

MATCH (l: Listings { listingId: 1111111 })
MERGE (r: Reviewers {	reviewerId: 11112,
						reviewerName: 'Monika'
						})
-[:REVIEWED {	id: 12346,
				date: Date("2019-08-15"),
				reviewScoresRating: 81,
				comments: "Beautiful apartment with all that you need for a weekend stay (or longer). Amazing location and breathtaking view!! Wanted to stay longer and will absolutely be back."
				}]->(l)


//III

MERGE (h: Hosts { 	hostId: 222222,
					hostUrl: "https://www.airbnb.com.au/users/show/15874351",
					hostName: 'Donna',
					hostVerifications: ['Government ID', 'Selfie', 'Email address', 'Phone number'],
					hostSince: Date("2014-06-20"),
					hostLocation: 'Melbourne, Victoria, Australia',
					hostResponseTime: 'within few hours',
					hostIsSuperhost: true
					})
-[:OWNS]->
		(l: Listings {	listingId: 2222222,
						name: 'Designer Suite in Central Deco Icon',
						summary: "Commanding views across historic City Hall and Paris End Skyscrapers, this centrally located apartment sits within the famous 1924 early modernist/Art Deco Capitol Theatre Building, designed by Frank Lloyd Wright trained architect, Walter Burley Griffin. Griffin is renowned for his design for Australia's capital city, Canberra.",
						listingUrl: "https://www.airbnb.com.au/rooms/3125217?check_in=2019-10-30&check_out=2019-10-31&source_impression_id=p3_1571824450_ApuC%2F77nrJQBAazT",
						pictureUrl: "https://www.airbnb.com.au/rooms/3125217/slideshow/25339875?check_in=2019-10-30&check_out=2019-10-31&adults=1&children=0&infants=0",
						neighbourhood: 'CBD',
						street: 'Melbourne, Victoria, Australia',
						zipcode: 3000,
						latitude: -37.7985,
						longitude: 144.97883,
						roomType: 'Entire home/apt',
						amenities: ['Lift', 'Breakfast', 'Wifi', 'Kitchen'],
						price: 216.96,
						extraPeople: 20.0,
						minimumNights: 2,
						calculatedHostListingsCount: 2,
						availability365: 365
						})
<-[:REVIEWED {	id: 23456,
				date: Date("2019-10-06"),
				reviewScoresRating: 100,
				comments: "Location, location. Donna's apartment is a wonderful, clean, quiet place right in the heart of Melbourne. We spent a comfortable week in the stylish apartment with all the amenities you could require. We will definitely stay again."
}]-	(r: Reviewers {	reviewerId: 22222,
					reviewerName: 'Karen'
					})


//IV

MATCH (l: Listings { listingId: 2222222 })
MERGE (r: Reviewers {	reviewerId: 22223,
						reviewerName: 'Victor'
					})
-[:REVIEWED {	id: 23457,
				date: Date("2019-09-19"),
				reviewScoresRating: 100,
				comments: '10 out of 10'
				}]->(l)


//V

MATCH (h: Hosts {hostId: 222222 })
MERGE (l: Listings {	listingId: 3333333,
						name: 'Stylish Room in the City Heart',
						summary: "LOCATION AND COMFORT! Your own private room in my home in Melbourne's Centre - only a 10-12 minute walk from the city's main transport terminal and shopping. The apartment is in the classy financial district of Melbourne's downtown - with historical character with the convenience of clean, modern interior. Some of the city's best cafes close by, and free tram transport at the doorstep. You will be right at the centre of the action in this vibrant city!",
						listingUrl: "https://www.airbnb.com.au/rooms/3163595?source_impression_id=p3_1571825313_%2BAy5b2zgNGVoKQje",
						pictureUrl: "https://www.airbnb.com.au/rooms/3163595/slideshow/653308813?adults=1&children=0&infants=0",
						neighbourhood: 'Richmond',
						street: 'Richmond, Victoria, Australia',
						zipcode: 3121,
						latitude: -37.81973,
						longitude: 145.00078,
						roomType: 'Entire home/apt',
						amenities: ['Lift', 'Breakfast', 'Wifi', 'Kitchen', 'Air conditioning', 'Hot water', 'Dishwasher', 'Bed and bath'],
						price: 79.0,
						extraPeople: 0.0,
						minimumNights: 1,
						calculatedHostListingsCount: 2,
						availability365: 365
						})<-[:OWNS]-(h)


//VI

MATCH (l: Listings { listingId: 3333333 })
MERGE (r: Reviewers {	reviewerId: 33333,
						reviewerName: 'Alice'
						})
-[:REVIEWED {	id: 34567,
				date: Date("2019-08-18"),
				reviewScoresRating: 95,
				comments: "Located in the heart of the city, stylish comfy room in a great apartment, and an excellent host. What more could you wish for!"
				}]->(l)


//VII

MATCH (l: Listings { listingId: 3333333 })
MERGE (r: Reviewers {	reviewerId: 33334,
						reviewerName: 'Cindy'
						})
-[:REVIEWED {	id: 34568,
				date: Date("2019-08-04"),
				reviewScoresRating: 100,
				comments: "10/10 would recommend. Easy communication, excellent location and nothing but amazing."
				}]->(l)


//VIII

MATCH (l: Listings { listingId: 3333333 })
MERGE (r: Reviewers {	reviewerId: 33335,
						reviewerName: 'Alana'
						})
-[:REVIEWED {	id: 34569,
				date: Date("2019-07-07"),
				reviewScoresRating: 99,
				comments: "Could not recommend Donna’s apartment more. The hospitality, location, unit and small touches make this a very special place to stay. Donna is beyond helpful and thoughtful. She made our stay so easy and effortless. The helpful tips around the city and good restaurant and bar recommendations were the perfect finishing touch. Thank you so much Donna!"
				}]->(l)



// 2

MATCH (h:Hosts)
WHERE h.hostSince.year = 2009
SET h.hostVerifications = h.hostVerifications + 'Facebook'



// 3

MATCH (h:Hosts {hostResponseTime: 'within an hour'})
SET h.hostIsSuperhost = true



// 4

MATCH (h:Hosts)--(l:Listings)-[x:REVIEWED]-()
WITH h, max(x.date) AS latestReview
WHERE NOT latestReview.year > 2016
SET h.active = false


// 5

MATCH (l:Listings)
WHERE NOT (l)-[:REVIEWED]-() AND l.availability365 = 0
DETACH DELETE l