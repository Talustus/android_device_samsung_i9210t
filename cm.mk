$(call inherit-product, device/samsung/i9210t/full_i9210t.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9210T TARGET_DEVICE=GT-I9210T BUILD_FINGERPRINT="samsung/GT-I9210T/GT-I9210T:4.1.2/IMM76D/UCLI3:user/release-keys" PRIVATE_BUILD_DESC="GT-I9210T-user 4.1.2 IMM76D UCLI3 release-keys"

TARGET_BOOTANIMATION_NAME := 480

PRODUCT_NAME := cm_i9210t
PRODUCT_DEVICE := i9210t

