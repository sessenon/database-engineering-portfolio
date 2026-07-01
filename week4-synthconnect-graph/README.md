# Week 4 — SynthConnect Social Network (Graph Database)

## Objective
Model and query the relationship data of a fictional social network, SynthConnect, using a graph database — implemented as a free alternative to Amazon Neptune.

## Tools & Technologies
- **Database:** Neo4j AuraDB (Free Tier), queried in Cypher
- **Diagramming:** LucidChart
- **Presentation:** PowerPoint

## Approach
1. Selected **Neo4j AuraDB** as a functionally equivalent, free alternative to Amazon Neptune (both are property-graph databases; Cypher replaces Gremlin/SPARQL as the query language).
2. Designed a graph model with **5 node types** (User, Post, Comment, Topic, Group) and **10 relationship types**, built out in LucidChart with privacy annotations — red dashed boxes around PII-controlled (User) and privacy-controlled (Group) nodes, with edge property lists moved to a separate legend table rather than cluttering the diagram.
3. Populated the graph with sample data, including custom user bios.
4. Wrote and ran 4 Cypher queries, including a friend-of-friend traversal and a content recommendation query based on shared topics/likes.

## Challenges & Solutions
- **Cartesian product warnings on relationship creation:** batch `CREATE` statements for relationships failed; resolved by breaking them into individual statements.
- **Duplicate nodes and relationships:** cleaned up using `DETACH DELETE`, with duplicate relationships removed via `SKIP`-based deletion queries.
- **Friend-of-friend query returned no results:** traced to a missing `FOLLOWS` relationship chain beyond the first-degree connection; resolved by adding the missing relationships.
- **Sparse data affecting recommendations:** verified graph connectivity before re-running collaborative-style queries to ensure meaningful results.

## Outcome
A working graph database answering multi-hop relationship queries, documented in a 12-slide presentation covering the case analysis, Neptune-vs-Neo4j comparison, the graph model diagram, all four Cypher queries with results, and privacy/scalability considerations.

## Diagrams & Presentation
- **LucidChart Diagram:** [`Property Graph Schema.png`](./Property%20Graph%20Schema.png)

  ![Property Graph Schema](./Property%20Graph%20Schema.png)
- **PowerPoint:** [`SynthConnect - Property Graph Database Solution.pptx`](./SynthConnect%20-%20Property%20Graph%20Database%20Solution.pptx)

## Scripts & Queries
- **Cypher queries:** [`Queries for Property Graph Database.cypher`](./Queries%20for%20Property%20Graph%20Database.cypher) — node/relationship creation and all Cypher queries including friend-of-friend and recommendation traversals

## Career Relevance
Graph databases power recommendation engines, fraud detection, and network analysis — an increasingly common part of the data landscape. This project demonstrates the ability to model non-tabular relationships and translate between query languages (Gremlin/SPARQL concepts to Cypher), a valuable skill when supporting varied database technologies.
