# jupyter-passwd

[![Build Status](https://travis-ci.com/dddlab/jupyter-passwd.svg?branch=master)](https://travis-ci.com/dddlab/jupyter-passwd)

Utility for hashing Jupyter notebook password on linux.

When running containerized Jupyter notebook server from Jupyter docker-stacks, a [hashed password](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#preparing-a-hashed-password) can be provided to secure the server: https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#notebook-options.

This standalone python utility, created from [pyinstaller](https://github.com/pyinstaller/pyinstaller), can create a hashed password on a system without any python installed (e.g. a fresh VM instance).

## Command Line Usage
```bash
wget https://github.com/dddlab/jupyter-passwd/releases/download/v0.1.1/hash-password
chmod u+x hash-password
./hash-password
```

## Environment Variable Usage
To save hashed password in a bash environment variable,
```bash
wget https://github.com/dddlab/jupyter-passwd/releases/download/v0.1.1/hash-password
chmod u+x hash-password
PASSWD=$(hash-password | tail -n1)
```
