SUBDIRS := base core stt tts skills hivemind translate utils
# base base-sound base-rocm

.PHONY: all $(SUBDIRS)

all: $(SUBDIRS)

# Directory-level dependencies
core: base
skills: base
stt: base
tts: base
hivemind: base
translate: base
utils: base

# Rule to enter subdirectories
$(SUBDIRS):
	$(MAKE) -C $@ build
