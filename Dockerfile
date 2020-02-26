FROM ucsdets/scipy-ml-notebook:2019.4.6

USER root

# Install GATK
RUN pwd && \
    apt-get update && \
    apt-get install --yes default-jdk && \
    cd /opt && \
    wget -q https://github.com/broadinstitute/gatk/releases/download/4.1.4.1/gatk-4.1.4.1.zip && \
    unzip -q gatk-4.1.4.1.zip && \
    ln -s /opt/gatk-4.1.4.1/gatk /usr/bin/gatk && \
    rm gatk-4.1.4.1.zip && \
    cd /opt/gatk-4.1.4.1 && \
    ls -al  && \
    cd /home/jovyan

# install vcftools
RUN apt-get install --yes build-essential autoconf pkg-config zlib1g-dev && \
    cd /tmp && \
    wget -q -O vcftools.tar.gz https://github.com/vcftools/vcftools/releases/download/v0.1.16/vcftools-0.1.16.tar.gz && \
#    ls -al && \
    tar -xvf vcftools.tar.gz && \
    cd vcftools-0.1.16 && \
#    ls -al && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    rm -f /tmp/vcftools.tar.gz

# install samtools
RUN apt-get install --yes ncurses-dev libbz2-dev liblzma-dev && \
    cd /tmp && \
    wget -q https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2 && \
    tar xvfj samtools-1.10.tar.bz2 && \
    cd samtools-1.10 && \
    ./configure && \
    make && \
    make install

# install bcftools
RUN apt-get install --yes ncurses-dev libbz2-dev liblzma-dev && \
    cd /tmp && \
    wget -q https://github.com/samtools/bcftools/releases/download/1.10.2/bcftools-1.10.2.tar.bz2 && \
    tar xvfj bcftools-1.10.2.tar.bz2 && \
    cd bcftools-1.10.2 && \
    ./configure && \
    make && \
    make install

# install htslib
RUN apt-get install --yes ncurses-dev libbz2-dev liblzma-dev && \
    cd /tmp && \
    wget -q https://github.com/samtools/htslib/releases/download/1.10.2/htslib-1.10.2.tar.bz2 && \
    tar xvfj htslib-1.10.2.tar.bz2 && \
    cd htslib-1.10.2 && \
    ./configure && \
    make && \
    make install

# Install BWA
RUN conda install -c bioconda bwa=0.7.15 plink2

# Install PLINK2
#RUN conda install -c bioconda plink2

USER $NB_UID
