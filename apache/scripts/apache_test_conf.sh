#!/bin/bash

if apachectl configtest; then
  echo "Configuration is valid."
else
  echo "Configuration has errors."
fi
