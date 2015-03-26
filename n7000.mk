#
# Copyright (C) 2012 The Android Open-Source Project
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

LOCAL_PATH := device/samsung/n7000

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Include common makefile
$(call inherit-product, device/samsung/galaxys2-common/common.mk)

# This device is xhdpi.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += xhdpi

#Bootanimation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
	net.tethering.noprovisioning=true

# Sensors
PRODUCT_PACKAGES += \
    sensors.exynos4

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/usr/keylayout/max8997-muic.kl:system/usr/keylayout/max8997-muic.kl \
    $(LOCAL_PATH)/usr/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
    $(LOCAL_PATH)/usr/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/melfas_ts.idc:system/usr/idc/melfas_ts.idc \
    $(LOCAL_PATH)/usr/idc/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc \
    $(LOCAL_PATH)/usr/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc \
    $(LOCAL_PATH)/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.gps.rc:root/init.gps.rc \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

$(call inherit-product-if-exists, vendor/samsung/n7000/n7000-vendor.mk)
