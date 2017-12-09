#!/bin/sh

exec docker run --rm -it -u rboyer \
    -v $(pwd)/devhome:/home/rboyer \
    -v $(pwd):/code \
    -w /code \
    rboyer/devmesos bash
