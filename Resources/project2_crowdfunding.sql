-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hsuusS
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE IF EXISTS campagin, category, contacts, subcategory CASCADE;

CREATE TABLE campagin (
    cf_id int   NOT NULL,
    contact_id int   NOT NULL,
    company_id int   NOT NULL,
    description varchar(256)   NOT NULL,
    goal int   NOT NULL,
    pledged int   NOT NULL,
    backers_count int   NOT NULL,
    country varchar(24)  NOT NULL,
    currency varchar(24)   NOT NULL,
    launch_date date   NOT NULL,
    end_date date   NOT NULL,
    category_id varchar(64)   NOT NULL,
    subcategory_id varchar(64)   NOT NULL,
    CONSTRAINT pk_Campaign PRIMARY KEY (
        cf_id
     )
);

CREATE TABLE category (
    category_id varchar(64)   NOT NULL,
    categories varchar(64)   NOT NULL,
    CONSTRAINT pk_Category PRIMARY KEY (
        category_id
     )
);

CREATE TABLE contacts (
    contact_id int   NOT NULL,
    first_name varchar(256)   NOT NULL,
    last_name varchar(256)   NOT NULL,
    email varchar(256)   NOT NULL,
    CONSTRAINT pk_Contacts PRIMARY KEY (
        contact_id
     )
);

CREATE TABLE subcategory(
    subcategory_id varchar(64)   NOT NULL,
    subcategories varchar(64)   NOT NULL,
    CONSTRAINT pk_Subcategory PRIMARY KEY (
        subcategory_id
     )
);

ALTER TABLE campagin ADD CONSTRAINT fk_campaign_contact_id FOREIGN KEY(contact_id)
REFERENCES contacts (contact_id);

ALTER TABLE campagin ADD CONSTRAINT fk_campaign_category_id FOREIGN KEY(category_id)
REFERENCES category (category_id);

ALTER TABLE campagin ADD CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY(subcategory_id)
REFERENCES subcategory (subcategory_id);

