CREATE TABLE finals AS
  SELECT "RSF" AS hall, "61A" as course UNION
  SELECT "Wheeler"    , "61A"           UNION
  SELECT "Pimentel"   , "61A"           UNION
  SELECT "Li Ka Shing", "61A"           UNION
  SELECT "Stanley"    , "61A"           UNION
  SELECT "RSF"        , "61B"           UNION
  SELECT "Wheeler"    , "61B"           UNION
  SELECT "Morgan"     , "61B"           UNION
  SELECT "Wheeler"    , "61C"           UNION
  SELECT "Pimentel"   , "61C"           UNION
  SELECT "Soda 310"   , "61C"           UNION
  SELECT "Soda 306"   , "10"            UNION
  SELECT "RSF"        , "70";

CREATE TABLE sizes AS
  SELECT "RSF" AS room, 900 as seats    UNION
  SELECT "Wheeler"    , 700             UNION
  SELECT "Pimentel"   , 500             UNION
  SELECT "Li Ka Shing", 300             UNION
  SELECT "Stanley"    , 300             UNION
  SELECT "Morgan"     , 100             UNION
  SELECT "Soda 306"   , 80              UNION
  SELECT "Soda 310"   , 40              UNION
  SELECT "Soda 320"   , 30;

CREATE TABLE sharing AS
  SELECT a.course AS course, COUNT(DISTINCT b.hall) AS shared
  FROM finals a JOIN finals b ON a.hall = b.hall 
  AND a.course != b.course
  GROUP BY a.course;

CREATE TABLE pairs AS
  SELECT a.room || " and " || b.room ||" together have " || (a.seats + b.seats) ||" seats" AS rooms
  FROM sizes a JOIN sizes b ON a.room < b.room
  AND a.seats + b.seats >= 1000
  ORDER BY (a.seats + b.seats) DESC;

CREATE TABLE big AS
  SELECT finals.course AS course
  from finals JOIN sizes ON finals.hall = sizes.room
  GROUP BY finals.course
  HAVING SUM(sizes.seats) >= 1000;

CREATE TABLE remaining AS
  SELECT finals.course AS course, 
  (SUM(sizes.seats) - MAX(sizes.seats)) AS remaining
  from finals JOIN sizes ON finals.hall = sizes.room
  GROUP BY finals.course;

