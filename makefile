install-pip-tools:
	pip3 install pip-tools

update-requirements:
	pip-compile requirements.in
	pip-compile requirements-dev.in
	if ! git diff --exit-code requirements.txt requirements-dev.txt; then \
		echo "Updates for packages were found. Please commit the requirements or reset."; \
	fi

dev-env:
	python3 -m venv .venv
	.venv/bin/pip install -r requirements-dev.txt