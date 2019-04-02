#!/bin/bash

./bootstrap.sh && ./b2 --reconfigure toolset=clang link=static --user-config=user-config.jam
