FROM ucsdets/scipy-ml-notebook

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

# Install GATK
FROM broadinstitute/gatk:4.1.4.1

# Install PLINK2
RUN conda install -c bioconda plink2