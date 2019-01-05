//
// Created by Matthias Ervens on 23/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

#include <string>

#include "distribution_strategy.h"
#include <datasource.h>
#include <computeunit.h>
#include <workeradapter/local_worker_adapter.h>
#include <workeradapter/remote_worker_adapter.h>

using namespace std;
using namespace META::Core;

namespace META { namespace Frontend {

    class RoundRobinDistributionStrategy : public DistributionStrategy {
    public:
        RoundRobinDistributionStrategy(const ComputeUnit *computeUnit, string url, string apikey);
        void distribute(DataSource *dataSource) override;
        void stop() override;
        unsigned long chunkSize = 2;
    protected:
        LocalWorkerAdapter localWorkerAdapter;
        RemoteWorkerAdapter remoteWorkerAdapter;
    };

}}
