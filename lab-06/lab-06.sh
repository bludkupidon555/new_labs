#!/usr/bin/sh

rm -f lab-06.db
cat lab-06.sql | sqlite3 lab-06.db
lua5.3 lab-06.lua
