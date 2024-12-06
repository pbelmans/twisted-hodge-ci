install:
	sage -pip install --upgrade -v -e .
	rm -r twisted_ci.egg-info

test:
	sage -t twisted_ci

coverage:
	sage --coverage twisted_ci

docs: docs/Makefile
	cd docs && make html
	cd docs && make latexpdf

docs-clean:
	cd docs && make clean

lint:
	black twisted_ci
	isort --profile black twisted_ci
	flake8 --extend-ignore=E741 --max-line-length 88 twisted_ci
	ruff check --ignore=E741 twisted_ci

.PHONY: install test coverage docs-clean docs lint
