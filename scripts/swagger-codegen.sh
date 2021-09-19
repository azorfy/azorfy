#!/bin/bash

docker run --rm -v ${PWD}/docs/api:/local swaggerapi/swagger-codegen-cli-v3 generate \
    -i /local/openapi.yaml \
    -l go-server \
    -D models \
    -t /local/templates \
    -o /local/_temp

sed -i '' 's/Id /ID /g' docs/api/_temp/go/*

mv -v docs/api/_temp/go/* pkg/api/schemas

rm -r docs/api/_temp
