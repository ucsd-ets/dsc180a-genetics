FROM ucsdets/scipy-ml-notebook

USER root

# Install BWA
FROM biocontainers/biocontainers:latest
RUN conda install bwa=0.7.15

# Install PLINK2
RUN conda install -c bioconda plink2

