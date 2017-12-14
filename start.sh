#!/bin/sh

set -e

eval `ssh-agent -s`
dockerd
