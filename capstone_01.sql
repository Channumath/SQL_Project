-- Platform used: mode.com 
-- Table used: tutorial.flights
-- Date: 11th May'25

-- Q1: List all flights with a departure delay greater than 30 minutes.
select *                    -- Multiple column selection 
from tutorial.flights 
where departure_delay>30;   -- deperature delay of more than 30 min

-- Q2: Count the number of flights per destination city. Sort the result by highest flight count first. 
select destination_city, count(*) as flight_count
from tutorial.flights 
group by destination_city
order by flight_count desc;  -- highest flight count should come at top 

-- Q3: Find flights that arrived early (arrival delay < 0).
select *
from tutorial.flights 
where arrival_delay<0;

-- Q4: Calculate the average flight distance.
select avg(distance) as avg_distance
from tutorial.flights;

-- Q5: List the top 5 origin airports by flight count.
select origin_airport, count(*) as flight_count 
from tutorial.flights
group by origin_airport 
order by flight_count
limit 5;       -- top 5 flight count 

-- Q6: Find flights with air traffic control delays.
select *
from tutorial.flights
where air_traffic_delay>0; 

-- Q7: Calculate the total actual flight time for all flights.
select sum(actual_flight_time) as total_flight_time
from tutorial.flights;

-- Q8: List flights with a distance less than 500 miles.
select * 
from tutorial.flights
where distance<500;

-- Q9: Find the flight with the longest actual flight time.
-- Method 1 (Using subquery)
select * 
from tutorial.flights 
where actual_flight_time = (select max(actual_flight_time) from tutorial.flights);
-- Method 2 (Using CTE & Subquery)
with cte as 
(select max(actual_flight_time) as longest_actual_flight_time from tutorial.flights)
select * from tutorial.flights where actual_flight_time = (select longest_actual_flight_time from cte);

-- Q10: Count flights by destination state.
SELECT destination_state,
       COUNT(*) as flight_count
FROM tutorial.flights
GROUP BY destination_state;

-- Q11: List flights where the actual flight time differs from the scheduled flight time by more than 10 minutes.
select *
from tutorial.flights
where abs(actual_flight_time - scheduled_flight_time) > 10;

-- Q12: Find flights with no delays (both departure and arrival delays are 0 or negative).
select *
from tutorial.flights 
where departure_delay <= 0 and arrival_delay<=0;

-- Q13: Calculate the average arrival delay per origin airport.
select origin_airport, avg(arrival_delay) as avg_arrival_delay
from tutorial.flights 
group by origin_airport;

-- Q14: List flights with a carrier delay greater than 0
select *
from tutorial.flights 
where carrier_delay > 0;

-- Q15: Find the shortest scheduled flight time.
select min(scheduled_flight_time)
from tutorial.flights;

-- Q16: List flights with a positive arrival delay.
select *
from tutorial.flights 
where arrival_delay > 0;

-- Q17: Count flights by origin state.
select origin_state, count(*) as flight_count 
from tutorial.flights 
group by origin_state;

-- Q18: Find flights with a distance greater than 2000 miles.
select * 
from tutorial.flights
where distance>2000;

-- Q19: Calculate the maximum arrival delay.
select max(arrival_delay) as max_arrival_delay
from tutorial.flights;

-- Q20: List flights with no cancellation.
select * 
from tutorial.flights 
where was_cancelled=false;

-- Q21: Calculate the average air time per flight.
select flight_number, avg(air_time) as avg_air_time 
from tutorial.flights
group by flight_number; 

-- Q22: Find flights with a scheduled departure time before 8 AM.
select * 
from tutorial.flights 
where scheduled_departure_time<800;

-- Q23: Count flights per airline code.
select airline_code, count(*) as flight_count 
from tutorial.flights 
group by airline_code;

-- Q24: List flights with a late aircraft delay greater than 0.
select *
from tutorial.flights 
where late_aircraft_delay>0;

-- Q25: Calculate the total distance flown.
select sum(distance) as total_distance_flown
from tutorial.flights;

-- Q26: Find flights with a scheduled arrival time after 10 PM.
select * 
from tutorial.flights 
where scheduled_arrival_time>2200;

-- Q27: List flights with a flight number between 2450 and 2500.
select * 
from tutorial.flights 
where flight_number between 2450 and 2500;

-- Q28: Calculate the average departure delay.
select avg(departure_delay) as avg_departure_delay
from tutorial.flights;

-- Q29: Find flights with a security delay greater than 0.
select *
from tutorial.flights 
where security_delay>0;

-- Q30: List flights sorted by distance in descending order.
select * 
from tutorial.flights 
order by distance desc;

-- Q31: Find round-trip flights (same origin and destination airports).
-- Hint: Use self join 
-- DEL TO MUMBAI, MUMBAI TO DEL (ROUND TRIP FLIGHT EXAMPLE)
-- MUMBAI TO DEL, DEL TO MUMBAI,
-- A-> B, B-> A: B->A, A->B
SELECT f1.flight_number, f1.origin_airport, f1.destination_airport
FROM tutorial.flights f1
JOIN tutorial.flights f2 
on f1.origin_airport=f2.destination_airport AND f1.destination_airport = f2.origin_airport AND f1.flight_number<f2.flight_number;

-- Q32: Calculate the average departure delay by destination city.
select destination_city, avg(departure_delay) as avg_departure_delay
from tutorial.flights 
group by destination_city;

-- Q33: Find total arrival and departure delay for all flights 
select (arrival_delay + departure_delay) as total_arrival_dep_delay
from tutorial.flights; 

-- Q34: Find the top 3 routes (origin to destination) by flight count.
SELECT origin_airport, 
       destination_airport, 
       COUNT(*) AS flight_count
FROM tutorial.flights
GROUP BY origin_airport, destination_airport
order by flight_count desc
LIMIT 3;

-- Q35: Calculate the percentage of flights delayed (arrival delay > 0)
select round(count(case when arrival_delay>0 then 1 end)*100/count(*),2) as percentage_delayed_flights 
from tutorial.flights;

-- Q36: List flights where the air time is less than 90% of the actual flight time.
select *
from  tutorial.flights
where air_time < 0.9*actual_flight_time;

-- Q37: Find flights with a weather delay and their origin state.
select flight_number, origin_state, weather_delay
from  tutorial.flights
where weather_delay > 0;

-- Q38: Calculate the total distance flown by flights originating from Atlanta.
select sum(distance) as total_distance_flow 
from tutorial.flights
where origin_city= 'Atlanta';

-- Q39: List flights where the actual arrival time is earlier than the scheduled arrival time.
select *
from tutorial.flights
where actual_arrival_time < schedued_arrival_time;

-- Q40: Find the average flight time for flights over 1000 miles.
select avg(air_time) as avg_flight_time 
from tutorial.flights
where distance>1000;

-- Q41: List flights with the same origin and destination state.
select *
from tutorial.flights
where origin_state = destination_state;

-- Q42: Calculate the maximum departure delay per origin airport.
select origin_airport, max(departure_delay) as max_dep_delay
from tutorial.flights
group by origin_airport; 

-- Q43: List flights sorted by total delay (arrival + departure).
select (arrival_delay + departure_delay) as total_arrival_dep_delay
from tutorial.flights
order by total_arrival_dep_delay; 

-- Q44: Find flights with a departure delay but no arrival delay.
select *
from tutorial.flights
where departure_delay > 0 and arrival_delay <= 0;

-- Q45: Calculate the average distance by origin city.
select origin_city, avg(distance) as avg_distance
from tutorial.flights
group by origin_city; 

-- Q46: List flights with actual flight time less than scheduled flight time
select *
from tutorial.flights
where actual_flight_time < schedued_flight_time;

-- Q47: Find the top 5 destination airports by total distance flown.
select destination_airport, sum(distance) as total_distance_flown 
from tutorial.flights
group by destination_airport
order by total_distance_flown desc 
limit 5;

-- Q48: Calculate the percentage of flights with any delay type.
select round(count(case when arrival_delay + weather_delay + carrier_delay + late_aircraft_delay + air_traffic_delay + security_delay > 0 then 1 end)*100/count(*),2) as percentage_delayed_flights 
from tutorial.flights;
