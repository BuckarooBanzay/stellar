#!/bin/sh

for modname in builtin_disable lua_trigger scene starmap stellar integration_test
do
    sh -c "cd mods/${modname} && luacheck ."
done