--- STEAMODDED HEADER
--- MOD_NAME: SEvan
--- MOD_ID: SEvan
--- MOD_AUTHOR: [SEvan]
--- MOD_DESCRIPTION: Idk it's just things I want
--- BADGE_COLOUR: 332255

----------------------------------------------
------------MOD CODE -------------------------

function tableToString(tbl, indent)
    if not indent then indent = 0 end
    if type(tbl) ~= "table" then return tostring(tbl) end
    local keys = {}
    for k in pairs(tbl) do
        keys[#keys + 1] = k
    end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    local lines = {}
    for _, k in ipairs(keys) do
        local v = tbl[k]
        local prefix = string.rep("  ", indent) .. tostring(k) .. ": "
        if type(v) == "table" then
            table.insert(lines, prefix .. "{\n" .. tableToString(v, indent + 1) .. "\n" .. string.rep("  ", indent) .. "}")
        else
            table.insert(lines, prefix .. tostring(v))
        end
    end
    return table.concat(lines, "\n")
end

local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(arg_56_0)
	Backapply_to_runRef(arg_56_0)

	--sendDebugMessage("S1.1 -------------------")
    --sendDebugMessage(tableToString(arg_56_0))

	
	--sendDebugMessage("S1.2 -------------------")
	--sendDebugMessage(tostring(arg_56_0.effect.config.only_one_rank))
	if arg_56_0.effect.config.only_one_rank then
		--sendDebugMessage(tostring(agr_56_0.effect.config.only_one_card))
		G.E_MANAGER:add_event(Event({
			func = function()
				local rank = tostring(arg_56_0.effect.config.only_one_rank) -- Convert the rank to string
				--sendDebugMessage("S1.3 -------------------")
				--sendDebugMessage(tostring(arg_56_0.effect.config.only_one_rank))
				--sendDebugMessage("hi from SEvan.lua")
				for iter_56_0 = #G.playing_cards, 1, -1 do
					--sendDebugMessage(G.playing_cards[iter_56_0].base.id)
					--sendDebugMessage(iter_56_0)
	
					local suit = string.sub(G.playing_cards[iter_56_0].base.suit, 1, 1) .. "_"
					--sendDebugMessage(suit)
					--sendDebugMessage(rank)
					G.playing_cards[iter_56_0]:set_base(G.P_CARDS[suit .. rank])
					
				end
				return true
			end
		}))
	end

	if arg_56_0.effect.config.only_one_card2 then
		G.E_MANAGER:add_event(Event({
			func = function()

                for i = #G.playing_cards, 1, -1 do
                    G.playing_cards[i]:remove()
                    --or G.playing_cards[i]:start_dissolve(nil, true)
                end

                create_playing_card({front = G.P_CARDS["C_7"]}, G.deck)
                create_playing_card({front = G.P_CARDS["H_7"]}, G.deck)
                create_playing_card({front = G.P_CARDS["D_7"]}, G.deck)
                create_playing_card({front = G.P_CARDS["S_7"]}, G.deck)
                create_playing_card({front = G.P_CARDS["C_7"]}, G.deck)
                create_playing_card({front = G.P_CARDS["H_7"]}, G.deck)
                create_playing_card({front = G.P_CARDS["D_7"]}, G.deck)

			return true
			end
		}))
	end

end

--SMODS.Deck = {name = "", slug = "", config = {}, spritePos = {}, loc_txt = {}, unlocked = true, discovered = true}



function SMODS.INIT.SEvan()
	local rank = 6
	local one_rank = SMODS.Deck:new(
		string.format("Deck of %d", rank), 
		string.format("only %ds", rank),
		{only_one_rank = rank},
		{x = 1, y = 3},
		{
			["name"] = string.format("Deck of %d", rank),
			["text"] = {
				[1] = "Start with a Deck",
				[2] = string.format("full of {C:attention}%ds{}", rank)
			},
		}
	)	
	one_rank:register()

	local deck_7 = SMODS.Deck:new(
		string.format("Deck of 7"), 
		string.format("7s", rank), --this is the slug, it is an identifier
		{hands = 3, discards = 4, hand_size = -1, dollars = 3, joker_slot = 2, only_one_card2 = rank},
		{x = 1, y = 3},
		{
			["name"] = "7s",--string.format("Deck of %d", rank),
			["text"] = {
				[1] = "Start with a Deck",
				[2] = "with 7 7s"--string.format("full of {C:attention}%ds{}", rank)
			},
		}
	)
	deck_7:register()

end


----------------------------------------------
------------MOD CODE END----------------------