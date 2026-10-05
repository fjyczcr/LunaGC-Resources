-- （test）7.1主线 死亡空间 地城 —— 若娜瓦战斗
-- 场景 20368：scriptData = Level_ZD_DeadSpace，levelEntityConfig = Level_Dungeon
-- 秘境 1336（DUNGEON_PLOT，独立关卡，不是大世界镜像），cityID 8（至冬），等级修正 34
--
-- !!! 坐标是占位值 !!!
-- 资源里这个关卡没有任何坐标数据（scene20368_point.json 只有 transRadius = 486），
-- 进秘境后用 /pos 看一下实际落地点，把下面 born_pos / vision_anchor
-- 以及 block / group 文件里的 pos 全部换成真实坐标。

-- 地图配置
scene_config = {
	begin_pos = { x = -2048.0, z = -2048.0 },
	size = { x = 4096.0, z = 4096.0 },
	born_pos = { x = 0.000, y = 100.000, z = 0.000 },  -- 占位
	born_rot = { x = 0.000, y = 0.000, z = 0.000 },
	die_y = -200,
	city_id = 8,
	vision_anchor = { x = 0.000, z = 0.000 }            -- 占位
}

-- 所有的区块
blocks = { 20368 }

-- 所有的区块范围坐标（先铺大一点，坐标定下来后可以缩小）
block_rects = {
	{ min = { x = -2048.0, z = -2048.0 }, max = { x = 2048.0, z = 2048.0 } }
}

-- Dummy Points
dummy_points = { }

-- Routes
routes_config = { }
