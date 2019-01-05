//
// Created by Matthias Ervens on 25/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

#include <string>
#include <core/datasource.h>

using namespace std;
using namespace META::Core;

namespace META { namespace Frontend {

    class RequestBuilder {
    public:
        static void sendRequest(const string url, string jsonData, string &result);
    private:
        RequestBuilder() {};
        ~RequestBuilder() {};
    };

}}