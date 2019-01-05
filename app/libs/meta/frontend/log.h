//
// Created by Matthias Ervens on 30/11/18.
// Copyright (c) 2018 Matthias Ervens. All rights reserved.
//

#pragma once

namespace META { namespace Frontend {

#define TAG "META::Frontend"

#ifdef __ANDROID__
    #include <android/log.h>
    #define LOGE(fmt, ...) __android_log_print(ANDROID_LOG_ERROR, TAG, fmt "\nat %s:%s:%d", ##__VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #define LOGW(fmt, ...) __android_log_print(ANDROID_LOG_WARN, TAG, fmt, ##__VA_ARGS__)
    #define LOGI(fmt, ...) __android_log_print(ANDROID_LOG_INFO, TAG, fmt, ##__VA_ARGS__)
    #define LOGD(fmt, ...) __android_log_print(ANDROID_LOG_DEBUG, TAG, fmt, ##__VA_ARGS__)
#else       // untested! implement custom logging for iOS or generic c++
    #include <cstdio>
    #define LOGE(fmt, ...) std::printf(fmt "\nat %s:%s:%d", ##__VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #define LOGW(fmt, ...) std::printf(fmt "\nat %s:%s:%d", ##__VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #define LOGI(fmt, ...) std::printf(fmt "\nat %s:%s:%d", ##__VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #define LOGD(fmt, ...) std::printf(fmt "\nat %s:%s:%d", ##__VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
#endif

}}