# ARC GraphQL
GraphQL layer to deal with all comunication between front-end and back-end

## Running the project

### Set environment variables

The project get credentials from environment variables. For that matter, set the following environment variables on your .bashrc file:
```
export PLAYGROUND_ENDPOINT=<ENDPOINT TO BE USED ON PLAYGROUND (set it as the endpoint of the arcgraphql service)>
export REDDIT_MEDIATOR_URL=<REDDIT MEDIATOR URL>
```

### Installing dependencies
```
npm i
```

### Executing ARC GraphQL

```
npm run build
npm start
```

## Building and publishing container

### From scratch
```
docker build -t krautzera/arcgraphql:X.Y.Z -t krautzera/arcgraphql:latest
docker login
docker push krautzera/arcgraphql:X.Y.Z
docker push krautzera/arcgraphql:latest
```

### From script
```
scripts/build-image
```
##### Notes
 - This script retrieves service version from package.json. Remember to update it to avoid image overwrite.
 - This script needs `node` installed
