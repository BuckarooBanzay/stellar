
minetest.register_on_joinplayer(function(player)
  player:set_clouds({ density=0 })
  local system = stellar.get_system("origin")
  if system and system.skybox then
    player:set_sky({r=0, g=0, b=0}, "skybox", system.skybox)
  end
end)
