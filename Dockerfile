FROM ucsdets/scipy-ml-notebook

USER root

# Install GATK
FROM broadinstitute/gatk:4.1.4.1

# Install PLINK2
RUN conda install --quiet --yes -c bioconda plink2

# install BWA
RUN conda install --quiet --yes -c bioconda/label/cf201901 bwa
