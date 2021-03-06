-- Current Supported types for MODULO distribution column types - INT2, integer, INT4, BOOL, ABSTIME, RELTIME,DATE  

-- However INT8 type should also be supported, currently it is not. 

--INT8, 

CREATE TABLE xl_dcm (
    product_no integer,
    product_id INT8 PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_id);

--integer
CREATE TABLE xl_dcm0 (
    product_no integer,
    product_id integer PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_id);


--INT2, 


CREATE TABLE xl_dcm1 (
    product_no integer,
    product_id INT2 PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_id);

--OID, 
CREATE TABLE xl_dcm2 (
    product_no integer,
    product_id OID PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_id);

--INT4, 
CREATE TABLE xl_dcm3 (
    product_no integer,
    product_id INT4 PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_id);

--BOOL, 

CREATE TABLE xl_dcm4 (
    product_no integer,
    is_available BOOL PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (is_available);

--INT2VECTOR, 
CREATE TABLE xl_dcm5 (
    product_no integer,
    product_id integer,
    sub_product_ids INT2VECTOR PRIMARY KEY, 
    name text,
    price numeric
) DISTRIBUTE BY MODULO (sub_product_ids);

--OIDVECTOR, 
CREATE TABLE xl_dcm6 (
    product_no integer,
    product_id integer,
    sub_product_ids OIDVECTOR PRIMARY KEY, 
    name text,
    price numeric
) DISTRIBUTE BY MODULO (sub_product_ids);

--CHAR, 
CREATE TABLE xl_dcm7 (
    product_no integer,
    product_group CHAR PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_group);

--NAME, 
CREATE TABLE xl_dcm8 (
    product_no integer,
    product_name NAME PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_name);

--TEXT, 
CREATE TABLE xl_dcm9 (
    product_no integer,
    product_name TEXT PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_name);


--BPCHAR - blank padded char, 
CREATE TABLE xl_dcm10 (
    product_no integer,
    product_group BPCHAR PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_group);

--BYTEA - variable length binary string, 
CREATE TABLE xl_dcm11 (
    product_no integer,
    product_group BYTEA PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_group);

--VARCHAR, 
CREATE TABLE xl_dcm12 (
    product_no integer,
    product_group VARCHAR PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_group);

--NUMERIC, 
CREATE TABLE xl_dcm15 (
    product_no integer,
    product_id NUMERIC PRIMARY KEY,
    name text,
    price numeric
) DISTRIBUTE BY MODULO (product_id);

--MONEY - String datatype, 
CREATE TABLE xl_dcm16 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (name);

--ABSTIME, 
CREATE TABLE xl_dcm17 (
    product_no integer,
    product_id NUMERIC ,
    purchase_date ABSTIME PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date);

--RELTIME, 
CREATE TABLE xl_dcm18 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date RELTIME PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date);


--DATE, 
CREATE TABLE xl_dcm19 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date DATE PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date);

--TIME, 
CREATE TABLE xl_dcm20 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIME PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date);

--TIMESTAMP,

CREATE TABLE xl_dcm21 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMESTAMP PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date); 

--TIMESTAMPTZ, 

CREATE TABLE xl_dcm22 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMESTAMPTZ PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date); 

--INTERVAL, 
CREATE TABLE xl_dcm23 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date INTERVAL PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date); 

--and TIMETZ - time along with time zone
CREATE TABLE xl_dcm24 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMETZ PRIMARY KEY,
    price numeric
) DISTRIBUTE BY MODULO (purchase_date); 

--Distribution strategy can specify on a single column
CREATE TABLE xl_dcm25 (
    product_no integer,
    product_id NUMERIC ,
    name MONEY,
    purchase_date TIMETZ,
    price numeric,
    primary key(product_no, product_id)
) DISTRIBUTE BY MODULO (product_no, product_id); --fail

-- Distribution column value cannot be updated
-- default distributed on HASH by primary key column, i.e. city
CREATE TABLE xl_dcm_weather (
    city_no         INT2 PRIMARY KEY,
    temp_lo         int,           -- low temperature
    temp_hi         int,           -- high temperature
    prcp            real,          -- precipitation
    date            date
) DISTRIBUTE BY MODULO (city_no);

INSERT INTO xl_dcm_weather VALUES (55, 46, 50, 0.25, '1994-11-27');

UPDATE xl_dcm_weather SET city_no = 56 where temp_lo=46 and temp_hi=50; -- fail

DROP TABLE xl_dcm;
DROP TABLE xl_dcm1;
DROP TABLE xl_dcm2;
DROP TABLE xl_dcm3;
DROP TABLE xl_dcm4;
DROP TABLE xl_dcm5;
DROP TABLE xl_dcm6;
DROP TABLE xl_dcm7;
DROP TABLE xl_dcm8;
DROP TABLE xl_dcm9;
DROP TABLE xl_dcm10;
DROP TABLE xl_dcm11;
DROP TABLE xl_dcm12;
DROP TABLE xl_dcm15;
DROP TABLE xl_dcm16;
DROP TABLE xl_dcm17;
DROP TABLE xl_dcm18;
DROP TABLE xl_dcm19;
DROP TABLE xl_dcm20;
DROP TABLE xl_dcm21;
DROP TABLE xl_dcm22;
DROP TABLE xl_dcm23;
DROP TABLE xl_dcm24;
DROP TABLE xl_dcm25;
DROP TABLE xl_dcm_weather;




