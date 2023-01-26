# Starting Kubernetes volume
kubectl delete -f ./kubernetes/volume/spark-event-storage-pvc.yaml
kubectl delete -f ./kubernetes/volume/spark-event-storage-pv.yaml

# Starting Spark master
kubectl delete -f ./kubernetes/spark-master-deployment.yaml
kubectl delete -f ./kubernetes/spark-master-service.yaml

# Starting Spark worker
kubectl delete -f ./kubernetes/spark-worker-deployment.yaml

# Starting Spark History Server
kubectl delete -f ./kubernetes/spark-history-server-deployment.yaml
kubectl delete -f ./kubernetes/spark-history-server-service.yaml
