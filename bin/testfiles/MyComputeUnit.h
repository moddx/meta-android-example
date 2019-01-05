//
// Created by Matthias Ervens on 12/12/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

#include "computeunit.h"

using namespace META::Core;

class MyComputeData : public ComputeData {
public:
    MyComputeData() = default;
    explicit MyComputeData(int i) : field1(i) {};
    std::string toString() const override;
    void fromString(std::string s) override;

    int field1;
};

class MyComputeUnit : public ComputeUnit {
public:
    ComputeData* compute(ComputeData *data) const override;
private:
    int fib(int n, int a, int b) const;
};
