install:
	sage -pip install --upgrade -v -e .
	rm -rf twisted_ci.egg-info

test:
	sage -t twisted_ci

coverage:
	sage --coverage twisted_ci

lint:
	black twisted_ci
	isort --profile black twisted_ci
	flake8 --extend-ignore=E741 --max-line-length 88 twisted_ci
	ruff check --ignore=E741 twisted_ci

.PHONY: install test coverage docs-clean docs lint
