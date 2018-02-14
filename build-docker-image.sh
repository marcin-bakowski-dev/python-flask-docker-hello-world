#!/bin/bash

VERSION=$(python version.py)
docker build -t simple-flask-app:${VERSION} .

