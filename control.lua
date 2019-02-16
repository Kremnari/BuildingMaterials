script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  if (not player.character) then return end
  if settings.startup["bm-burner-stage"].value == "sp0" then
    player.insert{name="burner-lab", count = 1}
  end
end)
