//
// Created by Matthias Ervens on 05/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include <jni.h>
#include <android/log.h>
#include <string>
#include <sstream>
#include <meta-frontend.h>
#include <json.hpp>
#include "cunits/MyComputeUnit.h"


using namespace META::Core;
using namespace META::Frontend;

std::string jsontest = "";

extern "C" JNIEXPORT jstring JNICALL
Java_org_tuxship_cpptest_MainActivity_stringFromJNI(JNIEnv *env, jobject /* this */) {
    std::string hello = "Hello from C++\n";
    hello.append(jsontest);
    return env->NewStringUTF(hello.c_str());
}

extern "C" JNIEXPORT jintArray JNICALL
Java_org_tuxship_cpptest_MainActivity_scheduleJNI(JNIEnv *env, jobject instance, jint fibn) {
    // Prepare DataSource
    unsigned int size = static_cast<unsigned int>(fibn) + 1;
    vector<ComputeData*> input(size);
    for (int i = 0; i < size; i++) input[i] = new MyComputeData(i);
    DataSource dataSource(input);

    // do the computations
    ComputeUnit *computeUnit = new MyComputeUnit();
    Distributor distributor = Distributor(computeUnit,
            "192.168.2.107:4300", "0dd1aa4e374077feac5669643c4bc1e4");
    distributor.distribute(&dataSource);

    // get results
    vector<MyComputeData*> results;
    dataSource.getTypedResults<MyComputeData>(results);

    // convert results to jni/java types
    jintArray jresults = env->NewIntArray(size);
    jint raw[size];
    for(int i = 0; i < size; i++) {
        raw[i] = results[i]->field1;
    }
    env->SetIntArrayRegion(jresults, 0, size, raw);
    return jresults;
}

