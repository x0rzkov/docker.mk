# Install Spark
ENV \
  SPARK_VERSION=${SPARK_VERSION:-1.5.2} \
  SPARK_DIRNAME=${SPARK_DIRNAME:-spark-1.5.2-bin-hadoop2.6} \
  SPARK_TGZ=${SPARK_DIRNAME}.tgz \
  SPARK_TGZ_LOC=${SPARK_TGZ_LOC:-http://d3kbcqa49mib13.cloudfront.net}/${SPARK_TGZ}

RUN curl -sSL ${SPARK_TGZ_LOC} | tar zxf - -C /opt

ENV \
  SPARK_HOME=/opt/${SPARK_DIRNAME} \
  MASTER=${MASTER:-local[*]} \
  SPARK_SUBMIT_OPTIONS=${SPARK_SUBMIT_OPTIONS:-"--driver-memory 512M --executor-memory 1G"}
