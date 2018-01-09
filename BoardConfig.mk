# Copyright (C) 2014 The CyanogenMod Project
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

TARGET_OTA_ASSERT_DEVICE := SC01F,hltedcm

# Kernel
ifeq ($(TARGET_RECOVERY),twrp)
TARGET_KERNEL_CONFIG := ik_defconfig
TARGET_KERNEL_SELINUX_CONFIG := ""
TARGET_KERNEL_VARIANT_CONFIG := variant_hlte_dcm
TARGET_KERNEL_SOURCE := kernel/samsung/hlte-twrp
else
TARGET_KERNEL_VARIANT_CONFIG := kbc_sc01f_aosp_defconfig
endif

# Init
#TARGET_INIT_VENDOR_LIB := libinit_msm
#TARGET_LIBINIT_DEFINES_FILE := device/samsung/hltedcm/init/init_hlte.cpp
TARGET_LIBINIT_MSM8974_DEFINES_FILE := device/samsung/hltedcm/init/init_hlte.cpp
TARGET_UNIFIED_DEVICE := true

# NFC
BOARD_NFC_CHIPSET := sony

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28651290624
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# inherit from the proprietary version
-include vendor/samsung/hltedcm/BoardConfigVendor.mk
