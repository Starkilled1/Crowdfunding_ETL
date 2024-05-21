CREATE TABLE CATEGORY (
    category_id VARCHAR(30) NOT NULL,
    category VARCHAR(30) NOT NULL,
    CONSTRAINT pk_CATEGORY PRIMARY KEY (category_id)
);

CREATE TABLE SUBCATEGORY (
    subcategory_id VARCHAR(30) NOT NULL,
    subcategory VARCHAR(30) NOT NULL,
    CONSTRAINT pk_SUBCATEGORY PRIMARY KEY (subcategory_id)
);


CREATE TABLE CAMPAIGN (
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    goal DECIMAL NOT NULL,
    pledged DECIMAL NOT NULL,
    outcome VARCHAR(30) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(30) NOT NULL,
    currency VARCHAR(30) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    staff_pick BOOLEAN NOT NULL,
    spotlight BOOLEAN NOT NULL,
    category_subcategory VARCHAR(100) NOT NULL,
    category_id VARCHAR(30) NOT NULL,
    subcategory_id VARCHAR(30) NOT NULL,
    CONSTRAINT pk_CAMPAIGN PRIMARY KEY (cf_id)
);

CREATE TABLE CONTACTS (
    contact_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT pk_CONTACTS PRIMARY KEY (contact_id)
);

-- Making the foreign keys relation after the tables are created 
ALTER TABLE CAMPAIGN ADD CONSTRAINT fk_CAMPAIGN_contact_id FOREIGN KEY (contact_id)
REFERENCES CONTACTS (contact_id);

ALTER TABLE CAMPAIGN ADD CONSTRAINT fk_CAMPAIGN_category_id FOREIGN KEY (category_id)
REFERENCES CATEGORY (category_id);

ALTER TABLE CAMPAIGN ADD CONSTRAINT fk_CAMPAIGN_subcategory_id FOREIGN KEY (subcategory_id)
REFERENCES SUBCATEGORY (subcategory_id);

-- IMPORT CSV FILES to each table IMPORTANT: CHANGE THE PATH OF EACH FILE BEFORE RUNNING THIS SECTION 
COPY CATEGORY FROM 'C:\Users\Javier Alarcon\Desktop\BOOTCAMP\Week13\Project_2\Crowdfunding_ETL\Resources\category.csv' DELIMITER ',' CSV HEADER;
COPY SUBCATEGORY FROM 'C:\Users\Javier Alarcon\Desktop\BOOTCAMP\Week13\Project_2\Crowdfunding_ETL\Resources\subcategory.csv' DELIMITER ',' CSV HEADER;
COPY CONTACTS FROM 'C:\Users\Javier Alarcon\Desktop\BOOTCAMP\Week13\Project_2\Crowdfunding_ETL\Resources\contacts.csv' DELIMITER ',' CSV HEADER;
COPY CAMPAIGN FROM 'C:\Users\Javier Alarcon\Desktop\BOOTCAMP\Week13\Project_2\Crowdfunding_ETL\Resources\campaign.csv' DELIMITER ',' CSV HEADER;

-- Verify CATEGORY table data
SELECT * FROM CATEGORY;

-- Verify SUBCATEGORY table data
SELECT * FROM SUBCATEGORY;

-- Verify CONTACTS table data
SELECT * FROM CONTACTS;

-- Verify CAMPAIGN table data
SELECT * FROM CAMPAIGN;

-- TEST query to see foreign keys
SELECT
    c.cf_id,
    c.contact_id,
    c.company_name,
    c.description,
    c.goal,
    c.pledged,
    c.outcome,
    c.backers_count,
    c.country,
    c.currency,
    c.launch_date,
    c.end_date,
    c.staff_pick,
    c.spotlight,
    cat.category AS category_name,
    sub.subcategory AS subcategory_name
FROM
    CAMPAIGN c
JOIN
    CATEGORY cat ON c.category_id = cat.category_id
JOIN
    SUBCATEGORY sub ON c.subcategory_id = sub.subcategory_id;