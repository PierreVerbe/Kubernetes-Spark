# Kubernetes-Spark

## About this repo
It's using Docker, Kubernetes & minikube
Scala 2.12.15
Spark 3.2.0
Hadoop 3.3.1

## Demo
### Starting procedure
* Start Docker <br>

* Start Spark on Kubernetes <br>
```bash
# Start minikube
minikube start --memory 8192 --cpus 4
echo $(minikube docker-env)

# Build Docker image
sh build_docker_image.sh

sh start_spark_kubernetes.sh
minikube addons enable ingress
kubectl apply -f ./kubernetes/minikube-ingress.yaml

echo "$(minikube ip) spark-master-ui" | sudo tee -a /etc/hosts
echo "$(minikube ip) spark-history-ui" | sudo tee -a /etc/hosts
```

[Spark master UI](http://spark-master-ui/) <br>
[Spark history UI](http://spark-history-ui/) <br>

### Run Spark jobs
```bash
# Run pyspark on master
kubectl exec spark-master-55f794b67-h4g6j -it -- \
pyspark --conf spark.driver.bindAddress=172.17.0.4 --conf spark.driver.host=172.17.0.4

# Run spark-shell on master
kubectl exec spark-master-55f794b67-h4g6j -it -- \
spark-shell --conf spark.driver.bindAddress=172.17.0.4 --conf spark.driver.host=172.17.0.4

# Run jar on Spark Kubernetes
kubectl apply -f ./kubernetes/spark-driver-job.yaml
```

### Stoping procedure
* Stop Spark on Kubernetes
```bash
kubectl delete -f ./kubernetes/minikube-ingress.yaml

sh stop_spark_kubernetes.sh

minikube stop
```

## Useful Links
* https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#-strong-api-overview-strong- <br>
* https://testdriven.io/blog/deploying-spark-on-kubernetes/ <br>
* https://michalklempa.com/2020/12/spark-in-docker-standalone-cluster-1/ <br>
