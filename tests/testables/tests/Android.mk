# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_USE_AAPT2 := true
LOCAL_MODULE_TAGS := tests

LOCAL_PACKAGE_NAME := TestablesTests
LOCAL_PRIVATE_PLATFORM_APIS := true

LOCAL_SRC_FILES := $(call all-java-files-under, src) \
    $(call all-Iaidl-files-under, src)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_STATIC_JAVA_LIBRARIES := \
    androidx.test.rules hamcrest-library \
    mockito-target-inline-minus-junit4 \
	testables

LOCAL_MULTILIB := both

LOCAL_JNI_SHARED_LIBRARIES := \
    libdexmakerjvmtiagent \
    libmultiplejvmtiagentsinterferenceagent

LOCAL_JAVA_LIBRARIES := android.test.runner android.test.base android.test.mock

LOCAL_CERTIFICATE := platform

LOCAL_COMPATIBILITY_SUITE := device-tests

include $(BUILD_PACKAGE)

