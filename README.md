# Cloudera Impala

Cloudera Impala is a distributed query execution engine that runs against data stored natively in Apache HDFS and Apache HBase. This public repository is a snapshot of our internal development repository that will be updated periodically as we prepare new releases. 

The rest of this README describes how to build Cloudera Impala from this repository. Further documentation about Cloudera Impala can be found [here](https://ccp.cloudera.com/display/IMPALA10BETADOC/Cloudera+Impala+1.0+Beta+Documentation). 

# Building Cloudera Impala

## Prerequisites on CentOS 6.2

### Packages

    sudo yum install boost-test boost-program-options libevent-devel automake libtool flex bison gcc-c++ openssl-devel \
    make cmake doxygen.x86_64 glib-devel boost-devel python-devel bzip2-devel svn libevent-devel cyrus-sasl-devel \
    wget git unzip

### LLVM

    wget http://llvm.org/releases/3.0/llvm-3.0.tar.gz
    tar xvzf llvm-3.0.tar.gz
    cd llvm-3.0.src/tools
    svn co http://llvm.org/svn/llvm-project/cfe/tags/RELEASE_30/final/ clang
    cd ../projects
    svn co http://llvm.org/svn/llvm-project/compiler-rt/tags/RELEASE_30/final/ compiler-rt
    cd ..
    ./configure --with-pic
    make
    sudo make install

### Install Maven

    wget http://www.fightrice.com/mirrors/apache/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz
    tar xvf apache-maven-3.0.4-bin.tar.gz && sudo mv apache-maven-3.0.4 /usr/local
   
Add the following three lines to your .bashrc:

    export M2_HOME=/usr/local/apache-maven-3.0.4
    export M2=$M2_HOME/bin  
    export PATH=$M2:$PATH 

And make sure you pick up the changes either by logging in to a fresh shell or running:

    source ~/.bashrc

Confirm by running:

    mvn -version

and you should see at least:

    Apache Maven 3.0.4...

## Prerequisites on Ubuntu 12.04 and newer

    sudo apt-get install unzip build-essential autoconf automake git libboost-test-dev libboost-program-options-dev \
                         libboost-dev libboost-thread-dev libboost-regex-dev libevent-dev libbz2-dev cmake \
                         libssl-dev llvm-3.0 clang doxygen maven libsnappy-dev libsasl2-dev python-dev

## Other prerequisites

### Install the JDK

Make sure that the Oracle Java Development Kit 6 is installed (not OpenJDK), and that `JAVA_HOME` is set in your environment.

## Building Cloudera Impala

### Clone the Impala repository

    git clone https://github.com/cloudera/impala.git

### Set the Impala environment
  
    cd impala
    . bin/impala-config.sh

Confirm your environment looks correct:

    env | grep "IMPALA.*VERSION"

The output should be:

    IMPALA_CYRUS_SASL_VERSION=2.1.23
    IMPALA_HBASE_VERSION=0.92.1-cdh4.1.0
    IMPALA_SNAPPY_VERSION=1.0.5
    IMPALA_GTEST_VERSION=1.6.0
    IMPALA_GPERFTOOLS_VERSION=2.0
    IMPALA_GFLAGS_VERSION=2.0
    IMPALA_GLOG_VERSION=0.3.2
    IMPALA_HADOOP_VERSION=2.0.0-cdh4.1.0
    IMPALA_HIVE_VERSION=0.9.0-cdh4.1.0
    IMPALA_MONGOOSE_VERSION=3.3
    IMPALA_THRIFT_VERSION=0.7.0

### Download required third-party packages

    cd ${IMPALA_HOME}
	./thirdparty/download_thirdparty.sh

### Build Impala

On CentOS:

    cd ${IMPALA_HOME}
    ./build_public.sh -build_thirdparty

On Ubuntu:

    cd ${IMPALA_HOME}
    CMAKE_ARGS="-DLLVM_CONFIG_EXECUTABLE=`which llvm-config-3.0` -DLLVM_OPT_EXECUTABLE=`which opt-3.0` -DCLANG_EXECUTABLE=`which clang` -DLLVM_CLANG_EXECUTABLE=`which clang`" \
    THRIFT_HOME=${IMPALA_HOME}/thirdparty/thrift-${IMPALA_THRIFT_VERSION}/build \
    THRIFT_CONTRIB_DIR=${IMPALA_HOME}/thirdparty/thrift-${IMPALA_THRIFT_VERSION}/build \
    ./build_public.sh -build_thirdparty

## Wrapping up

After a successful build, there should be an `impalad` binary in `${IMPALA_HOME}/be/build/debug/service`.

You can start an Impala backend by running:

    ${IMPALA_HOME}/bin/start-impalad.sh -use_statestore=false

Note that the `start-impalad.sh` script sets some environment variables that are necessary for Impala to run successfully.

To configure Impala's use of HDFS, HBase or the Hive metastore, place the relevant configuration files somewhere in the `CLASSPATH` established by `bin/set-classpath.sh`. Internally we use `fe/src/test/resources` for this purpose, you may find it convenient to do the same.

## The Impala Shell

The Impala shell is a convenient command-line interface to Cloudera Impala. To run from a source repository, do the following:

    ${IMPALA_HOME}/bin/impala-shell.sh
