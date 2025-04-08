# dbt-postgresql-analytics-northwind

This is a dbt (Data Build Tool) project that implements a data pipeline for transforming and analyzing the **Northwind** dataset using **PostgreSQL**. The project includes staging, intermediate, and dimensional models to structure raw sales and product data into meaningful insights for business intelligence and reporting.

## Project Structure

The project is organized into different directories and models:

- **Staging Models**: Raw data transformation for tables like customers, orders, and products.
- **Intermediate Models**: Enriched or aggregated data models to prepare for dimensional modeling.
- **Dimensional Models**: Structured data models like dimensions (e.g., customer, product) and fact tables (e.g., sales).
- **Tests**: Data quality tests to ensure that models meet business requirements.
- **Documentation**: Automatically generated documentation for the models, including descriptions, tests, and schema information.

## Setup

### Prerequisites

Before you can run this project, make sure you have the following installed:

- **dbt**: You can install dbt using pip or brew. Follow the instructions on the [dbt documentation](https://docs.getdbt.com/dbt-cli/installation).
- **PostgreSQL**: This project uses PostgreSQL as the data warehouse.
- **Virtual Environment** (optional but recommended): You can set up a virtual environment for better package management.

### Installation Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/dbt-postgresql-analytics-northwind.git
   cd dbt-postgresql-analytics-northwind
   ```

2. **Create and activate a virtual environment (optional but recommended):**

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use venv\Scripts\activate
   ```

3. **Install dependencies:**

   Install dbt and other necessary dependencies (such as PostgreSQL adapter):

   ```bash
   pip install dbt-postgres
   ```

4. **Configure your database connection:**

   Create or modify the `profiles.yml` file, which contains the connection details for your PostgreSQL instance. You can create the `profiles.yml` file in `~/.dbt/` (on Linux/macOS) or `C:\Users\<your_user>\.dbt\` (on Windows).

   Example configuration:

   ```yaml
   my_profile:
     target: dev
     outputs:
       dev:
         type: postgres
         host: localhost
         user: your_user
         password: your_password
         dbname: northwind
         schema: public
         port: 5432
   ```

5. **Run dbt to set up the models:**

   To run the dbt models and create the transformations, use the following command:

   ```bash
   dbt run --models stg_customer, stg_orderdetail, stg_product, stg_salesorder
   dbt run --models int_sales_enriched
   dbt run --models dim_customers, dim_products, fact_sales
   ```

6. **Generate Documentation:**

   To generate the documentation for the dbt project:

   ```bash
   dbt docs generate
   dbt docs serve  # Open the docs in your browser
   ```

### Running Tests

You can run the data quality tests defined in your models with the following command:

```bash
dbt test
```

This will run all the tests that you have specified in your `schema.yml` files.

## Features

- **Data Transformation**: Raw data is transformed and cleaned using dbt models.
- **Business Intelligence Ready**: The final output models (dimensional models and facts) are ready for use in business intelligence tools.
- **Data Quality**: Built-in data tests ensure the integrity of the transformed data.
- **Documentation**: Automatically generated docs for the project, providing an overview of the data models, tests, and transformations.

## Folder Structure

```
dbt-postgresql-analytics-northwind/
│
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── dimensions/
│   └── facts/
│
├── target/           # Compiled SQL, logs, etc. (Do not commit)
├── logs/             # dbt logs (Do not commit)
├── .dbt/             # dbt artifacts (Do not commit)
├── dbt_project.yml   # dbt project configuration
└── .gitignore        # Ignored files (e.g., virtual environment, logs, etc.)
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
