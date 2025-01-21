#!/bin/bash
set -e

echo "Installing dependencies..."
npm install

echo "Building application..."
npm run build

echo "Restarting PM2 process..."
pm2 restart ecosystem.config.js || pm2 start ecosystem.config.js

echo "Saving PM2 process list..."
pm2 save

echo "Deployment completed successfully!"