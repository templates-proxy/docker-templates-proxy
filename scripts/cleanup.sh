#!/usr/bin/env bash

# apt package manager cleanup
apt-get clean -y
apt-get autoclean -y
apt-get autoremove -y

# system not important files
rm -rf /usr/share/locale/*
rm -rf /var/cache/debconf/*-old
rm -rf /var/lib/apt/lists/*
rm -rf /usr/share/doc/*

# pypi cache
rm -rf /root/.cache/