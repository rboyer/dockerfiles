#!/bin/sh

exec docker run --rm -it -u rboyer -v $(pwd):/code -w /code rboyer/devmesos bash
