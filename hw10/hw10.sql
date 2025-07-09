CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT parents.child as child
  FROM parents
  JOIN dogs ON parents.parent = dogs.name
  ORDER BY dogs.height DESC;



-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name as name, sizes.size as size
  FROM dogs INNER JOIN sizes 
  ON dogs.height > sizes.min AND dogs.height <= sizes.max;


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT a.child AS _first, b.child AS _second
  from parents a JOIN parents b
  ON a.parent = b.parent AND a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || siblings._first ||" and "|| siblings._second || ", have the same size: "
  || a.size AS sentence
  from siblings JOIN size_of_dogs a ON a.name = siblings._first
  JOIN size_of_dogs b ON b.name = siblings._second
  WHERE a.size = b.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT a.fur AS fur, MAX(a.height) - MIN(a.height) AS height_range
  from dogs a
  GROUP by a.fur
  HAVING MAX(a.height) <= AVG(a.height) * 1.3
  AND MIN(a.height) >= AVG(a.height) * 0.7;

