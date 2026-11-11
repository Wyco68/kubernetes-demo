set -e

NAME="kubernetes-demo-api"
USERNAME="wyco68"
IMAGE="$USERNAME/$NAME:latest"

echo "building Docker image ..."
docker build -t "$IMAGE" .


echo "pushing image to Docker Hub ..."
docker push "$IMAGE"

echo "applying Kubernetes manifests ..."
kubectl apply -f k8s/


echo "Getting pods ..."
kubectl get pods

echo "Getting services ..."
kubectl get services

echo "Fetching the main service ..."
kubectl get services "$NAME-service"
