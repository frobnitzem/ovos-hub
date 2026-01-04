# Shared logic for all modules
REGISTRY := jarbasai
SENTINEL_DIR := .build_sentinels

# makefiles that include this one must define
# PREFIX and VERSION

# Derived variables
# Sub-makefiles must define VERSION and COMPONENTS
SENTINELS := $(addprefix $(SENTINEL_DIR)/, $(addsuffix .$(VERSION), $(COMPONENTS)))

# use the below to add --env-file to the builds (also add $(ENV_FLAG) in podman build cmd)
# ENV_FLAG = $(shell [ -f $(dir $<).env ] && echo "--env-file $(dir $<).env")

.PHONY: build clean

build: $(SENTINELS)

$(SENTINEL_DIR)/%.$(VERSION): %/Dockerfile $(wildcard %/files/*)
	@mkdir -p $(dir $@)
	$(eval COMPONENT_NAME := $(notdir $*))
	$(eval FULL_TAG := $(REGISTRY)/$(PREFIX)-$(COMPONENT_NAME):$(VERSION))
	podman build -t $(FULL_TAG) -f $< $(dir $<)
	@touch $@

clean:
	rm -rf $(SENTINEL_DIR)
