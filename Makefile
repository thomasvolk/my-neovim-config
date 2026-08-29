CONFIG_DIR := $(HOME)/.config
NVIM_DIR    := $(CONFIG_DIR)/nvim
NVIM_BAK_DIR := $(CONFIG_DIR)/nvim_bak
NVIM_SRC    := $(CURDIR)/nvim

.PHONY: all install

all: install

install:
	@mkdir -p $(CONFIG_DIR)
	@if [ -L $(NVIM_DIR) ] && [ "$$(readlink $(NVIM_DIR))" = "$(NVIM_SRC)" ]; then \
		echo "$(NVIM_DIR) is already linked to $(NVIM_SRC)"; \
	else \
		if [ -e $(NVIM_DIR) ] || [ -L $(NVIM_DIR) ]; then \
			echo "backing up existing $(NVIM_DIR) to $(NVIM_BAK_DIR)"; \
			mv $(NVIM_DIR) $(NVIM_BAK_DIR); \
		fi; \
		ln -s $(NVIM_SRC) $(NVIM_DIR); \
		echo "linked $(NVIM_SRC) -> $(NVIM_DIR)"; \
	fi
