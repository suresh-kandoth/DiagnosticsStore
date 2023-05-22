# DiagnosticsStore
Scripts to setup a continuous collection of diagnostic data available on SQL Server using minimal intervention and built-in tools.

## Background
Have you ever been in this situation before? 
You are troubleshooting a SQL Server behavior or problem. The person assisting/collaborating with you asks "Hey, do you have output from this DMV when this problem happened". The standard answer is No. Then you use one of the diagnostic log collection utilities to setup the DMV collections and then wait for the problem to appear again. Sounds familiar?
The goal of this project is to provide you with the necessary scripts to setup contionuous diagnostic log collection with minimal impact to server resources and throughput.

## Approach and principals used
