# Week 7 — Multi-Model AI Recommendation Architecture

## Objective
Design and implement a unified, AI-driven recommendation system for a fictional movie rental company by integrating five distinct database types into a single coherent architecture — the capstone technical project of the course.

## Tools & Technologies
- **Relational:** MySQL via TiDB Cloud Serverless
- **Document/Key-Value:** Amazon DynamoDB Local via NoSQL Workbench
- **Graph:** Neo4j AuraDB
- **Caching:** Redis Stack via Redis Insight
- **Time-Series:** InfluxDB OSS 2.7
- **Diagramming:** LucidChart
- **Presentation:** PowerPoint

## Approach
1. **Phase 1 — Strategic architecture:** justified each database choice against the characteristics of the data it would hold — structured transactional data (customers, rentals) to relational; catalog and session data to key-value; viewing/social relationships to graph; behavioral patterns over time to time-series.
2. **Phase 2 — Implementation:** built out all five databases with a consistent, custom dataset — movie titles blending Liberian-inspired and international names (*Children of Pepper Bird*, *Monrovia After Midnight*, *Grebo Sunrise*, and others) — carried across every script for continuity.
3. **Phase 3 — Diagramming:** produced architecture and AI data-flow diagrams in LucidChart, built manually after CSV auto-import failed to generate usable layouts.
4. **Phase 4 — Presentation:** built a 12-slide PowerPoint deck summarizing the architecture, each database's role, and the integrated recommendation flow.

## Challenges & Solutions
- **Coordinating five systems' quirks simultaneously:** TiDB's batch-execution limits, DynamoDB's WSL2-to-Windows networking (resolved by using `http://192.168.96.1:8001`, discovered via `ip route show`), and InfluxDB's timestamp range issues all had to be managed in parallel rather than one at a time.
- **Neo4j collaborative filtering query returned no results** due to data sparsity; resolved by adding a `SIMILAR_TO` relationship connecting two titles to give the recommendation logic something to traverse.
- **AWS CLI setup:** required installation (`sudo apt install awscli -y`) and dummy credential configuration before any DynamoDB Local commands would run.

## Outcome
A complete, working polyglot-persistence architecture — five live databases working together to power a single recommendation use case — documented in a 12-slide capstone presentation.

## Diagrams & Presentation
- **LucidChart Diagram (data flow):** [`AI Data Flow.png`](./AI%20Data%20Flow.png)

  ![AI Data Flow](./AI%20Data%20Flow.png)
- **LucidChart Diagram (architecture):** [`Multimodel Architecture.png`](./Multimodel%20Architecture.png)

  ![Multimodel Architecture](./Multimodel%20Architecture.png)
- **PowerPoint:** [`AI-Enhanced Database Ecosystem.pptx`](./AI-Enhanced%20Database%20Ecosystem.pptx)

## Scripts & Queries
- **MySQL (Relational):** [`week7_mysql.sql`](./week7_mysql.sql)
- **DynamoDB (Key-Value):** [`week7_dynamodb.txt`](./week7_dynamodb.txt)
- **Neo4j (Graph):** [`week7_neo4j.cypher`](./week7_neo4j.cypher)
- **Redis (Caching):** [`week7_redis.txt`](./week7_redis.txt)
- **InfluxDB (Time-Series):** [`week7_influxdb.flux`](./week7_influxdb.flux)

## Career Relevance
This project is the clearest demonstration of database-architecture-level thinking in the portfolio: choosing the right database for the right job, and making five different systems interoperate toward one business outcome. This is precisely the systems-level judgment expected of a Database Administrator working in a modern, polyglot-persistence environment.
