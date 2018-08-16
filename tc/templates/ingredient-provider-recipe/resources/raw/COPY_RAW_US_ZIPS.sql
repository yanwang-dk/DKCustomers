set search_path to $redshiftschema;

--
drop table if exists {{ ziptablename }} cascade;
CREATE TABLE {{ ziptablename }}
(
  ZIP                   VARCHAR(5),
  ZIP_NUMBER            INTEGER,
  ZIP_TYPE              VARCHAR(10),
  PRIMARY_CITY          VARCHAR(100),
  ACCEPTABLE_CITIES     VARCHAR(1000),
  UNACCEPTABLE_CITIES   VARCHAR(2500),
  STATE                 VARCHAR(5),
  COUNTY                VARCHAR(100),
  TIMEZONE              VARCHAR(100),
  AREA_CODES            VARCHAR(100),
  LATITUDE              NUMERIC(14,3),
  LONGITUDE             NUMERIC(14,3),
  WORLD_REGION          VARCHAR(5),
  COUNTRY               VARCHAR(5),
  DECOMMISSIONED        INTEGER,
  ESTIMATED_POPULATION  INTEGER,
  NOTES                 VARCHAR(1000)
);

copy {{ ziptablename }}
from 's3://$bucketname/raw/us-zips/all-zips/$allzipsdate/'
credentials 'aws_access_key_id=$s3accesskey;aws_secret_access_key=$s3secretkey'
TRIMBLANKS delimiter '|';


SELECT COUNT (*) FROM {{ ziptablename }};
