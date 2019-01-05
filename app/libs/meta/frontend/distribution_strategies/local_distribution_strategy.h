//
// Created by Matthias Ervens on 23/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

#include <computeunit.h>
#include "distribution_strategy.h"

using namespace META::Core;

namespace META { namespace Frontend {

    class LocalDistributonStrategy : public DistributionStrategy {
    public:
        LocalDistributonStrategy(const ComputeUnit *computeUnit);
        void distribute(DataSource *dataSource) override;
        void stop() override;
    };

}}