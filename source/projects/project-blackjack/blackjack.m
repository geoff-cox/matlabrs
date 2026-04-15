game = play_blackjack;

function game = play_blackjack()

    game = initialize_blackjack;
    display_game(game,true);
    while game.player.total <= 21
        action = lower(input('Hit(H) or Stay(S)? ','S'));
        if action == 'h'
            game = deal_cards(game, 'player', 1);
        elseif action == 's'
            break
        end
        display_game(game,true);
    end

    display_game(game, false);

    if game.player.total > 21
        fprintf('You bust! Dealer Wins\n\n')
        return
    end

    while game.dealer.total < 17
        fprintf('Dealer Hits\n')
        pause(2)
        game = deal_cards(game, 'dealer', 1);
        display_game(game,false);
    end

    if game.dealer.total > 21
        fprintf('Dealer busts! You Win!\n\n')
        return
    end

    if game.player.total <= 21 
        if game.player.total > game.dealer.total
            game.result = 2;
            fprintf('You Win!\n\n')
        elseif game.player.total < game.dealer.total
            game.result = 1;
            fprintf('Dealer Wins.\n\n')
        else
            game.result = 0;
            fprintf('Push.\n\n')
        end
    end

end

function deck = create_deck()
    values = [num2str((2:10)');' J';' Q';' K';' A'];
    deck.cards = [ ...
        [values char(ones(13,1)*9825)]; ...
        [values char(ones(13,1)*9826)]; ...
        [values char(ones(13,1)*9824)]; ...
        [values char(ones(13,1)*9827)]; ...
        ];
    deck.dealt = false(1,52);
    deck.num_available = 52;
end

function total = compute_blackjack_total(game, player_id)
    
    card_ids = game.(player_id).card_ids;
    card_values = game.card_values(card_ids);
    total = sum(card_values);
    k = 1;
    while total > 21 && k <= length(card_values)
        if card_values(k) == 11
            total = total - 10;
        end
        k = k + 1;
    end

end

function game = deal_cards(game, player_id, n)
    selected = randi([1 game.deck.num_available],1,n);
    game.deck.dealt(selected) = true;
    game.deck.num_available = game.deck.num_available - n;

    game.(player_id).card_ids = [game.(player_id).card_ids selected];
    game.(player_id).hand = game.deck.cards(game.(player_id).card_ids,:);
    game.(player_id).total = compute_blackjack_total(game, player_id);
end

function game = initialize_blackjack

    game.name = 'blackjack';
    game.deck = create_deck;
    game.active = true;
    game.result = 0;
    game.n_players = 1;
    game.card_values = [2:10 10 10 10 11 2:10 10 10 10 11 2:10 10 10 10 11 2:10 10 10 10 11];
    
    game.dealer = struct('card_ids', [], 'hand', [], 'total', 0);
    game = deal_cards(game, 'dealer', 2);
    game.player = struct('card_ids', [], 'hand', [], 'total', 0);
    game = deal_cards(game, 'player', 2);

end

function display_game(game, players_turn)
    clc

    if players_turn
        fprintf('Player''s Turn\n')
    else
        fprintf('Dealer''s Turn\n')
    end

    fprintf('\nDEALER:  ')
    for k = 1:height(game.dealer.hand)
        if players_turn && k == 1
            fprintf('|???| ')
        else
            fprintf('|%s| ',game.dealer.hand(k,:))
        end
    end
    if players_turn
        fprintf('\n')
    else
        fprintf('\nTOTAL=%g',game.dealer.total)
    end

    fprintf('\n________________________________________________________\n')
    
    fprintf('\nPLAYER:  ')
    for k = 1:height(game.player.hand)
        fprintf('|%s| ',game.player.hand(k,:))
    end
    fprintf('\nTOTAL=%g\n\n',game.player.total)
    
end