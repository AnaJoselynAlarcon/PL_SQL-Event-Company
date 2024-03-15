DROP TABLE ata_performance;
DROP TABLE ata_contract;
DROP TABLE ata_client;
DROP TABLE ata_entertainers_style;
DROP TABLE ata_musical_style;
DROP TABLE ata_entertainer;
DROP TABLE ata_agent;

CREATE TABLE ata_agent (
agent_id             VARCHAR2(7),
last_name            VARCHAR2(25),
first_name           VARCHAR2(25),
date_of_hire         DATE,
home_phone           VARCHAR2(10),
business_phone       VARCHAR2(10));

CREATE TABLE  ata_client (
client_id            VARCHAR2(7),
last_name            VARCHAR2(25),
first_name           VARCHAR2(25),
home_phone           VARCHAR2(10),
business_phone       VARCHAR2(10),
agent_id             VARCHAR2(7));

CREATE TABLE ata_entertainer (
entertainer_id       VARCHAR2(7),
last_name            VARCHAR2(25),
first_name           VARCHAR2(25),
home_phone           VARCHAR2(10),
type_of_entertainer  VARCHAR2(20),
agent_id             VARCHAR2(7));

CREATE TABLE ata_contract (
contract_number      NUMBER,
entertainer_id       VARCHAR2(7),
client_id            VARCHAR2(7),
event_type           VARCHAR2(20),
fee                  NUMBER(8,2));

CREATE TABLE ata_performance (
contract_number      NUMBER,
performance_date     DATE,
start_time           DATE,
stop_time            DATE);


CREATE TABLE ata_musical_style (
style_code           VARCHAR2(5),
style                VARCHAR2(20));

CREATE TABLE ata_entertainers_style (
entertainer_id       VARCHAR2 (7),
style_code           VARCHAR2 (5));


