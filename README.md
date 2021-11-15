# Jupyter Notebook Password Hashing Utility

[![Publish Docker image](https://github.com/dddlab/jupyter-passwd/actions/workflows/build.yml/badge.svg)](https://github.com/dddlab/jupyter-passwd/actions/workflows/build.yml)

When running Jupyter notebook server, a [hashed password](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#preparing-a-hashed-password) can be provided to secure the notebook server: https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#notebook-options.

This Docker container image will create a hashed password on a system without Jupyter notebook installed (e.g. a fresh VM instance).

## Command line input

If hashing a password to manually paste into a script, execute `hash-password.sh` script from the command line.
```bash
curl https://raw.githubusercontent.com/dddlab/jupyter-passwd/main/hash-password.sh \
    -o hash-password.sh && \
    chmod +x hash-password.sh && \
    ./hash-password.sh
```

## Environment Variable Usage

If hashing a password in a shell script that will assign the hashed password to an environment variable, execute using a line similar to the following:
```bash
curl https://raw.githubusercontent.com/dddlab/jupyter-passwd/main/hash-password.sh \
    -o hash-password.sh
PASSWD=$(./hash-password)
```
