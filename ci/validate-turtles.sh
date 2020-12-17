wget https://github.com/TopQuadrant/shacl/archive/shacl-1.3.2.tar.gz
tar -xf shacl-1.3.2.tar.gz
shacl-1.3.2/bin/shaclvalidate.sh -datafile broilers/broiler.ttl -shapesfile model.shacl

