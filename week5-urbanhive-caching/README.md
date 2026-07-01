# Week 5 — UrbanHive Caching Layer (Redis)

## Objective
Design a caching strategy to reduce database load and improve read performance for UrbanHive, a fictional high-traffic e-commerce platform — implemented as a free alternative to Amazon ElastiCache.

## Tools & Technologies
- **Database:** Redis Stack (local), managed via Redis Insight
- **Environment:** WSL2 with Ubuntu on Windows (established this week, reused in later weeks)
- **Diagramming:** LucidChart
- **Presentation:** PowerPoint

## Approach
1. Selected **Redis Stack** as a free, functionally equivalent alternative to Amazon ElastiCache for Redis, since both run the same underlying Redis engine.
2. Designed a **cache-aside (lazy loading)** architecture: the application checks Redis first, falls through to the database on a cache miss, then writes the result back to Redis.
3. Implemented and tested all four core Redis data structures — **strings, hashes, lists, and sets** — mapped to UrbanHive's use cases (session storage, product data, rankings, and category sets).
4. Personalized all Redis key names using my username, ShadyWeah, consistent with prior weeks.
5. Diagrammed the cache-aside data flow and Redis data structure map in LucidChart.

## Challenges & Solutions
- **Full WSL2/Ubuntu environment setup from scratch:** worked through WSL not launching (`wsl -d Ubuntu`), no Ubuntu distribution installed (`wsl --install -d Ubuntu`), and Redis server not running (`sudo service redis-server start`).
- **Commands failing silently:** traced to running Redis commands in the Ubuntu shell instead of Redis Insight's Workbench, where they needed to be executed for this assignment.
- **Authentication error:** caused by entering a display name/password where none was required; resolved by leaving both fields blank when connecting Redis Insight to the local server.
- **Data reset:** used `FLUSHALL` to clear the database before a clean final run of all four command blocks.

## Outcome
A fully functional local Redis cache layer with tested strings/hashes/lists/sets operations, an annotated command script for submission, and a 12-slide presentation on the caching strategy and performance justification.

## Diagrams & Presentation
- **LucidChart Diagram:** [`Cache Aside Flow.png`](./Cache%20Aside%20Flow.png)

  ![Cache Aside Flow](./Cache%20Aside%20Flow.png)
- **PowerPoint:** [`Optimized Data Retrieval Strategy.pptx`](./Optimized%20Data%20Retrieval%20Strategy.pptx)

## Scripts & Queries
- **Redis commands:** [`UrbanHive_Redis_Commands_Scripts.txt`](./UrbanHive_Redis_Commands_Scripts.txt) — full command reference across strings, hashes, lists, and sets

## Career Relevance
Caching strategy and performance tuning are core DBA responsibilities, especially for read-heavy, high-traffic systems. This project also reflects the ability to stand up and troubleshoot a full local development environment (WSL2/Linux) from nothing — a practical systems skill that carries into every later week.
