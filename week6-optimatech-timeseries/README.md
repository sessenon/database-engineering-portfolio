# Week 6 — OptimaTech Sensor Monitoring (Time-Series Database)

## Objective
Track and analyze climate and traffic sensor data over time for OptimaTech, a cloud solutions firm working for the fictional City of Emerald — implemented as a free alternative to Amazon Timestream.

## Tools & Technologies
- **Database:** InfluxDB OSS 2.7 (local), queried in Flux
- **Environment:** WSL2/Ubuntu (reused from Week 5)
- **Diagramming:** LucidChart
- **Presentation:** PowerPoint

## Approach
1. Selected **InfluxDB OSS** as a free, widely-used open-source time-series database, functionally equivalent to Amazon Timestream in purpose and query capability.
2. Installed InfluxDB locally and created an organization and bucket (`city_monitoring`) to hold two measurement types: `climate_data` (temperature, humidity) and traffic flow data.
3. Ingested sample sensor readings via **Line Protocol** through the Load Data UI.
4. Wrote and ran 6 Flux queries covering filtering, aggregation, and time-windowed trend analysis.
5. Produced LucidChart diagrams for the InfluxDB architecture flow and database schema.

## Challenges & Solutions
- **Standard `apt` installation failed** with a GPG key verification error (`NO_PUBKEY DA61C26A0585BD3B`); resolved by downloading the `.deb` package directly via `curl` and installing with `dpkg`, bypassing the repository entirely.
- **Ingestion via the Script Editor failed** with an "undefined identifier" error — discovered that the Script Editor only *runs* Flux queries and does not support *writes*; data had to be loaded via **Load Data → Sources → Line Protocol** instead.
- **Queries returned no results** due to a timestamp range mismatch between the query's date filter and the data's actual stored timestamps; diagnosed using a deliberately wide date range (2025–2027) and corrected all queries accordingly.

## Outcome
A working time-series database answering aggregation and trend queries over sensor data, an annotated script file, and a 12-slide presentation covering the architecture and query results.

## Diagrams & Presentation
- **LucidChart Diagram (architecture):** [`Timestream Architecture Flow.png`](./Timestream%20Architecture%20Flow.png)

  ![Timestream Architecture Flow](./Timestream%20Architecture%20Flow.png)
- **LucidChart Diagram (schema):** [`Database schema - city_monitoring.png`](./Database%20schema%20-%20city_monitoring.png)

  ![Database schema - city_monitoring](./Database%20schema%20-%20city_monitoring.png)
- **PowerPoint:** [`Time Series Databases.pptx`](./Time%20Series%20Databases.pptx)

## Career Relevance
Time-series data management is a growing specialization tied to IoT, infrastructure monitoring, and observability — areas increasingly overlapping with database administration. This project also demonstrates methodical debugging of a data pipeline (install → ingest → query) end to end.
