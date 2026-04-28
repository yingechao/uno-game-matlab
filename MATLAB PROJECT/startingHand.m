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