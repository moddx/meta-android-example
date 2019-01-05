//
// Created by Matthias Ervens on 29/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include <meta-frontend.h>
#include "remote_worker_adapter.h"
#include "jsonhelper.h"

namespace META { namespace Frontend {

    RemoteWorkerAdapter::RemoteWorkerAdapter(const ComputeUnit *computeUnit, string url, string apikey)
            : WorkerAdapter(computeUnit), url(move(url)), apikey(move(apikey)){}

    future<vector<DataSet>> RemoteWorkerAdapter::workOn(vector<DataSet> sets) {
        // todo implement
        return future<vector<DataSet>>();
    }

    vector<DataSet> RemoteWorkerAdapter::workSeqOn(vector<DataSet> sets) {
        if(sets.empty()) return sets;
        vector<DataSet> results;
        string jsonResult;

        string json = JsonHelper::toJson(sets, apikey);
        RequestBuilder::sendRequest(url, json, jsonResult);
        JsonHelper::fromJson(jsonResult, results);

        return results;
    }


}}
