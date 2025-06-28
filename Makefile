.PHONY: build build-dev watch clean install

# Build the application for production
build:
	npm run build

# Build the application for development
build-dev:
	npm run build-dev

# Watch for changes and rebuild
watch:
	npm run watch

# Clean build artifacts
clean:
	rm -rf dist/

# Install dependencies
install:
	npm install

# Lint the code
lint:
	npm run lint

# Default target
all: install build 