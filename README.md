# Python

## Debian

Common operations can/should be done using `make`:

```bash
$ make
Usage
        usage (default)
        usage coverage
        usage deploy_test_documentation
        usage format
        usage install_all_dependencies
        usage install_main_dependencies
        usage lint_check
        usage lint_fix
        usage serve_mkdocs_locally
	usage setup_python_interpreter
        usage test_all
        usage test_one TEST='name of the test or file'
```

### Requirements

- [make](https://www.gnu.org/software/make/manual/make.html)
- [uv](https://docs.astral.sh/uv/)

Is is advisable to prevent `pip` to install packages globally. Please add the following to your `.bashrc`:

```bash
export PIP_REQUIRE_VIRTUALENV=true
```

### Setting up local development

Run the following commands:

```bash
make setup_python_interpreter
make install_all_dependencies
```

### Project management and configuration

Project management and configuration is done via `pyproject.toml`.

### Formatting

Using [ruff](https://docs.astral.sh/ruff/formatter/).

### Linting

#### Ruff

Using [ruff](https://docs.astral.sh/ruff/linter/).

If starting a new project, please use the more stricter set of rules. Some are disabled for convenience. Some are disabled to match Black formatting style.

If adopting ruff in an existing project, it may be acceptable to start with a more forgiving set of rules. If so, please remove the `[tool.ruff.lint]` section in the `pyproject.toml`.

#### Mypy

Using [mypy](https://mypy.readthedocs.io/en/stable/config_file.html#config-file).

If starting a new project, please use the more stricter set of rules.

If adopting ruff in an existing project, it may be acceptable to start with a more forgiving set of rules. If so, please check the [documentation](https://mypy.readthedocs.io/en/stable/existing_code.html#getting-to-strict) about which rules to turn off.

### Testing

Using [pytest](https://docs.pytest.org/en/8.2.x/) for running tests and [pytest-cov](https://pytest-cov.readthedocs.io/en/latest/) to generate coverage reports.

### Documentation

Using `mkdocs-material` and `mike`.

You can check [mkdocs.yml](./mkdocs.yml) for configuration options, [Makefile](./Makefile) for dev commands and [main.yml](./.github/workflows/main.yml) for information about docs deployment.

Note that, by default, the webpage has a random generated page. This can be changed in the repository's settings. For this particular repo, the docs are dpeloyed to [https://literate-adventure-lmm55oq.pages.github.io/](https://literate-adventure-lmm55oq.pages.github.io/).

## VSCode

We share VSCode settings and extensions across projects in order to make development smoother. For example, every time we save a file, the file should be automatically formatted/linted.

### AWS Boto3

Add extension, run `AWS Boto3: Quick Start` command to install typing packages for necessary boto3 libraries.

Run `uv pip freeze` and add the necessary packages to `pyproject.toml`, like `mypy-boto3-eks==1.37.4`.

## CI/CD

Platform specific.

Please ensure there is a job for:

- Formatting
- Linting
- Coverage
- Other tests
- Etc..
