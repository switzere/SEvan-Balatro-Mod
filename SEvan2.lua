--- aSTEAMODDED HEADER
--- MOD_NAME: SEvan2
--- MOD_ID: SEvan2
--- MOD_AUTHOR: [SEvan2]
--- MOD_DESCRIPTION: Idk it's just things I want

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

function printTable(t, indent)
    indent = indent or ""
    for key, value in pairs(t) do
        if type(value) == "table" then
            print(indent .. tostring(key) .. ":")
            printTable(value, indent .. "  ")
        else
            print(indent .. tostring(key) .. ": " .. tostring(value))
        end
    end
end

function tableToStringFirstLayer(tbl)
    if type(tbl) ~= "table" then return tostring(tbl) end
    local keys = {}
    for k in pairs(tbl) do
        keys[#keys + 1] = k
    end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    local lines = {}
    for _, k in ipairs(keys) do
        local v = tbl[k]
        if type(v) == "table" then
            lines[#lines + 1] = tostring(k) .. ": {...}" -- Indicate that this is a table without showing its contents
        else
            lines[#lines + 1] = tostring(k) .. ": " .. tostring(v)
        end
    end
    return table.concat(lines, "\n")
end

local Backapply_to_runRef2 = Back.apply_to_run
function Back.apply_to_run(arg_57_0)
	Backapply_to_runRef2(arg_57_0)



    sendDebugMessage("S2 -------------------")


    sendDebugMessage(tableToString(arg_57_0))
    
	if arg_57_0.effect.config.only_one_card2 then
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



                -- local initial_deck_size = #G.playing_cards
				-- for i = initial_deck_size, 1, -1 do					
				-- 	-- Add copy and change its back to red card
				-- 	-- The game makes copying a card and adding it to the deck A LOT harder than it should be.
				-- 	-- Increment a global variable that governs deck size, copy the card, change its back sprite, and manually put it in the deck
				-- 	G.playing_card = initial_deck_size + i
				-- 	local copied_card = copy_card(G.playing_cards[i], nil, 1, G.playing_card)
				-- 	--set_card_back_sprite(copied_card, 'b_red')
				-- 	G.deck:emplace(copied_card)
				-- 	G.playing_cards[G.playing_card] = copied_card
				-- end

                -- G.deck:remove_card(G.playing_cards[1])
                -- G.deck:remove_card(G.playing_cards[2])
                -- G.deck:remove_card(G.playing_cards[3])
                -- G.deck:remove_card(G.playing_cards[4])
                -- G.deck:remove_card(G.playing_cards[5])

                -- G.playing_cards[1]:remove_from_deck()
                -- G.playing_cards[2]:remove_from_deck()
                -- G.playing_cards[3]:remove_from_deck()
                -- G.playing_cards[4]:remove_from_deck()
                -- G.playing_cards[5]:remove_from_deck()

                -- G.playing_cards[1]:start_dissolve(nil, true)
                -- G.playing_cards[2]:start_dissolve(nil, true)
                -- G.playing_cards[3]:start_dissolve(nil, true)
                -- G.playing_cards[4]:start_dissolve(nil, true)

                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)
                -- create_playing_card({front = G.P_CARDS["C_6"]}, G.deck)


                -- create_playing_card({front = G.P_CARDS[_suit..'_'.._rank], center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))}, G.hand, nil, i ~= 1, {G.C.SECONDARY_SET.Spectral})

                -- local c = create_card('Base', , nil, nil, G.playing_card)

                -- Clear existing cards
                -- G.deck = {
                --     cards = {
                --         {s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},
                --         {s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},
                --         {s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},
                --         {s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',}
                --     }
                -- }
                -- sendDebugMessage(tableToString(G.deck.cards))
                -- Add the new card

                -- G.playing_cards = {
                --     create_card('Base', G.deck, G.P_CARDS["C_" .. "6"]),
                --     create_card('Base', G.deck, G.P_CARDS["C_" .. "6"]),
                --     create_card('Base', G.deck, G.P_CARDS["C_" .. "6"]),
                --     create_card('Base', G.deck, G.P_CARDS["C_" .. "6"]),
                -- }

                -- for i = #G.playing_cards, 1, -1 do
                --     table.remove(G.playing_cards, i)
                -- end

                -- local card = create_card('Base', G.deck,)

                -- --for loop from 0 - 6
                
                -- playing_card: 52
                -- playing_cards: {...}

                -- for all cards in playing_cards

                -- G.playing_cards[1]:remove_from_deck()
                -- G.playing_cards[2]:remove_from_deck()
                -- G.playing_cards[3]:remove_from_deck()
                -- G.playing_cards[4]:remove_from_deck()
                -- G.playing_cards[5]:remove_from_deck()

                -- -- local card = create_card('Base',G.consumeables, nil, nil, nil, nil, _planet, 'blusl')
                -- sendDebugMessage("Deck Config -------------------")
                -- sendDebugMessage(tableToStringFirstLayer(G.deck))
                -- sendDebugMessage(tableToStringFirstLayer(G.deck.config))
                -- --sendDebugMessage(tableToStringFirstLayer(G.deck.ARGS))
                -- sendDebugMessage(tableToStringFirstLayer(G.deck.cards[1]))


                -- sendDebugMessage("Game -------------------")
                -- sendDebugMessage(tableToStringFirstLayer(G.GAME))
                -- sendDebugMessage("Playing Card -------------------")
                -- sendDebugMessage(tableToStringFirstLayer(G.playing_card))
                -- sendDebugMessage("Playing Cards -------------------")
                -- sendDebugMessage(tableToStringFirstLayer(G.playing_cards[2]))
                -- sendDebugMessage("Deck -------------------")
                -- sendDebugMessage(tableToStringFirstLayer(G.deck.ARGS))

                -- sendDebugMessage("New Card -------------------")
                -- --local card = SMODS.Card:new("Clubs", "3")
                -- --table.insert(G.playing_cards, card)

                -- sendDebugMessage(tableToStringFirstLayer(card))
                -- sendDebugMessage("`````` end")
                
                --card:add_to_deck()

                --for i = #G.playing_cards, 1, -1 do
                --    G.playing_cards[i]:remove()
               -- end

                -- sendDebugMessage("Deck Config -------------------")
                -- sendDebugMessage(tableToString(G))



                --table.remove(G.playing_cards, 5)
                --table.remove(G.playing_cards, 6)
                --table.remove(G.playing_cards, 7)
                --table.remove(G.playing_cards, 8)

                -- local _card = Card('Base', G.deck, G.P_CARDS["H_" .. "2"])
                -- table.insert(G.playing_cards, _card)

                -- G.deck.config.card_limit = G.deck.config.card_limit - 4

                -- G.deck.config.highlighted_limit = 3

                -- sendDebugMessage("Deck Config -------------------")
                -- sendDebugMessage(tableToString(G.deck.config))

                -- G.GAME.starting_deck_size = 7
                
				
				return true
			end
		}))
	end
end

--SMODS.Deck = {name = "", slug = "", config = {}, spritePos = {}, loc_txt = {}, unlocked = true, discovered = true}

local rank = 2

local loc_def2 = {
    ["name"] = "one card",--string.format("Deck of %d", rank),
    ["text"] = {
        [1] = "Start with a Deck",
        [2] = "with only 1 card"--string.format("full of {C:attention}%ds{}", rank)
    },
}

local one_card = SMODS.Deck:new(
	string.format("Deck of %d test", rank), 
	string.format("%ds test", rank), --this is the slug, it is an identifier
	{hands = 4, discards = 4, hand_size = -1, dollars = 3, joker_slot = 2, only_one_card2 = rank},
	{x = 1, y = 3},
	loc_def2
)
one_card:register()

----------------------------------------------
------------MOD CODE END----------------------
