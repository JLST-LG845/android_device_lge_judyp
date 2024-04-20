# Shipping level
PRODUCT_SHIPPING_API_LEVEL := 27

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit AOSP product makefiles
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

LOCAL_PATH := device/lge/judyp

PRODUCT_PLATFORM := sdm845

# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    bootctrl.sdm845 \
    bootctrl.sdm845.recovery

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl.recovery

# HACK: Set vendor patch level
VENDOR_SECURITY_PATCH := 2025-12-31

# Libsecure
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/lib64/libsecureui.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libsecureui.so

# Shims
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/lib64/libshim_icu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libshim_icu.so