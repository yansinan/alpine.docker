#!/bin/bash
docker build --build-arg NAME_USER=$USER -t alpine:base .