#include <utility>

//
// Created by Matthias Ervens on 23/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include "round_robin_distribution_strategy.h"
#include "web/request_builder.h"

namespace META { namespace Frontend {

    RoundRobinDistributionStrategy::RoundRobinDistributionStrategy(const ComputeUnit *computeUnit, string url, string apikey) :
            DistributionStrategy(computeUnit),
            localWorkerAdapter(computeUnit), remoteWorkerAdapter(computeUnit, move(url), move(apikey)) {}


    void RoundRobinDistributionStrategy::distribute(DataSource *dataSource) {
        operate = true;

        while(operate) {
            if (!dataSource->hasNextElement()) {
                operate = false;
                break;
            }

            vector<DataSet> localData = dataSource->getSetOfElements(chunkSize);
            vector<DataSet> remoteData = dataSource->getSetOfElements(chunkSize);

            // send data to backend host
            vector<DataSet> remoteResult = remoteWorkerAdapter.workSeqOn(remoteData);
            dataSource->appendResult(remoteResult);
            // compute data locally
            vector<DataSet> localResult = localWorkerAdapter.workSeqOn(localData);
            dataSource->appendResult(localResult);
        }
    }

    void RoundRobinDistributionStrategy::stop() {
        operate = false;
    }
}}