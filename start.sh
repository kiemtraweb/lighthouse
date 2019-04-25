#!/bin/bash
google-chrome --version
firefox --version
echo "Lighthouse" $(lighthouse --version)
/usr/bin/xvfb-run -a lighthouse "$@"
