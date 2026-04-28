%define card arrays and create game setting

cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rtwo" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "ytwo" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "btwo" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gtwo" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];
%define deck of cards for shuffling and picking up cards
cardNumber=randperm(length(cardDeck)); %shuffles card deck for accessing elements %MIGHT NEED TO REPEAT THIS LINE TO AVOID EXCEEDING INDEX ERROR
    usersCards=[]; %defines vector for user
    playersCards=[]; %defines vector for automated player 
for i=1:7
    usersCards=[usersCards cardDeck(cardNumber(i))]; % creates user starting deck
    cardNumber(i)=[]; %deletes the card that was used so no repeats are given
    playersCards=[playersCards cardDeck(cardNumber(i+7))]; % builds player starting deck
    cardNumber(i+7)=[];
end
cardNumber=randperm(length(cardDeck));
% define the starting card on deck
cardPlayed=cardDeckNonWild(randperm(length(cardDeckNonWild),1));
%CAN CHANGE USING ISLETTER SO NEW DECK DOESN'T NEED TO BE DEFINED
%START GAME%

while length(usersCards)>0 && length(playersCards)>0 && length(cardDeck)>0
    continueLoop=true;
    while continueLoop
        fprintf("\nYour cards are:")
        disp(usersCards)
        disp(cardPlayed)
        nextCardPlayed=string(input("Please pick a valid card to play, if no card works, enter ""p"": ","s"));
        cardPlayed=char(cardPlayed);
        i=string(cardPlayed(1));

        if nextCardPlayed=="p"
            fprintf("You picked up a card: ")
            disp(cardDeck(cardNumber(1)))
            fprintf("\n Player's turn: ")
            usersCards=[usersCards cardDeck(cardNumber(1))];
            cardNumber=randperm(length(cardDeck));
            cardNumber(1)=[];
            pause(1)
            %%%%
            continueLoop=false;
        elseif length(strfind(nextCardPlayed,i))>0 && ismember(nextCardPlayed,usersCards)>0
            %%%%
            fprintf("You played %s. ", nextCardPlayed)
            %delete the card that was just played
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            if length(strfind(nextCardPlayed,"two"))>0
                fprintf("You played a +2 card. The opponent will now automatically pick up two cards.")
                playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                cardDeck(cardNumber(1))=[]; cardDeck(cardNumber(2))=[];
                cardNumber=randperm(length(cardDeck));
            end
            cardPlayed=nextCardPlayed;
            % could use searchword function to find the index of the card
            % played and delete it so that it gets removed from the
            % usersCards array.
            continueLoop=false;
        elseif nextCardPlayed=="C"
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            fprintf("You played a colour change card.")
            colour=input("What colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ","s");
            cardPlayed=colour;
            continueLoop=false;
        elseif nextCardPlayed=="W"
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            colour=input("You played a +4 wild card! The opponent will automatically pick up 4 cards. \nWhat colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ", "s");
            cardPlayed=colour;
            playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))  cardDeck(cardNumber(3)) cardDeck(cardNumber(4))];
            cardDeck(cardNumber(1))=[]; cardDeck(cardNumber(2))=[]; cardDeck(cardNumber(3))=[];cardDeck(cardNumber(4))=[];
            cardNumber=randperm(length(cardDeck));
        end 
    
    end
end
