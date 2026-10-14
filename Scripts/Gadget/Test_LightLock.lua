function OnClientExecuteReq(context, param1, param2, param3)
	local state = ScriptLib.GetGadgetState(context)
	-- The ruins seals track collected and installed pieces as a three-bit mask.
	-- Modifier notifications and explicit Lua actions can report the same delivery.
	-- Derive the resulting state from that receipt instead of counting each report.
	local group_id = ScriptLib.GetContextGroupId(context)
	if group_id >= 133007228 and group_id <= 133007230
		and param1 >= 1 and param1 <= 3 and param2 ~= 1 then
		local collected = ScriptLib.GetGroupVariableValue(context, "Temp_Point_Value")
		local installed = ScriptLib.GetGroupVariableValue(context, "Point_Value")
		if collected == installed or collected < 1 or collected > 7 then
			return 0
		end
		local count = collected%2 + math.floor(collected/2)%2 + math.floor(collected/4)%2
		local states = {GadgetState.Action01, GadgetState.Action02, GadgetState.Action03}
		if state == GadgetState.Default or state == GadgetState.Action01 or state == GadgetState.Action02 then
			ScriptLib.SetGadgetState(context, states[count])
		end
		return 0
	end
	if param1 == 1 then
		if state == GadgetState.Default then
			ScriptLib.SetGadgetState(context, GadgetState.Action01)
		elseif state == GadgetState.Action01 then
			ScriptLib.SetGadgetState(context, GadgetState.Action02)
		elseif state == GadgetState.Action02 then
			ScriptLib.SetGadgetState(context, GadgetState.Action03)
		end
	elseif param1 == 2 then
		if state == GadgetState.Default then
			ScriptLib.SetGadgetState(context, GadgetState.Action02)
		elseif state == GadgetState.Action01 or state == GadgetState.Action02 then
			ScriptLib.SetGadgetState(context, GadgetState.Action03)
		end
	elseif param1 == 3 then
		if state == GadgetState.Default or state == GadgetState.Action01 or state == GadgetState.Action02 then
			ScriptLib.SetGadgetState(context, GadgetState.Action03)
		end
	end

	local cur_state = ScriptLib.GetGadgetState(context)
	--临时发送特殊状态信号
	--groupLua拦截到此事件时可以做数据清理
	if param2 == 1 then
		ScriptLib.SetGadgetState(context, GadgetState.ChestLocked)
		ScriptLib.SetGadgetState(context, cur_state)
	end
end