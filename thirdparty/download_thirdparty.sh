#!/bin/bash
# Copyright 2012 Cloudera Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ "x${IMPALA_HOME}" -eq "x"]; then
  echo "IMPALA_HOME must be set"
  exit 1;
fi

cd ${IMPALA_HOME}/thirdparty

git clean -xdf gtest-${IMPALA_GTEST_VERSION}
if [ ! -f gtest-${IMPALA_GTEST_VERSION}.zip ] || [ ! $(stat -c%s gtest-${IMPALA_GTEST_VERSION}.zip) -eq "1121697" ]; then
	echo "Fetching gtest"
	rm -f gtest-${IMPALA_GTEST_VERSION}.zip
	wget http://googletest.googlecode.com/files/gtest-${IMPALA_GTEST_VERSION}.zip;
fi
echo "Uncompressing gtest"
unzip gtest-${IMPALA_GTEST_VERSION}.zip

git clean -xdf glog-${IMPALA_GLOG_VERSION}
if [ ! -f glog-${IMPALA_GLOG_VERSION}.tar.gz ] || [ ! $(stat -c%s glog-${IMPALA_GLOG_VERSION}.tar.gz) -eq "478666" ]; then
	echo "Fetching glog"
	rm -f glog-${IMPALA_GLOG_VERSION}.tar.gz
	wget http://google-glog.googlecode.com/files/glog-${IMPALA_GLOG_VERSION}.tar.gz;
fi
echo "Uncompressing glog"
tar xzf glog-${IMPALA_GLOG_VERSION}.tar.gz

git clean -xdf gflags-${IMPALA_GFLAGS_VERSION}
if [ ! -f gflags-${IMPALA_GFLAGS_VERSION}.zip ] || [ ! $(stat -c%s gflags-${IMPALA_GFLAGS_VERSION}.zip) -eq "578426" ]; then
	echo "Fetching gflags"
	rm -f gflags-${IMPALA_GFLAGS_VERSION}.zip
	wget http://gflags.googlecode.com/files/gflags-${IMPALA_GFLAGS_VERSION}.zip;
fi
echo "Uncompressing gflags"
unzip gflags-${IMPALA_GFLAGS_VERSION}.zip

git clean -xdf gperftools-${IMPALA_GPERFTOOLS_VERSION}
if [ ! -f gperftools-${IMPALA_GPERFTOOLS_VERSION}.tar.gz ] || [ ! $(stat -c%s gperftools-${IMPALA_GPERFTOOLS_VERSION}.tar.gz) -eq "1261243" ]; then
	echo "Fetching gperftools"
	rm -f gperftools-${IMPALA_GPERFTOOLS_VERSION}.tar.gz
	wget http://gperftools.googlecode.com/files/gperftools-${IMPALA_GPERFTOOLS_VERSION}.tar.gz;
fi
echo "Uncompressing gperftools"
tar xzf gperftools-${IMPALA_GPERFTOOLS_VERSION}.tar.gz

git clean -xdf snappy-${IMPALA_SNAPPY_VERSION}
if [ ! -f snappy-${IMPALA_SNAPPY_VERSION}.tar.gz ] || [ ! $(stat -c%s snappy-${IMPALA_SNAPPY_VERSION}.tar.gz) -eq "1731382" ]; then
	echo "Fetching snappy"
	rm -f snappy-${IMPALA_SNAPPY_VERSION}.tar.gz
	wget http://snappy.googlecode.com/files/snappy-${IMPALA_SNAPPY_VERSION}.tar.gz;
fi
echo "Uncompressing snappy"
tar xzf snappy-${IMPALA_SNAPPY_VERSION}.tar.gz

git clean -xdf cyrus-sasl-${IMPALA_CYRUS_SASL_VERSION}
if [ ! -f cyrus-sasl-${IMPALA_CYRUS_SASL_VERSION}.tar.gz ] || [ ! $(stat -c%s cyrus-sasl-${IMPALA_CYRUS_SASL_VERSION}.tar.gz) -eq "1613642" ]; then
	echo "Fetching cyrus-sasl"
	rm -f cyrus-sasl-${IMPALA_CYRUS_SASL_VERSION}.tar.gz
	wget ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-sasl-${IMPALA_CYRUS_SASL_VERSION}.tar.gz;
fi
echo "Uncompressing cyrus-sasl"
tar xzf cyrus-sasl-${IMPALA_CYRUS_SASL_VERSION}.tar.gz

git clean -xdf mongoose
if [ ! -f mongoose-${IMPALA_MONGOOSE_VERSION}.tgz ] || [ ! $(stat -c%s mongoose-${IMPALA_MONGOOSE_VERSION}.tgz) -eq "120543" ]; then
	echo "Fetching mongoose"
	rm -f mongoose-${IMPALA_MONGOOSE_VERSION}.tgz
	wget http://mongoose.googlecode.com/files/mongoose-${IMPALA_MONGOOSE_VERSION}.tgz;
fi
echo "Uncompressing mongoose"
tar xzf mongoose-${IMPALA_MONGOOSE_VERSION}.tgz

git clean -xdf hadoop-${IMPALA_HADOOP_VERSION}
if [ ! -f hadoop-${IMPALA_HADOOP_VERSION}.tar.gz ] || [ ! $(stat -c%s hadoop-${IMPALA_HADOOP_VERSION}.tar.gz) -eq "128806061" ]; then
	echo "Fetching Apache Hadoop"
	rm -f hadoop-${IMPALA_HADOOP_VERSION}.tar.gz
	wget http://archive.cloudera.com/cdh4/cdh/4/hadoop-${IMPALA_HADOOP_VERSION}.tar.gz;
fi
echo "Uncompressing Apache Hadoop"
tar xzf hadoop-${IMPALA_HADOOP_VERSION}.tar.gz

git clean -xdf hive-${IMPALA_HIVE_VERSION}
if [ ! -f hive-${IMPALA_HIVE_VERSION}.tar.gz ] || [ ! $(stat -c%s hive-${IMPALA_HIVE_VERSION}.tar.gz) -eq "39490066" ]; then
	echo "Fetching Apache Hive"
	rm -f hive-${IMPALA_HIVE_VERSION}.tar.gz
	wget http://archive.cloudera.com/cdh4/cdh/4/hive-${IMPALA_HIVE_VERSION}.tar.gz;
fi
echo "Uncompressing Apache Hive"
tar xzf hive-${IMPALA_HIVE_VERSION}.tar.gz

git clean -xdf thrift-${IMPALA_THRIFT_VERSION}
if [ ! -f thrift-${IMPALA_THRIFT_VERSION}.tar.gz ] || [ ! $(stat -c%s thrift-${IMPALA_THRIFT_VERSION}.tar.gz) -eq "2248326" ]; then
	echo "Fetching Apache Thrift"
	rm -f thrift-${IMPALA_THRIFT_VERSION}.tar.gz
	wget http://archive.apache.org/dist/thrift/${IMPALA_THRIFT_VERSION}/thrift-${IMPALA_THRIFT_VERSION}.tar.gz;
fi
echo "Uncompressing Apache Thrift"
tar xzf thrift-${IMPALA_THRIFT_VERSION}.tar.gz
