//
// Created by Matthias Ervens on 29/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

#include <future>

#include <computeunit.h>
#include <datasource.h>


using namespace std;
using namespace META::Core;

namespace META { namespace Frontend {

class WorkerAdapter {
public:
    WorkerAdapter(const ComputeUnit *computeUnit) : computeUnit(computeUnit) {};
    virtual future<vector<DataSet>> workOn(vector<DataSet> sets) = 0;
    virtual vector<DataSet> workSeqOn(vector<DataSet> sets) = 0;

protected:
    const ComputeUnit *computeUnit;
};

}}