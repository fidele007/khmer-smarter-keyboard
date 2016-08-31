include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KhmerSmarterKeyboard
KhmerSmarterKeyboard_FILES = Tweak.xm
KhmerSmarterKeyboard_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.vanna.KhmerKeyboard.Keyboard KhmerKeyboard"
SUBPROJECTS += khmerkeyboard
include $(THEOS_MAKE_PATH)/aggregate.mk
