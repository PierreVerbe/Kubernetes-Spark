# Starting Kubernetes volume
kubectl apply -f ./kubernetes/volume/spark-event-storage-pv.yaml
kubectl apply -f ./kubernetes/volume/spark-event-storage-pvc.yaml

# Starting Spark master
kubectl create -f ./kubernetes/spark-master-deployment.yaml
kubectl create -f ./kubernetes/spark-master-service.yaml

# Starting Spark worker
kubectl create -f ./kubernetes/spark-worker-deployment.yaml

# Starting Spark History Server
kubectl create -f ./kubernetes/spark-history-server-deployment.yaml
kubectl create -f ./kubernetes/spark-history-server-service.yaml
