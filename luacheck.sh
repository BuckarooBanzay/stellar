#!/bin/sh

for modname in spawn skybox builtin_disable lua_trigger scene integration_test
do
    sh -c "cd mods/${modname} && luacheck ."
done