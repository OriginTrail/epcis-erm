# Vocabulary generation form google sheets 

This folder contains the tools to generate the FSM vocabulary from shared google sheets.

## Prerequisites 

* [Tarql](http://tarql.github.io/) - converts tabular data to *RDF* following a pattern expresssed as *SPARQL* - it must be installed so that it's binary is added to the path 
* [Riot](https://jena.apache.org/documentation/io/#command-line-tools) - script form apache jena for validation and RDF converisons. 
* *curl* - to fetch csv data over http 
* *sed*  - for basic string manipulation 

## Google sheets to csv

This public [GSheet](https://docs.google.com/spreadsheets/d/1idWFwwo8yw3dCOHnPxZ9Juj-PprveUvSazZe2yzmwoY) contains the source master data

We use the chart tools data source protocol to convert them to *CSV* and serve them over *HTTP*. 
The syntax is as follows:

`https://docs.google.com/spreadsheets/d/{{DOC_ID}}/gviz/tq?tqx=out:csv&gid={{SHEET_ID}}` where `DOC_ID` and `SHEET_ID` are both available form the sheet's url.

## my-tarql 

[my-tarql](../bin/my-tarql) is a *Tarql* wrapper which converts the prefixes from [prefixes.ttl](../model/prefixes.ttl) to *SPARQL* and prepends them to the current `.tarql` file before adding it to the pipeline. This is done in order to allow us to write more ineligible *SPARQL* and be able to always use any of the predefined prefixes. It also ensures that the resulting *Turtle* is also prefixed and human-readable. 

## Running a conversion 

[run.sh](run.sh) contains all the conversions. Each line generates (or appends to) one ttl file in the [rdf](./rdf) folder.
All generated .ttl files in that folder, as well as any hand-written ones (such as [ontology.ttl](rdf/ontology.ttl)) are merged into [fsm-vocab.ttl](fsm-vocab.ttl). 

Note that we reuse [codedValues.tarql](codedValues.tarql) several times to generate *RDF* from different sheets following the same pattern. 

We commit [fsm-vocab.ttl](fsm-vocab.ttl) to the repository so that we can consume it [raw](TODO) over http. 
