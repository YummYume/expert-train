#!/bin/bash

git clone https://github.com/YummYume/expert-train.git

cd expert-train

sg docker -c "docker compose up -d"

echo "App is running"

exit 0
