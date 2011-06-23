#!/bin/bash

cap setup
cap install_thin

exit 0

cap yum
cap install_thin_gem
cap install_thin
