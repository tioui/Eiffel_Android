LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE	:= example
LOCAL_SRC_FILES	:= libexample.so

include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := test
LOCAL_SRC_FILES := test.cd

LOCAL_SHARED_LIBRARIES := libexample.so

include $(BUILD_SHARED_LIBRARY)
