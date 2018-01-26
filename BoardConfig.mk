# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

# inherit from common hlte
-include device/samsung/hlte-common/BoardConfigCommon.mk

PRODUCT_RESTRICT_VENDOR_FILES := false

TARGET_OTA_ASSERT_DEVICE := SC01F,SC-01F,hltedcm

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8974
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/samsung/hltedcm/init/init_hltedcm.cpp

# Kernel
TARGET_KERNEL_CONFIG := lineage_hltedcm_defconfig

# NFC
BOARD_NFC_CHIPSET := sony
BOARD_NFC_HAL_SUFFIX := msm8974

# inherit from the proprietary version
-include vendor/samsung/hltedcm/BoardConfigVendor.mk
