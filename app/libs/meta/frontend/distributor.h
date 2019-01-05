//
// Created by Matthias Ervens on 16/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

#include <core/computeunit.h>
#include <core/datasource.h>
#include "distribution_strategies/distribution_strategy.h"

#include <string>

using namespace std;
using namespace META::Core;

namespace META { namespace Frontend {

    // Distributor is only a wrapper for DistributionStrategy --> Remove?

    class AbstractDistributor {
    public:
        // This function starts the computation.
        virtual void distribute(DataSource *dataSource) = 0;
    };

    class Distributor : public AbstractDistributor {
        public:
            DistributionStrategy *strategy;
            Distributor(ComputeUnit *computeUnit, string url, string apikey);
            void distribute(DataSource *dataSource) override;
            void stop();
    };
}}