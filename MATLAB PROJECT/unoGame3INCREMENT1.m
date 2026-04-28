%define card arrays and create game setting

cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rtwo" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "ytwo" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "btwo" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gtwo" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];

%define deck of cards for shuffling and picking up cards
cardNumber=randperm(length(cardDeck)); %shuffles card deck for accessing elements
    usersCards=[]; %defines vector for user
    playersCards=[]; %defines vector for automated player 
for i=1:7
    usersCards=[usersCards cardDeck(cardNumber(i))]; % creates user starting deck
    cardNumber(i)=[]; %deletes the card that was used so no repeats are given
    playersCards=[playersCards cardDeck(cardNumber(i+7))]; % builds player starting deck
    cardNumber(i+7)=[];
end

% define the starting card on deck
cardPlayed=cardDeckNonWild(randperm(length(cardDeckNonWild),1));
disp(cardPlayed)
%CAN CHANGE USING ISLETTER SO NEW DECK DOESN'T NEED TO BE DEFINED

%connect each card string definition to its corresponding image 
% disp(usersCards)
% disp(playersCards)

%START GAME%
% while length(usersCards)>0 || length(playersCards)>0
% user goes first 
fprintf("Your cards are:")
disp(usersCards)
continueLoop=true;
while continueLoop
    nextCardPlayed=string(input("Please pick a valid card to play, if no card works, enter ""p"": ","s"));
    % nextCardPlayed=char(nextCardPlayed);
    cardPlayed=char(cardPlayed);
    i=string(cardPlayed(1));
    value=length(strfind(nextCardPlayed,i));
    if nextCardPlayed=="p"
        fprintf("You picked up a card: ")
        disp(cardDeck(cardNumber(1)))
        fprintf("\n Player's turn: ")
        usersCards=[usersCards cardDeck(cardNumber(1))];
        cardNumber(1)=[];
        pause(1)
        %%%%
        continueLoop=false;
    elseif length(strfind(nextCardPlayed,i))>0 && ismember(nextCardPlayed,usersCards)>0
        %%%%
        fprintf("You played %s. ", nextCardPlayed)
        if length(strfind(nextCardPlayed,"two"))>0
            fprintf("You played a +2 card. The opponent will now automatically pick up two cards.")
            playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
        end
        continueLoop=false;
    elseif nextCardPlayed=="C"
    elseif nextCardPlayed=="W"
        
    end 

end

% player goes second
    for i=1:length(playersCards)
        cardPlayed=nextCardPlayed;
        k=char(playersCards(i));
        firstElement=k(1);
        if length(k)>1
            secondElement=k(2);
        end
    end
    if length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0
            fprintf("the Player has played a %s ",k,". Your turn")
    else
            fprintf("The player has picked up a card. Your turn: ")
    end 
% end