#!/bin/bash

# Where to assemble the template
[[ -z "$1" ]] && template=template/ || template=$1

# Create target dir if non-existant
[ ! -d $template ] && mkdir -p $template


# Copy files
cp -R core/ $template

mkdir -p $template/shared_libs/
cp -Rf shared_libs/json $template/shared_libs/

cp backend/CMakeLists.txt $template
sed -i -e "s/cunits\/computeunit.o/computeunit.o/" $template/CMakeLists.txt
sed -i -e "s/configure_file(rabbitMQ_conf.json \${CMAKE_CURRENT_BINARY_DIR}\/rabbitMQ_conf.json COPYONLY)//" $template/CMakeLists.txt
sed -i -e "s/set (CMAKE_EXPORT_COMPILE_COMMANDS ON)//" $template/CMakeLists.txt
sed -i -e "s/#computeunit.o/computeunit.o/" $template/CMakeLists.txt
sed -i -e "s/..\/cunits\/MyComputeUnit.cpp//" $template/CMakeLists.txt
sed -i -e "s/..\/cunits\/MyComputeUnit.h//" $template/CMakeLists.txt


cp backend/main.cpp $template
sed -i -e "s/MyComputeUnit/StubComputeUnit/" $template/main.cpp
cp backend/distributor.cpp backend/distributor.h $template
cp -R backend/amqp/ $template
cp -Rf backend/libs/ $template
rm -Rf $template/libs/*/.git
cp -Rf backend/threadpool/ $template

mkdir -p $template/build

