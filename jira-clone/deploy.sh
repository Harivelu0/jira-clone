#!/bin/bash

# Deployment script for Next.js application

# Get the environment from the command line
ENV=$1

if [ -z "$ENV" ]; then
    echo "Error: Environment not specified"
    echo "Usage: ./deploy.sh [dev|staging|production]"
    exit 1
fi

echo "Deploying Next.js application to $ENV environment..."

# Extract the artifact
tar -xzf nextjs-app.tar.gz

case $ENV in
    dev)
        # Development server deployment
        echo "Deploying to development server..."
        
        # Example: Deploy to development server using SSH
        # rsync -avz --delete .next package.json package-lock.json public .env user@dev-server:/path/to/app/
        
        # Example: Restart PM2 process on the server
        # ssh user@dev-server "cd /path/to/app && npm install --production && pm2 restart nextjs-app-dev"
        
        echo "Development deployment completed"
        ;;
        
    staging)
        # Staging server deployment
        echo "Deploying to staging server..."
        
        # Example: Deploy to staging server
        # rsync -avz --delete .next package.json package-lock.json public .env user@staging-server:/path/to/app/
        
        # Example: Restart PM2 process on the server
        # ssh user@staging-server "cd /path/to/app && npm install --production && pm2 restart nextjs-app-staging"
        
        echo "Staging deployment completed"
        ;;
        
    production)
        # Production server deployment
        echo "Deploying to production server..."
        
        # Example: Deploy to production server
        # rsync -avz --delete .next package.json package-lock.json public .env user@prod-server:/path/to/app/
        
        # Example: Restart PM2 process on the server
        # ssh user@prod-server "cd /path/to/app && npm install --production && pm2 restart nextjs-app-prod"
        
        # Optional: Create a release tag
        # git tag -a "release-$(date +%Y%m%d%H%M%S)" -m "Production release"
        # git push origin --tags
        
        echo "Production deployment completed"
        ;;
        
    *)
        echo "Error: Unknown environment '$ENV'"
        exit 1
        ;;
esac

# Clean up extracted files
rm -rf .next public

echo "Deployment to $ENV completed successfully!"
exit 0