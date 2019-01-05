//
// Created by Matthias Ervens on 16/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include "distributor.h"
#include "distribution_strategies/round_robin_distribution_strategy.h"
#include "distribution_strategies/local_distribution_strategy.h"

namespace META { namespace Frontend {

    Distributor::Distributor(ComputeUnit *computeUnit, string url, string apikey) {
        this->strategy = new RoundRobinDistributionStrategy(computeUnit, url, apikey);
//         this->strategy = new LocalDistributonStrategy(computeUnit);
    }

    void Distributor::distribute(DataSource *dataSource) {
        strategy->distribute(dataSource);
    }

    void Distributor::stop() {
        strategy->stop();
    }
}}