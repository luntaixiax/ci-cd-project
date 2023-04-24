#!/bin/bash
set -xe
sudo -i -u ec2-user bash <<EOF
echo "Stop and remove container"
if docker ps -a --format '{{.Names}}' | grep -q '^breast_cancer_predictor$'; then
    docker stop breast_cancer_predictor && docker rm breast_cancer_predictor
fi
echo "Run the container"
docker run -d -p 8000:8000 --name breast_cancer_predictor luntaixia/breast_cancer_predictor:latest
EOF