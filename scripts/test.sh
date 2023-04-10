#!/bin/bash
_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $_dir/..
echo 'testing'
poetry run pytest
