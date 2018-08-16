/*
==============================================================================================================
Create all the users & groups we need.
This only needs to be done once per cluster
Users are created for the whole cluster, i.e. not tied to a schema.
Non-superuser users
Need to be granted rights
 Tables, databases, and schemas have different types of rights.
You need to set a SELECT right on a table before the user can query it.
==============================================================================================================

SELECT *
  FROM PG_GROUP
 ORDER BY grosysid;

SELECT *
  FROM PG_USER
 ORDER BY usesysid;

*/

-- ============================================
-- Create DataKitchen User Groups
-- ============================================
CREATE GROUP dk_system;
CREATE GROUP dk_users;

-- CREATEUSER - Can create a super user
-- CREATEDB   - Can create databases

-- ============================================
-- Create DataKitchen Automated Redshift Users
-- ============================================
CREATE USER dk_test
WITH PASSWORD '4S^7Of498feuc' CREATEUSER CREATEDB;

CREATE USER dk_reporting
WITH PASSWORD '3q#*47F5XC&k46' CREATEUSER CREATEDB;

CREATE USER dk_production
WITH PASSWORD 'Biking2lion' CREATEUSER CREATEDB;

CREATE USER dk_chef
WITH PASSWORD 'Skipping3otter' CREATEUSER CREATEDB;

CREATE USER dk_prod_covance_highway
WITH PASSWORD 'Dancing8badger' CREATEUSER CREATEDB;


-- ============================================
-- Create DataKitchen Human Redshift Users
-- ============================================
CREATE USER eric  --	Eric Estabrooks	eestabrooks@datakitchen.io
WITH PASSWORD 'Swimming4goats' CREATEUSER CREATEDB;

CREATE USER lmenzin  -- Larry Menzin lmenzin@datakitchen.io
WITH PASSWORD 'QuicklyExpressionWestSlope11' CREATEUSER CREATEDB;

CREATE USER gil  --	Gil	Benghiat gil@datakitchen.io
WITH PASSWORD 'Reading3cats' CREATEUSER CREATEDB;

CREATE USER chris  --	Chris Bergh cbergh@datakitchen.io
WITH PASSWORD 'Working5fish' CREATEUSER CREATEDB;

CREATE USER larry  --	Larry Tympanick ltympanick@datakitchen.io
WITH PASSWORD 'Booming6oryx' CREATEUSER CREATEDB;


-- ============================================
-- Add DataKitchen Redshift Users to Groups
-- ============================================
ALTER GROUP dk_system ADD USER dk_test;
ALTER GROUP dk_system ADD USER dk_reporting;
ALTER GROUP dk_system ADD USER dk_production;
ALTER GROUP dk_system ADD USER dk_chef;

ALTER GROUP dk_users ADD USER eric;
ALTER GROUP dk_users ADD USER lmenzin;
ALTER GROUP dk_users ADD USER gil;
ALTER GROUP dk_users ADD USER chris;
ALTER GROUP dk_users ADD USER larry;
