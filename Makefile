ENV=_env
PIP=$(ENV)/bin/pip3
NIKOLA=$(ENV)/bin/nikola
SITE=superLimitBreak.uk

RUN_NIKOLA=cd $(SITE) ; ../$(NIKOLA)

DEPENDENCIES_PYTHON:=dependencies.python.txt

help:
	# install

install: $(ENV)

$(ENV):
	virtualenv -p python3 $(ENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r $(DEPENDENCIES_PYTHON)

.PHONY: upgrade_pip
upgrade_pip:
	$(PIP) install --upgrade pip ; $(PIP) install --upgrade -r $(DEPENDENCIES_PYTHON)

clean:
	rm -rf $(ENV)

.PHONY: run
run:
	#$(RUN_NIKOLA) auto --browser  # Broken?

.PHONY: build
build:
	$(RUN_NIKOLA) build

$(SITE)/output:
	$(RUN_NIKOLA) build

.PHONY: serve
serve: $(SITE)/output
	$(RUN_NIKOLA) serve --browser

new_post:
	$(RUN_NIKOLA) new_post

new_page:
	$(RUN_NIKOLA) new_page
