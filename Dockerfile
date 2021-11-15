FROM python:slim

RUN pip install -qq \
        --no-dependencies \
        tornado traitlets ipython_genutils \
        jupyter_core notebook
