-- MQ1011's pot receives native durability-stage callbacks, not ordinary hit toggles.
function OnClientExecuteReq(context, param1, param2, param3)
    if ScriptLib.GetContextGroupId(context) ~= 133001377 or
       ScriptLib.GetContextGadgetConfigId(context) ~= 377001 then
        return 1
    end
    if param1 ~= 901 and param1 ~= 902 and param1 ~= 203 then return 1 end
    local state = ScriptLib.GetGadgetState(context, 0)
    if state == param1 then return 0 end
    if (state == 204 and param1 == 901) or
       (state == 201 and param1 == 902) or
       (state == 202 and param1 == 203) then
        return ScriptLib.SetGadgetState(context, param1)
    end
    return 1
end
