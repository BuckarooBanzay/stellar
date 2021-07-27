
minetest.register_on_joinplayer(function(player)
  player:set_clouds({ density=0 })
  player:set_sky({r=0, g=0, b=0}, "skybox", {
    "sky_pos_z.png",
    "sky_neg_z.png^[transformR180",
    "sky_neg_y.png^[transformR270",
    "sky_pos_y.png^[transformR270",
    "sky_pos_x.png^[transformR270",
    "sky_neg_x.png^[transformR90"
  })
end)
