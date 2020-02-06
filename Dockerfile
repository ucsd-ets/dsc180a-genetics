FROM ucsdets/scipy-ml-notebook

USER root

RUN mkdir -p /usr/local/bin

# Install GATK
FROM broadinstitute/gatk:4.1.4.1

# Install PLINK2
RUN conda install -c bioconda plink2

# install BWA
RUN conda install -c bioconda/label/cf201901 bwa
