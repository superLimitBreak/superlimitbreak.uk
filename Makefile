ENV=_env
PIP=$(ENV)/bin/pip3
NIKOLA=$(ENV)/bin/nikola
SITE=superLimitBreak

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

run:
	#$(RUN_NIKOLA) auto --browser  # Broken?
	$(RUN_NIKOLA) build
	$(RUN_NIKOLA) serve --browser
