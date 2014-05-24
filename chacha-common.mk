#
# Copyright (C) 2012 The CyanogenMod Project
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

# dalvik heap config for devices with 512MB memory
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

### Touchscreen
PRODUCT_COPY_FILES += \
    device/htc/chacha/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

# Prebuilt modules or firmware
PRODUCT_COPY_FILES += \
    device/htc/chacha/firmware/BCM4329B1_002.002.023.0831.0841.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/chacha/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/chacha/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

### Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml

### Audio policy
PRODUCT_COPY_FILES += \
    device/htc/chacha/libaudio/audio_policy.conf:system/etc/audio_policy.conf

### Add additional packages
PRODUCT_PACKAGES += \
    Torch

### Sensors (Compass, G-Sensor, Proximity, ...)
PRODUCT_PACKAGES += \
    sensors.msm7x27 \
    lights.chacha