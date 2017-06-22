#!/bin/bash
/root/spark/spark-2.1.4.19-bin-2.7.1/bin/spark-submit --name "RDDJoin-G1-2-14G" \
                                             --class applications.sql.rdd.RDDJoinTest \
                                             --deploy-mode client \
                                             --total-executor-cores 32 \
                                              --executor-cores 2 \
                                              --executor-memory 14g \
                                              --conf spark.default.parallelism=32 \
                                              --conf spark.executor.extraJavaOptions="-XX:+UseG1GC -XX:+PrintFlagsFinal -XX:+PrintReferenceGC -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintAdaptiveSizePolicy -XX:+UnlockDiagnosticVMOptions -XX:+G1SummarizeConcMark"\
                                             /root/lijie/selectedApps/SparkGC.jar \
$1 $2 $3 2>&1 | tee $4