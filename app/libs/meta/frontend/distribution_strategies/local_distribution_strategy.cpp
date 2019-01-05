//
// Created by Matthias Ervens on 23/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include "local_distribution_strategy.h"

namespace META { namespace Frontend {

    LocalDistributonStrategy::LocalDistributonStrategy(const ComputeUnit *computeUnit)
            : DistributionStrategy(computeUnit) {}

    void LocalDistributonStrategy::distribute(DataSource *dataSource) {
        operate = true;
        // compute data locally
        while(operate && dataSource->hasNextElement()) {
            DataSet element = dataSource->getNextElement();
            element.value = computeUnit->compute(element.value);
            dataSource->appendResult(element);
        }
    }

    void LocalDistributonStrategy::stop() {
        operate = false;
    }
}}