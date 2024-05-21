# Crowdfunding_ETL


## Overview

This repository contains the final deliverables for the Crowdfunding ETL project. The project involved building an ETL pipeline using Python and Pandas to extract and transform crowdfunding data, and then load it into a PostgreSQL database. The project is divided into several steps, including the creation of DataFrames for categories, subcategories, campaigns, and contacts.

## Files in Repository

- `ETL_Mini_Project_Ecastillo_JAlarcon.ipynb`: The final Jupyter notebook containing the complete ETL process.
- `Resources/`
  - `category.csv`: CSV file containing the transformed category data.
  - `subcategory.csv`: CSV file containing the transformed subcategory data.
  - `campaign.csv`: CSV file containing the transformed campaign data.
  - `contacts.csv`: CSV file containing the transformed contacts data.
- `crowdfunding_db_schema.sql`: SQL file containing the schema for the PostgreSQL database.

## Project Steps

### 1. Create the Category and Subcategory DataFrames

Extracted and transformed the `crowdfunding.xlsx` Excel data to create:
- **Category DataFrame** with the following columns:
  - `category_id`: Sequential entries from "cat1" to "catn", where n is the number of unique categories.
  - `category`: Contains only the category titles.

  The category DataFrame was exported as `category.csv`.

- **Subcategory DataFrame** with the following columns:
  - `subcategory_id`: Sequential entries from "subcat1" to "subcatn", where n is the number of unique subcategories.
  - `subcategory`: Contains only the subcategory titles.

  The subcategory DataFrame was exported as `subcategory.csv`.

### 2. Create the Campaign DataFrame

Extracted and transformed the `crowdfunding.xlsx` Excel data to create a campaign DataFrame with the following columns:
- `cf_id`
- `contact_id`
- `company_name`
- `description` (renamed from "blurb")
- `goal` (converted to the float data type)
- `pledged` (converted to the float data type)
- `outcome`
- `backers_count`
- `country`
- `currency`
- `launch_date` (converted from "launched_at" to the datetime format)
- `end_date` (converted from "deadline" to the datetime format)
- `category_id` (matching the unique identification numbers in the "category_id" column of the category DataFrame)
- `subcategory_id` (matching the unique identification numbers in the "subcategory_id" column of the subcategory DataFrame)

The campaign DataFrame was exported as `campaign.csv`.

### 3. Create the Contacts DataFrame

Option 1: Using Python dictionary methods
- Imported the `contacts.xlsx` file into a DataFrame.
- Iterated through the DataFrame, converting each row to a dictionary.
- Extracted dictionary values using a Python list comprehension.
- Created a new DataFrame with the extracted data.
- Split the "name" column values into "first_name" and "last_name" columns.
- Cleaned and exported the DataFrame as `contacts.csv`.

### 4. Create the Crowdfunding Database

1. **Database Schema**:
   - Created an ERD of the tables.
   - Defined the table schema, including data types, primary keys, foreign keys, and constraints.
   - Saved the schema as `crowdfunding_db_schema.sql`.

2. **Database Creation**:
   - Created a new PostgreSQL database named `crowdfunding_db`.
   - Used the schema file to create the tables.
   - Imported each CSV file into its corresponding table. `IMPORTANT TO CHANGE THE FILE PATH`

3. **Verification**:
   - Verified the table creation and data import by running `SELECT` statements for each table.

## Verification SQL Statements

To verify the table creation and data import, use the following `SELECT` statements:

```sql
SELECT * FROM CATEGORY;
SELECT * FROM SUBCATEGORY;
SELECT * FROM CONTACTS;
SELECT * FROM CAMPAIGN;
```
