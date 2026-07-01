# Week 3 — Gaming Leaderboard (NoSQL / DynamoDB)

## Objective
Design and implement a NoSQL data model for a gaming leaderboard system that tracks players, games, and scores, demonstrating hands-on CRUD operations in Amazon DynamoDB.

## Tools & Technologies
- **Database:** Amazon DynamoDB Local
- **Interface:** NoSQL Workbench, AWS CLI
- **Diagramming:** LucidChart
- **Presentation:** PowerPoint (built with pptxgenjs)

## Approach
1. Applied an **access-pattern-first design** (following Rick Houlihan's DynamoDB modeling principles): identified the queries the application needed to answer before designing the tables.
2. Modeled three separate tables — **Players**, **Games**, and **Scores** — rather than a single-table design, a deliberate choice explained in the presentation as more appropriate and explainable for a beginner-level assignment.
3. Configured a Global Secondary Index (GSI) on score/region attributes to support leaderboard ranking queries.
4. Performed all CRUD operations — Put, Get, and Delete — through NoSQL Workbench's Operation Builder, with AWS CLI used for bulk data loading (`load_data.sh`).
5. Custom player names (including my own username, ShadyWeah) and game titles were used throughout the sample data.

## Challenges & Solutions
- **No AWS account:** used DynamoDB Local (the official local, license-free version of DynamoDB) as a fully equivalent substitute for a live AWS deployment.
- **`ValidationException` on every operation:** traced to a trailing space in the `playerId` partition key name; fixed by deleting and recreating the table via CLI with the exact key name.
- **GSI configuration:** NoSQL Workbench's GSI dropdown only shows attributes that have been pre-declared, requiring `region` and `totalScore` to be added to the attribute list before the GSI could be configured.
- **Correct Workbench workflow:** discovered that PutItem is performed via **Actions → Create item** and DeleteItem via checkbox selection **→ Actions → Delete items**, rather than dedicated buttons as initially assumed.

## Outcome
A working three-table leaderboard system supporting rank queries by region and score, documented in an 11-slide presentation explaining the NoSQL modeling decisions and how they differ from a relational approach.

## Diagrams & Presentation
- **LucidChart ERD:** [`Gaming Leaderboard ERD.png`](./Gaming%20Leaderboard%20ERD.png)

  ![Gaming Leaderboard ERD](./Gaming%20Leaderboard%20ERD.png)
- **PowerPoint:** [`Gaming Leaderboard.pptx`](./Gaming%20Leaderboard.pptx)
- **Video Presentation:** [Watch here](VIDEO_LINK_HERE) *(placeholder — replace with your hosted video link)*

## Career Relevance
NoSQL systems like DynamoDB are common in high-scale, low-latency applications. A modern DBA increasingly needs to support polyglot environments, and this project demonstrates the ability to reason about access patterns and choose a data model that fits the workload rather than defaulting to a relational schema.
