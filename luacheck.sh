#!/bin/sh

for modname in spawn builtin_disable lua_trigger scene starmap integration_test
do
    sh -c "cd mods/${modname} && luacheck ."
done