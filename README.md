# hlf-downline-demo (apigee gateway) 

## Purpose  
Demo Apigee as a gateway for application development and testing.
You can use visual studio code for adding/updating proxies for your local development/testing. 

## Pre Requisites  
- Docker Desktop
- Enable docker compose
- Git 
- Read access to dev registry zcusdev02acr.azurecr.io
- Visual Studio Code with Google Cloud Code extension (for additional proxy updates)

## Steps  
- Clone this repo and navigate to the repo folder
- Login to dev registry - zcusdev02acr.azurecr.io, [^1]
- Execute the following command to spin up the application
```
docker compose up -d
```
- Test app - navigate to http://localhost

## Cleanup
- Navigate to the repo folder
- Execute the following command to cleanup resources after testing
```
docker compose down
```

[^1]: Please see the login steps for dev registry at https://herbalife663.sharepoint.com/sites/Bizworks/SitePages/Developer-Container-Registry.aspx?web=1  

## Resources
- vs code - https://code.visualstudio.com/
- Google Cloud Code -  https://marketplace.visualstudio.com/items?itemName=GoogleCloudTools.cloudcode&ssr=false#overview
- vs code for apigee dev - https://cloud.google.com/apigee/docs/api-platform/local-development/vscode/explore
- docker desktop - https://www.docker.com/products/docker-desktop/
- docker compose - https://docs.docker.com/compose/
- apigee dev video - https://www.youtube.com/watch?v=HxrHu0j_1gc
