//
// Created by Matthias Ervens on 25/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#include "request_builder.h"
#include "log.h"
#include <BackCurl.h>

namespace META { namespace Frontend {

    void RequestBuilder::sendRequest(const string url, string jsonData, string &result) {
        bcl::init();

        LOGD("Sending data to backend.. (%s)", url.c_str());

        bcl::execute<string>([&](bcl::Request* req) {
            bcl::setOpts(req, CURLOPT_URL , url.c_str(),
                         CURLOPT_FOLLOWLOCATION, 1L,
                         CURLOPT_POST, 1L,
                         CURLOPT_POSTFIELDS, jsonData.c_str(),
                         CURLOPT_POSTFIELDSIZE, jsonData.length(),
                         CURLOPT_USERAGENT, "libcurl-agent/1.0",
                         CURLOPT_VERBOSE, 1L,
                         CURLOPT_WRITEFUNCTION, &bcl::writeContentCallback,
                         CURLOPT_WRITEDATA, req->dataPtr
            );
        }, [&](bcl::Response* resp) {
            LOGD("ContentType: %s", resp->contentType.c_str());
            if (resp->error.length() > 0)
                LOGD("Error: %s", resp->error.c_str());

            string ret = resp->getBody<string>()->c_str();
            result = ret;
            LOGD("Got Result: %s", ret.c_str());
        });

        bcl::cleanUp();
    }


}}