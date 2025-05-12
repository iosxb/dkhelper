THEOS_DEVICE_IP = 127.0.0.1 -p 2222
ARCHS = arm64 arm64e
TARGET = iphone:latest:13.0

TWEAK_NAME = DKWeChat

# 核心配置：递归包含路径
TWEAK_INCLUDES += \
  -I./MyUtils \
  -I./QGVAPlayer/class \
  -I$(THEOS_PROJECT_DIR)/QGVAPlayer/class \
  -iquote./QGVAPlayer/class

DKWeChat_FILES = $(wildcard *.m) $(wildcard MyUtils/*.m) QGVAPlayer/class/*.m
DKWeChat_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
DKWeChat_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk