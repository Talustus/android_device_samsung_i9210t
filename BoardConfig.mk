# Copyright (C) 2009 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from common msm8660
-include device/samsung/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/i9210t/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := skyrocket

# Assert
TARGET_OTA_ASSERT_DEVICE := GT-I9210T,GT-I9210,GTI9210T,GTI9210,i9210t,celox,SGHI727,SGH-I727,hercules,skyrocket

# Kernel
TARGET_KERNEL_CONFIG        := cyanogenmod_i9210t_defconfig
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660-common
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom msm_watchdog.appsbark=0 msm_watchdog.enable=1
BOARD_KERNEL_BASE           := 0x40400000
BOARD_KERNEL_PAGESIZE       := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x41800000

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p22: 00fffc00 00000200 "recovery"
#mmcblk0p8: 01000000 00000200 "boot"
#mmcblk0p24: 5ffffc00 00000200 "system"
#mmcblk0p26: 13fffe00 00000200 "cache"
#mmcblk0p25: 9ffffe00 00000200 "userdata"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 694157312
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2149580800
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p28
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

#########################
#### TWRP Recovery	####
#### Common Options  ####
#########################
# Screen Resulution the device uses
DEVICE_RESOLUTION := 480x800

# fixes slanty looking graphics on some devices
RECOVERY_GRAPHICS_USE_LINELENGTH := true

# Custom Source for recovery reboot functions
# TARGET_RECOVERY_REBOOT_SRC := custom-reboot.c

# enable/disable the reboot recovery button on the reboot menu, if u want to disable it for some reason ....
TW_NO_REBOOT_RECOVERY := false

# enable/disable the reboot bootloader button on the reboot menu, if your device uses Bootloader Mode instead of Download Mode
TW_NO_REBOOT_BOOTLOADER := true

# enable/disable the reboot downloadmode button on the reboot menu, if your device uses Download Mode instead of Bootloader Mode
TW_HAS_DOWNLOAD_MODE := true

# many Samsung Devices do not use a seperate Recovery partition, if thats your case set it to true! ...
TW_HAS_NO_RECOVERY_PARTITION := false

# this enables proper handling of /data/media on devices that have this folder for storage
# RECOVERY_SDCARD_ON_DATA := true

# enable/disable things like sdcard partitioning etc
BOARD_HAS_NO_REAL_SDCARD := false

# Path to the internal Storage
TW_INTERNAL_STORAGE_PATH := "/emmc"

# Mountpoint for the internal Storage
TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"

# Path to the external Storage
TW_EXTERNAL_STORAGE_PATH := "/sdcard"

# Mountpoint for the external Storage
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"

# External Storage as default for backups?
TW_DEFAULT_EXTERNAL_STORAGE := false

# Always keep system mounted
TW_NEVER_UNMOUNT_SYSTEM := false

# Enable flashing of ZIP's form their current location instead of copying them to /tmp
TW_FLASH_FROM_STORAGE := true

# Always use rm -rf instead of format
TW_ALWAYS_RMRF := false

# enables/disables USB Storage Support
TW_NO_USB_STORAGE := false

# Use EXT4 Filesystem for backups
TARGET_USERIMAGES_USE_EXT4 := true

# External SD does not use EXT4 Filesystem (VFAT ...)
TW_SDEXT_NO_EXT4 := true

# Custom Power KEY
# TW_CUSTOM_POWER_BUTTON := 103

# uncomment for HTC Devices only
# TW_INCLUDE_DUMLOCK := true

# adds ability to inject TWRP into some Samsung boot images for Samsung devices that have recovery as a second ramdisk in the boot image
TW_INCLUDE_INJECTTWRP := false

# uses blobpack to restore boot images (Asus Transformer devices)
TW_INCLUDE_BLOBPACK := false

# Uses CPU infos for a unique Device identifier
TW_FORCE_CPUINFO_FOR_DEVICE_ID := false

# enable/disable the display of the battery percentage for devices that don't support it properly
TW_NO_BATT_PERCENT := false

# Enable ICS Crypto Support
TW_INCLUDE_CRYPTO := true

# Enable JellyBean Crypto Support, this also enables ICS crypto support !
TW_INCLUDE_JB_CRYPTO := false

# enables touch event logging to help debug touchscreen issues
TWRP_EVENT_LOGGING := false

######################################
## Additional Partitions to backup  ##
##  define each in recovery.fstab   ##
######################################
## PART1 - EFS (mmcblk0p21)
SP1_NAME := "efs"
SP1_DISPLAY_NAME := "efs"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1

## PART2 - TOMBSTONES (mmcblk0p27)
# SP2_NAME := "tombstones"
# SP2_DISPLAY_NAME := "tombstones"
# SP2_BACKUP_METHOD := files
# SP2_MOUNTABLE := 1

## PART3
# SP3_NAME := "PARAM"
# SP3_DISPLAY_NAME := "PARAM LFS Backup Image"
# SP3_BACKUP_METHOD := image
# SP3_MOUNTABLE := 0

# Suppress the WIPE command since it can brick our EMMC
BOARD_SUPPRESS_EMMC_WIPE := true

# FIXME: Overlay has an issue on Quincy when playing video in landscape mode
COMMON_GLOBAL_CFLAGS += -DQCOM_ROTATOR_KERNEL_FORMATS

# Workaround for glitches while cropping bypass layers
TARGET_NO_BYPASS_CROPPING := true

# MTP
BOARD_MTP_DEVICE := "/dev/mtp_usb"

# Audio
TARGET_USES_QCOM_LPA := true
COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA
BOARD_HAS_SAMSUNG_VOLUME_BUG := true

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

# Preload the boot animation to avoid jerkiness
TARGET_BOOTANIMATION_PRELOAD := true

