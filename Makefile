PYTHONPATH ?= $(shell pwd)
PYTHON_VERSION ?= $(shell cat .python-version)
SHELL := /bin/bash

export PYTHONPATH
export PYTHON_VERSION

usage:
	@echo "Usage"
	@echo "	usage (default)"
	@echo "	usage coverage"
	@echo "	usage deploy_test_documentation"
	@echo "	usage format"
	@echo "	usage install_all_dependencies"
	@echo "	usage install_main_dependencies"
	@echo "	usage lint_check"
	@echo "	usage lint_fix"
	@echo "	usage serve_mkdocs_locally"
	@echo "	usage setup_python_interpreter"
	@echo "	usage test_all"
	@echo "	usage test_one TEST='name of the test or file'"

coverage:
	@uv run \
	 pytest tests \
	   --cov=src \
	   --cov-report=term \
	   --cov-report=xml \
	   --junitxml=test-results.xml

deploy_test_documentation:
	@uv run mike deploy --push --update-aliases 0.0.0 test

format:
	@echo "Fixing imports.."
	@uv run ruff check --select I --fix
	@echo "Formatting.."
	@uv run ruff format

install_all_dependencies:
	@uv sync --all-groups

install_main_dependencies:
	@uv sync --no-dev

lint_check:
	@echo "Running mypy linting.."
	@uv run mypy .
	@echo "Running ruff linting.."
	@uv run ruff check

lint_fix:
	@uv run ruff check --fix

serve_mkdocs_locally:
	@uv run mkdocs serve

setup_python_interpreter:
	@uv python install

test_all:
	@uv run pytest tests

test_one:
	@uv run pytest -k $(TEST) --verbose tests
