//
// Created by Matthias Ervens on 29/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include "local_worker_adapter.h"

namespace META { namespace Frontend {

    LocalWorkerAdapter::LocalWorkerAdapter(const ComputeUnit *computeUnit) : WorkerAdapter(computeUnit) {}

    future<vector<DataSet>> LocalWorkerAdapter::workOn(vector<DataSet> sets) {
        // todo implement
        return future<vector<DataSet>>();
    }

    vector<DataSet> LocalWorkerAdapter::workSeqOn(vector<DataSet> sets) {
        for(DataSet &set : sets) {
            set.value = computeUnit->compute(set.value);
        }
        return sets;
    }



}}
