$(call inherit-product, device/samsung/i9210t/full_i9210t.mk)

# Inherit some common COS stuff.
$(call inherit-product, vendor/cos/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cos/config/nfc_enhanced.mk)

# Inherit some common COS stuff.
$(call inherit-product, vendor/cos/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9210T TARGET_DEVICE=GT-I9210T BUILD_FINGERPRINT="samsung/GT-I9210T/GT-I9210T:4.4/KRT16M/UCMC1:user/release-keys" PRIVATE_BUILD_DESC="GT-I9210T-user 4.4 KRT16M UCMC1 release-keys"

PRODUCT_NAME := cos_i9210t
PRODUCT_DEVICE := i9210t

