ARCHS = arm64 arm64e

export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT = 2222

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Timemoji
Timemoji_FILES = Tweak.xm
Timemoji_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += timemojiprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
