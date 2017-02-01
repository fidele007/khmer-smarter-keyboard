GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KhmerSmarterKeyboard
KhmerSmarterKeyboard_FILES = Tweak.xm SSZipArchive/SSZipArchive.m $(wildcard SSZipArchive/*.c)
KhmerSmarterKeyboard_LIBRARIES = colorpicker
KhmerSmarterKeyboard_LDFLAGS += -lz

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.vanna.KhmerKeyboard.Keyboard KhmerKeyboard"
SUBPROJECTS += khmerkeyboard
include $(THEOS_MAKE_PATH)/aggregate.mk
