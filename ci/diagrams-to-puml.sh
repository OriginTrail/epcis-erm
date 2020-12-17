#!/bin/bash
docker run --mount type=bind,source=$(pwd),target=/puml-doc/ttl/ ptarkalanov/rdf-puml-gen-ci:latest
