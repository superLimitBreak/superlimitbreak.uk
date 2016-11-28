ENV=_env
PIP=$(ENV)/bin/pip3

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
