#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/redwood

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

BUILD_BROKEN_DUP_RULES := true

# Board
TARGET_BOOTLOADER_BOARD_NAME := redwood

# Kernel
TARGET_KERNEL_CONFIG += kernel/xiaomi/redwood/arch/arm64/configs/vendor/redwood_QGKI.config
#BOARD_KERNEL_IMAGE_NAME := kernel
#TARGET_PREBUILT_KERNEL := kernel/prebuilts/xiaomi/redwood/kernel
#BOARD_KERNEL_CMDLINE += androidboot.dtbo_img=kernel/prebuilts/xiaomi/redwood/dtbo.img
#BOARD_PREBUILT_DTBOIMAGE := kernel/prebuilts/xiaomi/redwood/dtbo.img
#BOARD_PREBUILT_DTBIMAGE := kernel/prebuilts/xiaomi/redwood/dtb.img
#BOARD_PREBUILT_DTBIMAGE_DIR := kernel/prebuilts/xiaomi/redwood/dtb

# Possibly required to avoid build errors originating from vendor/arrow...
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_VERSION := 5.4.210

# Kernel modules
BOOT_KERNEL_MODULES := \
    goodix_core.ko \
    hwid.ko \
    msm_drm.ko \
    xiaomi_touch.ko
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 113254576128

# Include proprietary files
include vendor/xiaomi/redwood/BoardConfigVendor.mk
