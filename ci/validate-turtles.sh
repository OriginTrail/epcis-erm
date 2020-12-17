wget https://repo1.maven.org/maven2/org/topbraid/shacl/1.3.2/shacl-1.3.2-bin.zip
unzip shacl-1.3.2-bin.zip
shacl-1.3.2/bin/shaclvalidate.sh -datafile broilers/broiler.ttl -shapesfile model.shacl

