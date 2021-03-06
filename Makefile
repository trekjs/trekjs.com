###
# From https://github.com/yarnpkg/website/blob/master/Makefile
###

.PHONY: start install serve build

.DEFAULT_GOAL := start
start:
	@make install
	@make serve

install: test-bundler
	@git submodule update --init --recursive
	@bundle install

serve: test-jekyll
	@jekyll serve

build: test-jekyll
	@jekyll build

serve-production: test-jekyll
	@JEKYLL_ENV=production jekyll serve

build-production: test-jekyll
	@JEKYLL_ENV=production jekyll build

###
# Misc stuff:
###

BUNDLE_EXISTS := $(shell command -v bundle 2> /dev/null)
JEKYLL_EXISTS := $(shell command -v jekyll 2> /dev/null)

test-bundler:
ifndef BUNDLE_EXISTS
	$(error bundler is not installed. Run `gem install bundler`)
endif

test-jekyll:
ifndef JEKYLL_EXISTS
	$(error Jekyll is not installed. Run `make install`)
endif
