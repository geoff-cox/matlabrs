clear;clc;

blackjack()

function blackjack()

    faces = '234567890JQKA';
    suits = char([9825 9826 9828 9831]);

    deck = create_deck();

    [dealer_hand,my_hand] = initial_deal(deck);
    my_total = get_total(my_hand);
    dealer_total = get_total(dealer_hand);
    
    display_hands(my_hand,dealer_hand,faces,suits);

    fprintf(' \n\n')
    action = input('Hit(H) or Stay(S)? ','S');
    
    % Player's Turn
    while action == 'H'
        [my_hand,deck] = deal_card(my_hand,deck);
        my_total = get_total(my_hand);
        display_hands(my_hand,dealer_hand,faces,suits)
        if my_total > 21
            fprintf('You BUST! GAME OVER!')
            return
        else
            action = input('Hit(H) or Stay(S)? ','S');
        end
    end
    % Dealer's Turn
    while dealer_total < 17
        [dealer_hand,deck] = deal_card(dealer_hand,deck);
        dealer_total = get_total(dealer_hand);
        display_hands(my_hand,dealer_hand,faces,suits)
        if dealer_total > 21
            fprintf('The Dealer BUST! You WIN!\n')
            return
        end
        pause(0.5)
    end
    if my_total > dealer_total
        fprintf('You WIN!\n')
    elseif my_total < dealer_total
        fprintf('Dealer WINs!\n')
    else
        fprintf('You and the Dealer Push.\n')
    end
end
%
function display_hands(mh,dh,faces,suits)
    clc
    fprintf(' Dealer Hand: ')
    for k = 1:size(dh,2)
        if dh(1,k) == 9
            fprintf('10%s',suits(dh(2,k)))
        else
            fprintf('%2s%s',faces(dh(1,k)),suits(dh(2,k)))
        end
    end
    fprintf('    Total: %i\n',get_total(dh))

    fprintf('     My Hand: ')
    for k = 1:size(mh,2)
        if mh(1,k) == 9
            fprintf('10%s',suits(mh(2,k)))
        else
            fprintf('%2s%s',faces(mh(1,k)),suits(mh(2,k)))
        end
    end
    fprintf('    Total: %i\n\n',get_total(mh))
end
% 
function [mh,dh,deck] = initial_deal(deck)
    mh = [];
    dh = [];
    [mh,deck] = deal_card(mh,deck);
    [mh,deck] = deal_card(mh,deck);
    [dh,deck] = deal_card(dh,deck);
    [dh,deck] = deal_card(dh,deck);
end
% 
function [hand,deck] = deal_card(hand,deck)
    cards_in_hand = size(hand,2);
    draw = randi(size(deck,2));
    hand(:,cards_in_hand+1) = deck(:,draw);
    deck(:,draw) = [];
end
%
function deck = create_deck()
deck = [1:13,       1:13,         1:13,         1:13;...
        ones(1,13), 2*ones(1,13), 3*ones(1,13), 4*ones(1,13)...
       ];
end
%
function total = get_total(hand)
    total = 0;
    for k = 1:size(hand,2)
        total = total + get_card_value(hand(1,k));
    end
end
%
function val = get_card_value(card)
    values = [2 3 4 5 6 7 8 9 10 10 10 10 11];
    val = values(card);
end