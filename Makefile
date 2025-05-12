ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = WeChat
THEOS_DEVICE_IP = 127.0.0.1 -p 2222

FINALPACKAGE = 1
DEBUG = 0

# 源文件定义
SOURCES = $(wildcard *.m) \
          AntiAntiDebug/AntiAntiDebug.m \
          Config/MDConfigManager.m \
          Config/MDCycriptManager.m \
          Config/MDMethodTrace.m \
          Logos/dkhelperDylib.mm \
          Logos/dkhelperDylib.xm \
          MyUtils/DKHelper.m \
          MyUtils/DKHelperConfig.m \
          MyUtils/DKLaunchHelper.m \
          MyUtils/NSArray+Utils.m \
          $(wildcard Tools/*.mm) \
          $(wildcard Trace/*.m) \
          $(wildcard Trace/*.mm)

# 头文件路径
TWEAK_NAME = DKWeChat
DKWeChat_FILES = $(SOURCES)
DKWeChat_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable
DKWeChat_FRAMEWORKS = UIKit CoreGraphics QuartzCore
DKWeChat_PRIVATE_FRAMEWORKS = AppSupport ChatKit

# 附加库
DKWeChat_LIBRARIES = rocketbootstrap
DKWeChat_LDFLAGS = -lrocketbootstrap

# 安装时清理旧文件
DKWeChat_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

# 包含标准模板
include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

# 打包配置
after-install::
    install.exec "killall -9 WeChat || :"