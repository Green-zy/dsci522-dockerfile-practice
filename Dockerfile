# This file is adapted from work by Tiffany A. Timbers in dsci522-dockerfile-practice repository
# Link: https://github.com/ttimbers/dsci522-dockerfile-practice/blob/main/Dockerfile 

# Copyright (c) Tiffany Timbers
# Distributed under the terms of the Modified BSD License.
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda-linux-64.lock

RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"
