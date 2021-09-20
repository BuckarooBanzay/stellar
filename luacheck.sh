#!/bin/sh

set -e

for modname in lua_trigger scene holodeck stellar stellar_planets integration_test
do
    sh -c "cd mods/${modname} && luacheck ."
done