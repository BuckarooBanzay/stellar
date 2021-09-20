#!/bin/sh

set -e

for modname in lua_trigger scene holodeck stellar integration_test
do
    sh -c "cd mods/${modname} && luacheck ."
done