
----- Part 1: Yelp Dataset Profiling and Understanding

---------- Profiling the data by finding the total number of records for each of the tables below: -------------------




SELECT COUNT(*)   
FROM Attribute;     

SELECT COUNT(*) 
FROM Business;

SELECT COUNT(*)
FROM Category;

SELECT COUNT(*)
FROM Checkin;

SELECT COUNT(*)
FROM elite_years;

SELECT COUNT(*)
FROM friend;

SELECT COUNT(*)
FROM hours;

SELECT COUNT(*)
FROM photo;

SELECT COUNT(*)
FROM review;

SELECT COUNT(*)
FROM tip;

SELECT COUNT(*)
FROM user;



------- Finding the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, specified which foreign key. ------------------


SELECT COUNT(DISTINCT ID)
FROM business;

SELECT COUNT(DISTINCT business_id)
FROM hours;

SELECT COUNT(DISTINCT business_id)
FROM category;

SELECT COUNT(DISTINCT business_id)
FROM attribute;

SELECT COUNT(DISTINCT id)
FROM review;

SELECT COUNT(DISTINCT business_id)
FROM checkin;

SELECT COUNT(DISTINCT id)
FROM photo;

SELECT COUNT(DISTINCT user_id)
FROM tip;

SELECT COUNT(DISTINCT id)
FROM user;

SELECT COUNT(DISTINCT user_id)
FROM friend;

SELECT COUNT(DISTINCT user_id)
FROM elite_years;



/* Are there any columns with null values in the Users table?

	Answer: No
	
	
	SQL code used to arrive at answer:  */
	
	
	SELECT *
	FROM Users
	WHERE *column_name* is null
	
	

----- For each table and column listed below, displaying the smallest (minimum), largest (maximum), and average (mean) value for the following fields:  ---
	
/*
	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0 	max: 5.0	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000	avg: 24.2995
*/		
		
		
----- Listing the cities with the most reviews in descending order: -------------------------------------
		

	
--	SQL code used to arrive at answer:
	
	
	
	SELECT city, SUM(review_count) as count
	FROM business
	GROUP BY city
	ORDER BY count DESC;


--	Copy and Pasting the Result Below:
	
/*	
+-----------------+-------+
| city            | count |
+-----------------+-------+
| Las Vegas       | 82854 |
| Phoenix         | 34503 |
| Toronto         | 24113 |
| Scottsdale      | 20614 |
| Charlotte       | 12523 |
| Henderson       | 10871 |
| Tempe           | 10504 |
| Pittsburgh      |  9798 |
| Montréal        |  9448 |
| Chandler        |  8112 |
| Mesa            |  6875 |
| Gilbert         |  6380 |
| Cleveland       |  5593 |
| Madison         |  5265 |
| Glendale        |  4406 |
| Mississauga     |  3814 |
| Edinburgh       |  2792 |
| Peoria          |  2624 |
| North Las Vegas |  2438 |
| Markham         |  2352 |
| Champaign       |  2029 |
| Stuttgart       |  1849 |
| Surprise        |  1520 |
| Lakewood        |  1465 |
| Goodyear        |  1155 |
+-----------------+-------+
(Output limit exceeded, 25 of 362 total rows shown)
*/


----- 6. Finding the distribution of star ratings to the business in the following cities:  ------------------

-- i. Avon

/*
+------------------+-------+
| business_reviews | stars |
+------------------+-------+
|               10 |   1.5 |
|                6 |   2.5 |
|               88 |   3.5 |
|               21 |   4.0 |
|               31 |   4.5 |
|                3 |   5.0 |
+------------------+-------+
*/

-- SQL code used to arrive at answer:
	
	SELECT SUM(review_count) as business_reviews, stars
	FROM business
	where city = 'Avon'
	GROUP BY stars;
	
-- ii. Beachwood

/*
+------------------+-------+
| business_reviews | stars |
+------------------+-------+
|                8 |   2.0 |
|                3 |   2.5 |
|               11 |   3.0 |
|                6 |   3.5 |
|               69 |   4.0 |
|               17 |   4.5 |
|               23 |   5.0 |
+------------------+-------+
*/

-- SQL code used to arrive at answer:


	SELECT SUM(review_count) as business_reviews, stars
	FROM business
	WHERE city = 'Beachwood'
	GROUP BY stars;
	
	
----------- Finding the top 3 users based on their total number of reviews: ----------------
		
	-- SQL code used to arrive at answer:
	
	SELECT name, review_count
	FROM user
	ORDER BY review_count DESC
	LIMIT 3;
	
		
	-- Copy and Pasting the Result Below:
	
/*
	+--------+--------------+
	| name   | review_count |
	+--------+--------------+
	| Gerald |         2000 |
	| Sara   |         1629 |
	| Yuri   |         1339 |
	+--------+--------------+

*/	

-------- Does posting more reviews correlate with more fans? ---------

	-- No, posting more reviews does not correlate with more fans.
	
/*
+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Gerald    |         2000 |  253 |
| Sara      |         1629 |   50 |
| Yuri      |         1339 |   76 |
| .Hon      |         1246 |  101 |
| William   |         1215 |  126 |
| Harald    |         1153 |  311 |
| eric      |         1116 |   16 |
| Roanna    |         1039 |  104 |
| Mimi      |          968 |  497 |
| Christine |          930 |  173 |
| Ed        |          904 |   38 |
| Nicole    |          864 |   43 |
| Fran      |          862 |  124 |
| Mark      |          861 |  115 |
| Christina |          842 |   85 |
| Dominic   |          836 |   37 |
| Lissa     |          834 |  120 |
| Lisa      |          813 |  159 |
| Alison    |          775 |   61 |
| Sui       |          754 |   78 |
| Tim       |          702 |   35 |
| L         |          696 |   10 |
| Angela    |          694 |  101 |
| Crissy    |          676 |   25 |
| Lyn       |          675 |   45 |
+-----------+--------------+------+
(Output limit exceeded, 25 of 10000 total rows shown)
*/

	
	SELECT name, review_count, fans
	FROM user
	ORDER BY review_count DESC, fans DESC;
	
	
	
------------- Are there more reviews with the word "love" or with the word "hate" in them? ------------

	-- There are more views with the world 'love' in them.

	
	-- SQL code used to arrive at answer:
	
	SELECT count(text)          -- = 1780 reviews with 'love' in them
	FROM review
	WHERE text LIKE '%love%';

    SELECT count(text)          -- = 232 reviews with 'hate' in them
	from review
	WHERE text LIKE '%hate%';


---------- Finding the top 10 users with the most fans: --------------------------

	-- SQL code used to arrive at answer:
	
	SELECT id, name, fans
	FROM user
	ORDER BY fans DESC
	LIMIT 10;
	
	
	
	-- Copy and Paste the Result Below:
	
/*
+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+
*/




-- Part 2: Inferences and Analysis

-- Picking one city and category and grouping the businesses in that city or category by their overall star rating. Comparing the businesses with 2-3 stars to the businesses with 4-5 stars.
	
-- City: Las Vegas
-- Category: Restaurants



-- i. Do the two groups have a different distribution of hours?
	
	-- Yes, businesses in Las Vegas in the Restaurant category with an overall rating with 2-3 stars tend to have longer hours (13 hours of operation)
	-- than businesses in Las Vegas with an overall rating with 4-5 stars (9-13 hours of operation on weekdays, 6-13 hours of operation on weekends) 


-- ii. Do the two groups have a different number of reviews?
       
	-- Yes, businesses in Las Vegas in the Restaurant category with an overall rating of 2-3 stars have 123 reviews
	-- while businesses in Las Vegas in the Restaurant category with an overall rating of 4-5 stars have 168 and 768 reviews 
	-- (as there is only 1 restaurant in the 2-3 star category and only 2 restaurants in the 4-5 category)
	
	   
         
-- iii. Can we infer anything from the location data provided between these two groups?


-- As there is insufficient amount of sample data, I am unable to make any inferences based on location data. As there is only one restaurant in the 2-3 star category, the neighborhood field is empty.




-- SQL code used for analysis:

----------------- Distribution of Hours -------------------	
	
SELECT
b.name, b.city, c.category, h.hours,
CASE
WHEN b.stars between 2 and 3 THEN '2-3 Stars'
WHEN b.stars between 4 and 5 THEN '4-5 Stars'
ELSE 'other'
END as 'Rating_Category',
b.review_count
FROM business as b 
INNER JOIN
hours as h 
on b.id = h.business_id
INNER JOIN
category as c
on b.id = c.business_id
WHERE city = 'Las Vegas'
and category = 'Restaurants'
and Rating_Category = '2-3 Stars';

/*
+----------+-----------+-------------+----------------------+-----------------+--------------+
| name     | city      | category    | hours                | Rating_Category | review_count |
+----------+-----------+-------------+----------------------+-----------------+--------------+
| Wingstop | Las Vegas | Restaurants | Monday|11:00-0:00    | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Tuesday|11:00-0:00   | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Friday|11:00-0:00    | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Wednesday|11:00-0:00 | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Thursday|11:00-0:00  | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Sunday|11:00-0:00    | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Saturday|11:00-0:00  | 2-3 Stars       |          123 |
+----------+-----------+-------------+----------------------+-----------------+--------------+
*/


SELECT
b.name, b.city, c.category, h.hours,
CASE
WHEN b.stars between 2 and 3 THEN '2-3 Stars'
WHEN b.stars between 4 and 5 THEN '4-5 Stars'
ELSE 'other'
END as 'Rating_Category',
b.review_count
FROM business as b 
INNER JOIN
hours as h 
on b.id = h.business_id
INNER JOIN
category as c
on b.id = c.business_id
WHERE city = 'Las Vegas'
and category = 'Restaurants'
and Rating_Category = '4-5 Stars';



/*
+---------------------+-----------+-------------+-----------------------+-----------------+--------------+
| name                | city      | category    | hours                 | Rating_Category | review_count |
+---------------------+-----------+-------------+-----------------------+-----------------+--------------+
| Jacques Cafe        | Las Vegas | Restaurants | Monday|11:00-20:00    | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Tuesday|11:00-20:00   | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Friday|11:00-20:00    | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Wednesday|11:00-20:00 | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Thursday|11:00-20:00  | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Sunday|8:00-14:00     | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Saturday|11:00-20:00  | 4-5 Stars       |          168 |
| Big Wong Restaurant | Las Vegas | Restaurants | Monday|10:00-23:00    | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Tuesday|10:00-23:00   | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Friday|10:00-23:00    | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Wednesday|10:00-23:00 | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Thursday|10:00-23:00  | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Sunday|10:00-23:00    | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Saturday|10:00-23:00  | 4-5 Stars       |          768 |
+---------------------+-----------+-------------+-----------------------+-----------------+--------------+
*/

-------------- Number of Reviews for Groups ------------------	
	
SELECT
b.name, b.city, c.category, h.hours,
CASE
WHEN b.stars between 2 and 3 THEN '2-3 Stars'
WHEN b.stars between 4 and 5 THEN '4-5 Stars'
ELSE 'other'
END as 'Rating_Category',
b.review_count
FROM business as b 
INNER JOIN
hours as h 
on b.id = h.business_id
INNER JOIN
category as c
on b.id = c.business_id
WHERE city = 'Las Vegas'
and category = 'Restaurants'
and Rating_Category = '2-3 Stars';

/*
+----------+-----------+-------------+----------------------+-----------------+--------------+
| name     | city      | category    | hours                | Rating_Category | review_count |
+----------+-----------+-------------+----------------------+-----------------+--------------+
| Wingstop | Las Vegas | Restaurants | Monday|11:00-0:00    | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Tuesday|11:00-0:00   | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Friday|11:00-0:00    | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Wednesday|11:00-0:00 | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Thursday|11:00-0:00  | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Sunday|11:00-0:00    | 2-3 Stars       |          123 |
| Wingstop | Las Vegas | Restaurants | Saturday|11:00-0:00  | 2-3 Stars       |          123 |
+----------+-----------+-------------+----------------------+-----------------+--------------+
*/

SELECT 
b.name, b.city, c.category, h.hours,
CASE
WHEN b.stars between 2 and 3 THEN '2-3 Stars'
WHEN b.stars between 4 and 5 THEN '4-5 Stars'
ELSE 'other'
END as 'Rating_Category',
b.review_count
FROM business as b 
INNER JOIN
hours as h 
on b.id = h.business_id
INNER JOIN
category as c
on b.id = c.business_id
WHERE city = 'Las Vegas'
and category = 'Restaurants'
and Rating_Category = '4-5 Stars';

/*
+---------------------+-----------+-------------+-----------------------+-----------------+--------------+
| name                | city      | category    | hours                 | Rating_Category | review_count |
+---------------------+-----------+-------------+-----------------------+-----------------+--------------+
| Jacques Cafe        | Las Vegas | Restaurants | Monday|11:00-20:00    | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Tuesday|11:00-20:00   | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Friday|11:00-20:00    | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Wednesday|11:00-20:00 | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Thursday|11:00-20:00  | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Sunday|8:00-14:00     | 4-5 Stars       |          168 |
| Jacques Cafe        | Las Vegas | Restaurants | Saturday|11:00-20:00  | 4-5 Stars       |          168 |
| Big Wong Restaurant | Las Vegas | Restaurants | Monday|10:00-23:00    | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Tuesday|10:00-23:00   | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Friday|10:00-23:00    | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Wednesday|10:00-23:00 | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Thursday|10:00-23:00  | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Sunday|10:00-23:00    | 4-5 Stars       |          768 |
| Big Wong Restaurant | Las Vegas | Restaurants | Saturday|10:00-23:00  | 4-5 Stars       |          768 |
+---------------------+-----------+-------------+-----------------------+-----------------+--------------+
*/

----------------------- Review Groups by neighborhood ------------------------------	
	
SELECT 
b.name, b.neighborhood, b.city, c.category, h.hours,
CASE
WHEN b.stars between 2 and 3 THEN '2-3 Stars'
WHEN b.stars between 4 and 5 THEN '4-5 Stars'
ELSE 'other'
END as 'Rating_Category',
b.review_count
FROM business as b 
INNER JOIN
hours as h 
on b.id = h.business_id
INNER JOIN
category as c
on b.id = c.business_id
WHERE city = 'Las Vegas'
and category = 'Restaurants';




-- 2. Grouping businesses based on the ones that are open and the ones that are closed. Are there any differences between the ones that are still open and the ones that are closed?
		

-- *FOR THIS SECOND QUESTION, I BROADENED THE RESULTS TO ANY CATEGORY WITHIN city = 'Las Vegas' to work with more data 

-- i. Difference 1:

-- Businesses still open average a better star rating by approx. 0.16 stars

/*
+---------------------+---------+
| round(avg(stars),2) | is_open |
+---------------------+---------+
|                3.52 |       0 |
|                3.68 |       1 |
+---------------------+---------+
*/         


-- ii. Difference 2:
         
     -- Businesses that are open have an average review_count over 8.5 higher than businesses that have closed 

/*
+----------------------------+---------+
| round(avg(review_count),2) | is_open |
+----------------------------+---------+
|                       23.2 |       0 |
|                      31.76 |       1 |
+----------------------------+---------+	 
*/		 
		 
         
-- SQL code used for analysis:


SELECT round(avg(stars),2), is_open
FROM business
GROUP BY is_open;



SELECT round(avg(review_count),2), is_open
FROM business
GROUP BY is_open;


	
-- i. Predicting the overall star rating for a business.

/*        
ii. 	The type of data I chose for the analysis I believe are factors that will be determinants of predicting the overall star rating for businesses. Knowing this, I decided to pull information of businesses 
		in Nevada and Arizona that label their basic location (city and state), as well as the number of reviews each business has received since opening, as I feel this will affect its overall star rating.
		I also decided to include its category as a possible factor, as well as the business hours, and perks that the business includes to see if it plays a factor in star rating.
*/


-- iii. Output of finished dataset:

/*
+----------------------------------------+-----------+-------+-------+--------------+---------------------------------+----------------------+----------------------------+
| name                                   | city      | state | stars | review_count | category                        | hours                | name                       |
+----------------------------------------+-----------+-------+-------+--------------+---------------------------------+----------------------+----------------------------+
| Ahn & Perez, DDS                       | Tempe     | AZ    |   4.5 |           13 | Dentists                        | Monday|8:00-17:00    | BusinessAcceptsCreditCards |
| All Storage - Anthem                   | Henderson | NV    |   3.5 |            3 | Automotive                      | Saturday|9:00-16:30  | BusinessAcceptsBitcoin     |
| Anthem Pediatrics                      | Las Vegas | NV    |   4.0 |           16 | Health & Medical                | Saturday|8:00-12:00  | BusinessAcceptsCreditCards |
| Back-Health Chiropractic               | Phoenix   | AZ    |   5.0 |           19 | Health & Medical                | Monday|14:30-17:00   | BusinessAcceptsCreditCards |
| Bobs Smoke Shop                        | Tempe     | AZ    |   3.5 |            3 | Local Flavor                    | Saturday|9:30-22:00  | WheelchairAccessible       |
| Bootleggers Modern American Smokehouse | Phoenix   | AZ    |   4.0 |          431 | Barbeque                        | Saturday|11:00-22:00 | WheelchairAccessible       |
| Brake Masters                          | Peoria    | AZ    |   4.0 |           22 | Automotive                      | Saturday|7:30-17:30  | BusinessAcceptsCreditCards |
| Cardiac Solutions                      | Peoria    | AZ    |   3.0 |            9 | Doctors                         | Monday|8:00-16:30    | BusinessAcceptsCreditCards |
| Charlie D's Catfish & Chicken          | Phoenix   | AZ    |   4.5 |            7 | Seafood                         | Saturday|11:00-18:00 | BusinessParking            |
| Children's Dental Center               | Las Vegas | NV    |   4.0 |           11 | Pediatric Dentists              | Monday|7:30-17:00    | BusinessAcceptsCreditCards |
| Clean Colonic                          | Tempe     | AZ    |   5.0 |            5 | Health & Medical                | Saturday|10:00-16:00 | BusinessAcceptsCreditCards |
| Dollar Mania                           | Chandler  | AZ    |   5.0 |            4 | Event Planning & Services       | Saturday|9:00-20:00  | BikeParking                |
| Extra Space Storage                    | Chandler  | AZ    |   4.0 |            5 | Home & Garden                   | Saturday|8:00-17:30  | BusinessAcceptsCreditCards |
| Five Guys                              | Phoenix   | AZ    |   3.5 |           63 | Restaurants                     | Saturday|10:00-22:00 | BusinessParking            |
| Gallagher's                            | Phoenix   | AZ    |   3.0 |           60 | Restaurants                     | Saturday|9:00-2:00   | Smoking                    |
| Ghost Armor SS Springs                 | Mesa      | AZ    |   2.0 |            3 | Mobile Phone Accessories        | Saturday|10:00-21:00 | WheelchairAccessible       |
| Health For Life: North Mesa            | Mesa      | AZ    |   4.5 |           16 | Cannabis Clinics                | Saturday|9:00-20:00  | BusinessAcceptsCreditCards |
| Hi Scores - Blue Diamond               | Las Vegas | NV    |   3.5 |          105 | Bars                            | Saturday|0:00-0:00   | Alcohol                    |
| Lifestyles Fitness Personal Training   | Tempe     | AZ    |   5.0 |           17 | Active Life                     | Saturday|5:00-21:00  | ByAppointmentOnly          |
| McDonald's                             | Phoenix   | AZ    |   2.0 |            8 | Fast Food                       | Saturday|5:00-0:00   | BusinessParking            |
| Motors & More                          | Las Vegas | NV    |   5.0 |            7 | Heating & Air Conditioning/HVAC | Saturday|8:00-12:00  | ByAppointmentOnly          |
| Nabers Music, Bar & Eats               | Chandler  | AZ    |   4.0 |           75 | Bars                            | Saturday|11:00-2:00  | Alcohol                    |
| PC Savants                             | Sun City  | AZ    |   5.0 |           11 | Mobile Phone Repair             | Saturday|11:00-18:00 | BusinessAcceptsBitcoin     |
| Pinnacle Fencing Solutions             | Phoenix   | AZ    |   4.0 |           13 | Fences & Gates                  | Monday|8:00-16:00    | ByAppointmentOnly          |
| Red Rock Canyon Visitor Center         | Las Vegas | NV    |   4.5 |           32 | Active Life                     | Saturday|8:00-16:30  | GoodForKids                |
| Wingstop                               | Las Vegas       | NV    |   3.0 |          123 | Restaurants                     | Saturday|11:00-0:00  | BusinessParking            |
| Vue at Centennial                      | Las Vegas       | NV    |   4.0 |            6 | Home Services                   | Saturday|9:00-17:00  | ByAppointmentOnly          |
| The Cider Mill                         | Scottsdale      | AZ    |   4.0 |           91 | Sandwiches                      | Saturday|10:00-20:00 | BusinessParking            |
| Sweet Ruby Jane Confections            | Las Vegas       | NV    |   4.0 |           30 | Desserts                        | Saturday|10:00-19:00 | WheelchairAccessible       |
| Starbucks                              | Phoenix         | AZ    |   3.0 |           52 | Food                            | Saturday|5:00-20:00  | RestaurantsTakeOut         |
| Standard Restaurant Supply             | Phoenix         | AZ    |   3.5 |           15 | Wholesale Stores                | Saturday|9:00-17:00  | WheelchairAccessible       |
| Springmaster Garage Door Service       | Chandler        | AZ    |   5.0 |            7 | Door Sales/Installation         | Saturday|5:00-0:00   | ByAppointmentOnly          |
| Senor Taco                             | Litchfield Park | AZ    |   3.5 |           83 | Restaurants                     | Saturday|7:00-22:00  | BusinessParking            |
| Scent From Above Company               | Scottsdale      | AZ    |   4.5 |           14 | Window Washing                  | Monday|6:00-16:00    | ByAppointmentOnly          |
*/ 


-- iv. SQL code you used to create final dataset:


SELECT b.name, b.city, b.state, b.stars, b.review_count, c.category, h.hours, a.name
FROM business as b 
INNER JOIN
category as c
on b.id = c.business_id
INNER JOIN
attribute as a 
on b.id = a.business_id
INNER JOIN
hours as h 
on b.id = h.business_id
WHERE b.state = 'NV' or b.state = 'AZ'
GROUP BY b.name;