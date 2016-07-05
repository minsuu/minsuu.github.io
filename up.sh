#!/bin/bash
git add .
NOW = $(date + "%Y-%m-%d %r")
git commit -am "$NOW autoupdate"
git push
