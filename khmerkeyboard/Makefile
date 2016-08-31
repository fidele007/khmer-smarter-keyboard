include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KhmerKeyboard
KhmerKeyboard_FILES = Tweak.xm
KhmerKeyboard_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 KhmerKeyboard"
