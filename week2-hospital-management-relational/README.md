# Week 2 — Hospital Management System (Relational Database Design)

## Objective
Design and implement a fully normalized relational database for a fictional Hospital Management System scenario, moving from an unnormalized flat table through the complete normalization process, then implementing and querying the schema.

## Tools & Technologies
- **Database:** MySQL, hosted on TiDB Cloud Serverless (free tier)
- **Diagramming:** LucidChart
- **Presentation:** PowerPoint

## Approach
1. Started from an unnormalized (UNF) flat table of hospital data and progressively decomposed it through 1NF, 2NF, and 3NF, producing a LucidChart page for each stage.
2. Built the final ER diagram reflecting the 3NF schema (Patients, Appointments, Billing, Staff, and related entities).
3. Wrote the full MySQL script: `CREATE TABLE` statements with primary/foreign keys, `INSERT` statements with sample data, and 8+ advanced `SELECT` queries covering joins, aggregates (`AVG`, `MIN`, `MAX`), `GROUP BY`/`HAVING`, and `UPDATE`/`DELETE` operations.
4. Built a dedicated query script demonstrating `LEFT JOIN` and `RIGHT JOIN` behavior with intentionally unmatched records to show `NULL` handling.

## Challenges & Solutions
- **TiDB Cloud Serverless blocks `CREATE DATABASE`, `DROP DATABASE`, and multi-statement batch execution** in its free-tier SQL Editor. Solved by using the pre-existing `test` database and running each statement individually in sequence rather than as a batch.
- **Foreign key dependency ordering:** the `Rentals`/`Appointments`-style dependent tables had to be dropped before their parent tables (`Patients`, `Staff`) to avoid constraint violations.
- **Normalization misconception caught early:** the initial flat table was correctly identified as UNF, not 1NF — an important distinction, since 1NF should not yet split the table into separate entities.

## Outcome
A working, referentially-intact 3NF relational database with a complete query suite, documented across a 23-slide PowerPoint presentation covering the design rationale, normalization steps, and query results.

## Diagrams & Presentation
- **LucidChart ERD:** [`Hospital Management ERD.png`](./Hospital%20Management%20ERD.png)

  ![Hospital Management ERD](./Hospital%20Management%20ERD.png)
- **PowerPoint:** [`Hospital Management System.pptx`](./Hospital%20Management%20System.pptx)

## Scripts & Queries
- **MySQL script:** [`SQL_SCRIPTS.sql`](./SQL_SCRIPTS.sql) — table creation, sample data, and all SELECT/JOIN/aggregate queries

## Career Relevance
This project is the foundation of database administration: schema design, normalization, and SQL querying are core, non-negotiable DBA skills. Working through TiDB's free-tier execution constraints also mirrors real-world situations where a DBA must work within a managed cloud database's platform limitations.
