# Kubernetes-Spark

start docker
minikube start --memory 8192 --cpus 4
echo $(minikube docker-env)

kubectl exec spark-master-55f794b67-h4g6j -it -- \         
    pyspark --conf spark.driver.bindAddress=172.17.0.2 --conf spark.driver.host=172.17.0.2
kubectl exec spark-master-55f794b67-h4g6j -it -- \         
    spark-shell --conf spark.driver.bindAddress=172.17.0.2 --conf spark.driver.host=172.17.0.2

## Links
* https://testdriven.io/blog/deploying-spark-on-kubernetes/
