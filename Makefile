init:
	# Create python virtualenv & source it
	python3 -m venv .venv
	source .venv/bin/activate && pip list

install:
	# Install required dependencies
	source .venv/bin/activate &&\
		.venv/bin/pip install --upgrade pip &&\
		.venv/bin/pip install -r requirements.txt &&\
		pip list

mlflow:
	# Run example mlflow script
	source .venv/bin/activate &&\
	python example.py &&\
	mlflow ui

cleanup:
	# Destroy virtual environemnt. Adding dash on the beggining of the line ignores errors.
	# THerefore, his will still run fine even if some of the folders were deleted manually.
	-.venv/bin/pip uninstall -r requirements.txt -y
	deactivate
	-rm -r .venv/
	# Remove mlflow experiments & outputs
	-rm -r mlruns/
	-rm -r outputs/

all: init install mlflow