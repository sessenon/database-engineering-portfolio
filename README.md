# Database Engineering Portfolio — Turvon Al Weah

## Introduction

This portfolio compiles the deliverables from **Database Systems, Data Organization and Retrieval**, an 8-week graduate-level course taken as part of my Master of Science in Computer Science (Online Program) at Concordia University, St. Paul. Each week introduced a different database technology — relational, NoSQL/document, graph, key-value/caching, and time-series — through a hands-on design-and-implementation cycle: analyze a business scenario, design the data model, implement it in a real database, diagram the architecture, and present the solution.

I do not have an AWS account, so every AWS-native technology assigned in the course (DynamoDB, Neptune, ElastiCache, Timestream) was implemented using a free, functionally-equivalent local or cloud alternative. Identifying and justifying these substitutions became a running thread across the course and is itself a skill directly relevant to cost-conscious database administration.

**Career goal:** I'm working toward a role as a **Database Administrator**. This course — part of my graduate coursework — gave me structured, hands-on exposure to the full range of database paradigms a modern DBA is expected to support — not just relational systems, but the NoSQL, graph, caching, and time-series systems increasingly found in polyglot-persistence architectures.

## Projects

| Week | Project | Database Type | Technology Used |
|---|---|---|---|
| 2 | [Hospital Management System](./week2-hospital-management-relational) | Relational | MySQL (TiDB Cloud Serverless) |
| 3 | [Gaming Leaderboard](./week3-gaming-leaderboard-nosql) | NoSQL / Key-Value | Amazon DynamoDB (Local) |
| 4 | [SynthConnect Social Network](./week4-synthconnect-graph) | Graph | Neo4j AuraDB |
| 5 | [UrbanHive Caching Layer](./week5-urbanhive-caching) | In-Memory / Cache | Redis Stack |
| 6 | [OptimaTech Sensor Monitoring](./week6-optimatech-timeseries) | Time-Series | InfluxDB OSS 2.7 |
| 7 | [Multi-Model AI Recommendation Architecture](./week7-multimodel-architecture) | Relational + Document + Graph + Key-Value + Time-Series | TiDB, DynamoDB, Neo4j, Redis, InfluxDB |

Each project folder contains: the objective, tools and methodology used, technical challenges encountered and how they were resolved, the outcome, and how it connects to my career goals. Scripts, query files, and diagram exports are included where applicable.

## Resume

The [`resume`](./resume) folder contains the before-and-after versions of my resume, showing how this course's skills and projects were incorporated.

## Reflective Summary

Coming into this course, my professional background was in IT support, networking, and systems administration — I had never designed a database from scratch or written a query beyond basic reporting. Working through eight weeks of progressively more complex, hands-on database work changed that significantly.

A few things stand out looking back:

**Normalization and modeling became intuitive rather than theoretical.** Week 2's hospital system forced me to actually walk a flat table through UNF → 1NF → 2NF → 3NF and see *why* each step mattered, rather than memorizing the rules.

**I learned to work across fundamentally different data paradigms.** Relational, document, graph, key-value, and time-series databases each solve a different problem, and by Week 7 I was able to reason about *which* database fits *which* access pattern — the core judgment call a database architect or DBA has to make.

**Constraint-driven problem solving was a constant.** Not having an AWS account meant every week started with the same question: what's the free, real alternative, and is it a fair substitute? Working through TiDB Cloud's execution limits, WSL2 networking quirks, InfluxDB timestamp mismatches, and Neo4j's cartesian-product warnings built genuine troubleshooting resilience — the kind of skill that doesn't show up in a syllabus but matters daily in DBA work.

**Week 7 tied everything together.** Designing a single recommendation system that justified five different database choices, and implementing all five in one coherent architecture, was the moment the whole course clicked into a real, employable skill rather than six separate exercises.

This course directly supports my transition toward a Database Administrator role: I now have practical, defensible experience across the database landscape a modern DBA is expected to navigate, backed by real implementations rather than just conceptual knowledge.
