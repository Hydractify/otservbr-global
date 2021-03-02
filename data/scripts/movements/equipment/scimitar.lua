local scimitar = MoveEvent()

function scimitar.onAddItem(moveitem, tileitem, position)
	if moveitem:getId() == 2419 and position == Position(33205, 32537, 6) then
		moveitem:transform(5858)
	end
end

scimitar:id(6299)
scimitar:register()
