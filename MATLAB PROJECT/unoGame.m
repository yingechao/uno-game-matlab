%define card arrays and create game setting

cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rtwo" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "ytwo" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "btwo" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gtwo" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rtwo" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "ytwo" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "btwo" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gtwo"];

%define deck of cards for shuffling and picking up cards
cardNumber=randperm(length(cardDeck)); %shuffles card deck for accessing elements
    usersCards=[]; %defines vector for user
    playersCards=[]; %defines vector for automated player 
for i=1:7
    usersCards=[usersCards cardDeck(cardNumber(i))]; % creates user starting deck
    playersCards=[playersCards cardDeck(cardNumber(i+7))]; % builds player starting deck
end

% define the starting card on deck
cardPlayed=cardDeckNonWild(randperm(length(cardDeckNonWild),1));
disp(cardPlayed)

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
    nextCardPlayed=input("Please pick a valid card to play, if no card works, enter ""p"": ","s");
    nextCardPlayed=char(nextCardPlayed);
    cardPlayed=char(cardPlayed);
    if nextCardPlayed=="p"
        %%%%
        continueLoop=false;
    elseif length(strfind(nextCardPlayed(1),cardPlayed))>0 && ismember(nextCardPlayed,usersCards)>=0
        continueLoop=false;
 
    end 

end

% player goes second
    for i=1:length(playersCards)

    end
% end