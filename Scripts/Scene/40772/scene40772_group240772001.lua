-- AstaPS 7.1 compatibility group, not a recovered native domain script.
-- Monster waves are created by MissingDomainFallbackManager after option 7.
local base_info = { group_id = 240772001 }
monsters = {
    { config_id = 1001, monster_id = 21010201, pos = { x = -5.250, y = 0.200, z = -10.000 }, rot = { x = 0.000, y = 180.000, z = 0.000 }, level = 60 },
    { config_id = 1002, monster_id = 21010301, pos = { x = -1.750, y = 0.200, z = -11.500 }, rot = { x = 0.000, y = 180.000, z = 0.000 }, level = 60 },
    { config_id = 1003, monster_id = 21010701, pos = { x = 1.750, y = 0.200, z = -10.000 }, rot = { x = 0.000, y = 180.000, z = 0.000 }, level = 60 },
    { config_id = 1004, monster_id = 21010201, pos = { x = 5.250, y = 0.200, z = -11.500 }, rot = { x = 0.000, y = 180.000, z = 0.000 }, level = 60 },
    { config_id = 1005, monster_id = 21010301, pos = { x = -5.250, y = 0.200, z = -15.000 }, rot = { x = 0.000, y = 180.000, z = 0.000 }, level = 60 }
}
npcs = {}
gadgets = {
    { config_id = 9001, gadget_id = 70360010, pos = { x = 0.000, y = 0.000, z = 0.000 }, rot = { x = 0.000, y = 180.000, z = 0.000 }, level = 1 }
}
regions = {}
triggers = {}
variables = {}
init_config = { suite = 1, end_suite = 0, rand_suite = false }
suites = {
    { monsters = {}, gadgets = {9001}, regions = {}, triggers = {}, rand_weight = 100 }
}
