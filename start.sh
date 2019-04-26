#!/bin/bash
google-chrome --version
firefox --version
echo "Lighthouse" $(lighthouse --version)
echo "Running as:" $(whoami)

sudo /usr/bin/xvfb-run -a lighthouse "$@"
