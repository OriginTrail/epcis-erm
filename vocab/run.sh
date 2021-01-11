#!/usr/bin/env bash

#Measures
curl "https://docs.google.com/spreadsheets/d/1idWFwwo8yw3dCOHnPxZ9Juj-PprveUvSazZe2yzmwoY/gviz/tq?tqx=out:csv&sheet=Measures" | ../bin/my-tarql "-d , --stdin" ../prefixes.ttl tarql/measures.tarql > rdf/measures.ttl

#Attributes
curl "https://docs.google.com/spreadsheets/d/1idWFwwo8yw3dCOHnPxZ9Juj-PprveUvSazZe2yzmwoY/gviz/tq?tqx=out:csv&sheet=Attributes" | ../bin/my-tarql "-d , --stdin" ../prefixes.ttl tarql/attributes.tarql > rdf/attributes.ttl

#Dimensions
curl "https://docs.google.com/spreadsheets/d/1idWFwwo8yw3dCOHnPxZ9Juj-PprveUvSazZe2yzmwoY/gviz/tq?tqx=out:csv&sheet=Dimensions" | ../bin/my-tarql "-d , --stdin" ../prefixes.ttl tarql/dimensions.tarql > rdf/dimensions.ttl

#RDF-ize coded list master sheet
curl "https://docs.google.com/spreadsheets/d/1idWFwwo8yw3dCOHnPxZ9Juj-PprveUvSazZe2yzmwoY/gviz/tq?tqx=out:csv&sheet=CodeListMaster" | ../bin/my-tarql "-d , --stdin" ../prefixes.ttl tarql/codedLists.tarql > rdf/codedLists.ttl

#Subject coded list values
curl "https://docs.google.com/spreadsheets/d/1idWFwwo8yw3dCOHnPxZ9Juj-PprveUvSazZe2yzmwoY/gviz/tq?tqx=out:csv&sheet=statstical_suummary" | ../bin/my-tarql "-d , --stdin" ../prefixes.ttl tarql/codedValues.tarql > rdf/statistical_summary.ttl



#Concatenate vocabulary
cat rdf/*.ttl | riot --syntax=ttl --formatted=ttl> fsm-vocab.ttl