-- 基础信息
local base_info = {
	group_id = 220368001
}

--================================================================
--
-- 配置
--
--================================================================

-- 怪物
-- 29160101 = Monster_Ronova（若娜瓦，MONSTER_BOSS，描述 91601）
-- pos 是占位：放在出生点正前方（+z）15 米，rot.y = 180 转身面向玩家。
-- vision_level = 2（VISION_LEVEL_REMOTE）：玩家 500 米内就加载，
-- 所以占位坐标和实际落地点差一点也能刷出来。
monsters = {
	{ config_id = 1001, monster_id = 29160101, pos = { x = 0.000, y = 100.000, z = 15.000 }, rot = { x = 0.000, y = 180.000, z = 0.000 }, level = 90, vision_level = 2, disableWander = true, isOneoff = true, pose_id = 0, affix = { } }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
}

-- 区域
regions = {
}

-- 触发器
triggers = {
	{ config_id = 1002, name = "ANY_MONSTER_DIE_1002", event = EventType.EVENT_ANY_MONSTER_DIE, source = "", condition = "condition_EVENT_ANY_MONSTER_DIE_1002", action = "action_EVENT_ANY_MONSTER_DIE_1002", trigger_count = 1 }
}

-- 变量
variables = {
}

--================================================================
--
-- 初始化配置
--
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	end_suite = 0,
	rand_suite = false
}

--================================================================
--
-- 小组配置
--
--================================================================

suites = {
	{
		-- suite_id = 1,
		-- description = 若娜瓦战斗,
		monsters = { 1001 },
		gadgets = { },
		regions = { },
		triggers = { "ANY_MONSTER_DIE_1002" },
		rand_weight = 100
	}
}

--================================================================
--
-- 触发器
--
--================================================================

-- 若娜瓦死亡
function condition_EVENT_ANY_MONSTER_DIE_1002(context, evt)
	if 1001 ~= evt.param1 then
		return false
	end
	return true
end

-- 秘境 1336 原本的通关条件 375 是"完成任务 99902"，私服关着任务系统时永远达不成，
-- 所以打死若娜瓦就直接判定秘境成功（需要 ScriptLib_CauseDungeonSuccess.patch）。
function action_EVENT_ANY_MONSTER_DIE_1002(context, evt)
	if 0 ~= ScriptLib.CauseDungeonSuccess(context) then
		ScriptLib.PrintContextLog(context, "@@ LUA_WARNING : CauseDungeonSuccess failed")
		return -1
	end
	return 0
end
