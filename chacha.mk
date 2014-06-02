#
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

$(call inherit-product, device/htc/msm7x27-common/msm7x27.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/chacha/overlay

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/chacha/key/chacha-keypad.kl:system/usr/keylayout/chacha-keypad.kl \
    device/htc/chacha/key/chacha-keypad.kcm:system/usr/keychars/chacha-keypad.kcm \
    device/htc/chacha/key/chacha-keypad-ara.kl:system/usr/keylayout/chacha-keypad-ara.kl \
    device/htc/chacha/key/chacha-keypad-ara.kcm:system/usr/keychars/chacha-keypad-ara.kcm \
    device/htc/chacha/key/chacha-keypad-aw.kl:system/usr/keylayout/chacha-keypad-aw.kl \
    device/htc/chacha/key/chacha-keypad-aw.kcm:system/usr/keychars/chacha-keypad-aw.kcm \
    device/htc/chacha/key/chacha-keypad-bopomo.kl:system/usr/keylayout/chacha-keypad-bopomo.kl \
    device/htc/chacha/key/chacha-keypad-bopomo.kcm:system/usr/keychars/chacha-keypad-bopomo.kcm \
    device/htc/chacha/key/chacha-keypad-cn.kl:system/usr/keylayout/chacha-keypad-cn.kl \
    device/htc/chacha/key/chacha-keypad-cn.kcm:system/usr/keychars/chacha-keypad-cn.kcm \
    device/htc/chacha/key/chacha-keypad-ell.kl:system/usr/keylayout/chacha-keypad-ell.kl \
    device/htc/chacha/key/chacha-keypad-ell.kcm:system/usr/keychars/chacha-keypad-ell.kcm \
    device/htc/chacha/key/chacha-keypad-esn.kl:system/usr/keylayout/chacha-keypad-esn.kl \
    device/htc/chacha/key/chacha-keypad-esn.kcm:system/usr/keychars/chacha-keypad-esn.kcm \
    device/htc/chacha/key/chacha-keypad-fra.kl:system/usr/keylayout/chacha-keypad-fra.kl \
    device/htc/chacha/key/chacha-keypad-fra.kcm:system/usr/keychars/chacha-keypad-fra.kcm \
    device/htc/chacha/key/chacha-keypad-ger.kl:system/usr/keylayout/chacha-keypad-ger.kl \
    device/htc/chacha/key/chacha-keypad-ger.kcm:system/usr/keychars/chacha-keypad-ger.kcm \
    device/htc/chacha/key/chacha-keypad-hk.kl:system/usr/keylayout/chacha-keypad-hk.kl \
    device/htc/chacha/key/chacha-keypad-hk.kcm:system/usr/keychars/chacha-keypad-hk.kcm \
    device/htc/chacha/key/chacha-keypad-ita.kl:system/usr/keylayout/chacha-keypad-ita.kl \
    device/htc/chacha/key/chacha-keypad-ita.kcm:system/usr/keychars/chacha-keypad-ita.kcm \
    device/htc/chacha/key/chacha-keypad-nor.kl:system/usr/keylayout/chacha-keypad-nor.kl \
    device/htc/chacha/key/chacha-keypad-nor.kcm:system/usr/keychars/chacha-keypad-nor.kcm \
    device/htc/chacha/key/chacha-keypad-rus.kl:system/usr/keylayout/chacha-keypad-rus.kl \
    device/htc/chacha/key/chacha-keypad-rus.kcm:system/usr/keychars/chacha-keypad-rus.kcm \
    device/htc/chacha/key/chacha-keypad-steng.kl:system/usr/keylayout/chacha-keypad-steng.kl \
    device/htc/chacha/key/chacha-keypad-steng.kcm:system/usr/keychars/chacha-keypad-steng.kcm \
    device/htc/chacha/key/chacha-keypad-tai.kl:system/usr/keylayout/chacha-keypad-tai.kl \
    device/htc/chacha/key/chacha-keypad-tai.kcm:system/usr/keychars/chacha-keypad-tai.kcm \
    device/htc/chacha/key/chacha-keypad-tur.kl:system/usr/keylayout/chacha-keypad-tur.kl \
    device/htc/chacha/key/chacha-keypad-tur.kcm:system/usr/keychars/chacha-keypad-tur.kcm \
    device/htc/chacha/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/chacha/key/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl

PRODUCT_COPY_FILES += \
    device/htc/chacha/ueventd.chacha.rc:root/ueventd.chacha.rc \
    device/htc/chacha/init.chacha.rc:root/init.chacha.rc \
    device/htc/chacha/fstab.chacha:root/fstab.chacha

PRODUCT_PROPERTY_OVERRIDES += \
    ro.htc.camerahack=msm7k

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/chacha/chacha-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril.v3=signalstrength,skipbrokendatacall

# GPS
PRODUCT_PACKAGES += \
    gps.chacha \
    librpc

# Don't odex build
#DISABLE_DEXPREOPT := false

# Prebuilt modules or firmware
PRODUCT_COPY_FILES += \
    device/htc/chacha/firmware/BCM4329B1_002.002.023.0831.0841.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/chacha/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/chacha/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin
	
### Touchscreen
PRODUCT_COPY_FILES += \
    device/htc/chacha/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

### Prebuilt modules or firmware
PRODUCT_COPY_FILES += \
    device/htc/chacha/firmware/BCM4329B1_002.002.023.0831.0841.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/chacha/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/chacha/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

### Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

### Add additional packages
PRODUCT_PACKAGES += \
    Torch
