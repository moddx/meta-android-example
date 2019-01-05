//
// Created by Matthias Ervens on 23/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

#include <computeunit.h>
#include <datasource.h>

using namespace META::Core;

namespace META { namespace Frontend {

    class DistributionStrategy {
    public:
        DistributionStrategy(const ComputeUnit *computeUnit) : computeUnit(computeUnit) {}
        // starts computation and distributes data to host
        virtual void distribute(DataSource *dataSource) = 0;
        // stops computation and scheduling
        virtual void stop() = 0;
    protected:
        const ComputeUnit *computeUnit;
        bool operate = false;
    };

}}