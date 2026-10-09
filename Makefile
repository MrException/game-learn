# Run `make help` to list targets. Tools come from mise (see mise.toml).
MISE := mise exec --

# macOS gets a plain `love`; Linux/WSL gets an AppImage. Extract-and-run avoids
# needing FUSE, which WSL lacks.
ifeq ($(shell uname -s),Darwin)
LOVE := $(MISE) love
else
LOVE := APPIMAGE_EXTRACT_AND_RUN=1 $(MISE) love.AppImage
endif

.PHONY: help setup run format format-check lint check

help:
	@echo "make setup         install tools with mise"
	@echo "make run           run the game"
	@echo "make format        reformat all Lua files"
	@echo "make format-check  fail if any file needs formatting"
	@echo "make lint          look for mistakes in the code"
	@echo "make check         format-check + lint"

setup:
	mise install

run:
	$(LOVE) .

format:
	$(MISE) stylua .

format-check:
	$(MISE) stylua --check .

lint:
	$(MISE) selene .

check: format-check lint
