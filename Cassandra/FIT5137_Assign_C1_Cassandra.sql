CREATE KEYSPACE FIT5137_Assign 
WITH REPLICATION = {'class': 'SimpleStrategy',
'replication_factor' : 1};

USE FIT5137_Assign;

CREATE TABLE review (
  listing_id text,
  review_id text,
  review_date date,
  sequence text,
  reviewer_id int,
  reviewer_name text,
  review_scores_rating int,
  satisfied_reason set<text>,
  comments text,
  PRIMARY KEY ((review_id), listing_id, reviewer_id)
);

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST02', 'REV01', '2017-03-22', '10:37:50+1300', 500001, 'Miriam', 90, {'location', 'amenities'}, 'Beautiful View');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST02', 'REV02', '2017-03-22', '11:37:50+1300', 500002, 'Johannes', 90, {'host'}, 'Good Host');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST02', 'REV03', '2017-03-22', '11:37:50+1300', 500003, 'Camille', 100, {'location', 'view'}, 'Nice View and Location');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST02', 'REV04', '2017-03-22', '12:37:50+1300', 500004, 'Paige', 95, {'price'}, 'Excellent Price');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST01', 'REV05', '2017-03-22', '15:37:50+1300', 500005, 'Adele', 93, {'location', 'price'}, 'Good Location');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST03', 'REV06', '2017-03-22', '17:37:50+1300', 500006, 'Greg', 87, {'host', 'view'}, 'Very Clean House');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST04', 'REV07', '2017-03-22', '19:37:50+1300', 500007, 'Wolfgang', 91, {'location', 'price'}, 'Nice Location');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST05', 'REV08', '2017-03-22', '20:37:50+1300', 500008, 'Klaus', 96, {'location', 'view'}, 'Nice Building');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST06', 'REV09', '2017-03-23', '11:37:50+1300', 500009, 'Rox', 100, {'host', 'price'}, 'Friendly Host');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST05', 'REV10', '2017-03-23', '12:37:50+1300', 500010, 'Elizabeth', 98, {'host', 'price'}, 'Friendly Host');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST09', 'REV11', '2017-03-23', '19:37:50+1300', 500011, 'Derek', 100, {'space', 'clean'}, 'Very Clean and comfortable');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST09', 'REV12', '2017-03-25', '10:07:40+1300', 500012, 'Joy', 92, {'host', 'clean'}, 'Friendly and Nice Host');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST10', 'REV13', '2017-03-26', '10:02:10+1300', 500013, 'Anouck', 93, {'host', 'view'}, 'Very Comfortable');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST12', 'REV14', '2017-03-26', '10:49:40+1300', 500014, 'Jerome', 85, {'location', 'clean'}, 'Friendly Host');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST13', 'REV15', '2017-03-26', '10:48:40+1300', 500015, 'Jehan', 98, {'location', 'amenities'}, 'Beautiful View');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST14', 'REV16', '2017-03-26', '10:48:10+1300', 500016, 'Joy', 97, {'amenities', 'view'}, 'Good Location');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST14', 'REV17', '2017-03-26', '10:47:40+1300', 500014, 'Jerome', 30, {'price', 'view'}, 'Bad Location');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST10', 'REV18', '2017-03-26', '10:47:10+1300', 500002, 'Johannes', 20, {'amenities', 'view'}, 'Bad Service');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST12', 'REV19', '2017-03-27', '09:37:50+1300', 500013, 'Anouck', 87, {'space', 'clean'}, 'Good Location');

INSERT INTO review (listing_id, review_id, review_date, sequence, reviewer_id, reviewer_name, review_scores_rating, satisfied_reason, comments) VALUES ('MONLST05', 'REV20', '2017-03-27', '10:45:10+1300', 500011, 'Derek', 96, {'host', 'view'}, 'Nice Building');