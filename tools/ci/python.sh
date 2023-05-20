#!/bin/bash

# Requires pylint
# emerge -a dev-python/pylint

target=${1:-src}

pylint --errors-only ${target}
