//
// Created by Matthias Ervens on 12/12/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include "MyComputeUnit.h"

using namespace META::Core;

ComputeData* newMyComputeData() {
    return new MyComputeData();
}
new_ComputeData_fp_t ComputeData::new_ComputeData = newMyComputeData;

void MyComputeData::fromString(std::string s) {
    this->field1 = std::stoi(s);
}

std::string MyComputeData::toString() const {
    return  std::to_string(this->field1);
}

int MyComputeUnit::fib(const int n, const int a = 1, const int b = 1) const {
    return (n < 1) ? a : fib(n - 1, b, a + b);
}

ComputeData* MyComputeUnit::compute(ComputeData *data) const {
    const MyComputeData* dIn = dynamic_cast<MyComputeData*>(data);

    int nthFib = fib(dIn->field1);
    MyComputeData *result = new MyComputeData(nthFib);

    return result;
}

