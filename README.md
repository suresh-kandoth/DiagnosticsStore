# DiagnosticsStore
Scripts to setup a continuous collection of diagnostic data available on SQL Server using minimal intervention and built-in tools.

## Background
SQL Server provides you with a rich set of diagnostics information using the Dynamic Management Views, System functions as well as Catalog views.

Have you ever been in this situation before? 

You are troubleshooting a SQL Server behavior or problem. The person assisting/collaborating with you asks "**Hey, do you have output from "DMV name" when this problem happened**". The standard answer is No. Then you use one of the diagnostic log collection utilities to setup the DMV collections and then wait for the problem to appear again. Sounds familiar?

The goal of this project is to provide you with the necessary building blocks and scripts to setup continuous diagnostic log collection with minimal impact to server resources and throughput.

## Approach and principals used
- Use built-in scheduling facility (e.g. SQL Server agent to manage various schedules to capture diagnostic information at various intervals, retry mechanism, etc.).
- Use built-in Dedicated Administrator Connection to gather diagnostic information. This ensures you are guaranteed to gather the output even during severe resource constraints since queries under this connection using reserved internal pool and resources. You will not run into the same issues (gaps in diagnostic log collection) that the normal user connections run into.
- Keep the connection persisted and not try to compete with resources when the problem is happening.
- Store the information locally and then consolidate later in warehouse or lakes.
- Leverage great techniques and capabilities available in the storage engine like page compression, partitioning and columnstore indexes for long term retention and archiving purposes to optimize space used for diagnostic purposes.
- Use great data visualization tools like Power BI to analyze the captued information for trends and patterns.

