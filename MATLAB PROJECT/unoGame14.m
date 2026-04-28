
%INTRODUCE GAME TO USER
fprintf("Welcome to UNO - matlab version.")
fprintf("\nThe rules of this game are like usual. You can only play a card that is the same colour (r, g, b, or y) or same number, \nor both the same colour and number, as the card on the deck.")
fprintf("\nYou may not end on a wild +4 card, reverse, or skip card. You may end on any other card, including colour changes.")
fprintf("\nUnlike rules to general UNO, you cannot stack +2 or +4 cards with the player. If you or the player places a +2 or +4 card, \n the other will automatically pick up the required amount of cards.")
fprintf("\nnote: card plays are CASE SENSITIVE. Follow the same formatting as shown on screen. \nThe first player to get rid of all their cards WINS. \nGOOD LUCK!")

%define card arrays and create game setting
cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];
%define deck of cards for shuffling and picking up cards
cardNumber=randperm(length(cardDeck)); 
%shuffles card deck for accessing elements 
    usersCards=[]; 
    %defines vector for user
    playersCards=[]; 
    %defines vector for automated player 
    % define the starting card on deck
    cardPlayed=cardDeckNonWild(randperm(length(cardDeckNonWild),1));
    %delete the card
    for i=1:length(cardDeck)
        if strcmp(cardPlayed,cardDeck(i))
            k=i;
            indexToUse=find(cardNumber==k);
        end
    end
    cardNumber(indexToUse)=[];
for i=1:7
    usersCards=[usersCards cardDeck(cardNumber(i))]; 
    % creates user starting deck
    cardNumber(i)=[]; 
    %deletes the card that was used so no repeats are given
    playersCards=[playersCards cardDeck(cardNumber(i+7))]; 
    % builds player starting deck
    cardNumber(i+7)=[];
end

%START GAME%
%define while loop conditions for game, all players need at least one card
%AND the pick-up deck of cards must be greater than 0
while length(usersCards)>0 && length(playersCards)>0 && length(cardNumber)>0
    continueLoop=true;
    while continueLoop
        fprintf("\n %s",cardPlayed)
        fprintf("\nYour cards are:")
        disp(usersCards)
        nextCardPlayed=string(input("Please pick a valid card to play, if no card works, enter ""p"": ","s"));
        nextCardPlayed=char(nextCardPlayed);
        cardPlayed=char(cardPlayed);
        i=string(cardPlayed(1));
        if length(cardPlayed)>1
            i2=string(cardPlayed(2));
        end
        if nextCardPlayed=="p"
            fprintf("You picked up a card: ")
            disp(cardDeck(cardNumber(1)))
            fprintf("\n Player's turn: ")
            usersCards=[usersCards cardDeck(cardNumber(1))];
            cardNumber(1)=[];
            pause(1)
            %%%%
            continueLoop=false;
        elseif (length(strfind(nextCardPlayed,i))>0 || length(strfind(nextCardPlayed,i2))>0) && ismember(nextCardPlayed,usersCards)>0 && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
            %%%%
            fprintf("You played %s. ", nextCardPlayed)
            %delete the card that was just played from the user's array of
            %cards
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[]; %deletes only the first version of the card it finds. For example, if the user has two "C" cards, index(1) will access the first "C" within the users card array
            cardPlayed=nextCardPlayed;
            % could use searchword function to find the index of the card
            % played and delete it so that it gets removed from the
            % usersCards array.
            continueLoop=false;
        elseif (length(strfind(nextCardPlayed,i))>0 || length(strfind(nextCardPlayed,i2))>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"t"))>0
                fprintf("You played a +2 card. The opponent will now automatically pick up two cards.\n It is your turn again.")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                cardNumber(1)=[]; 
                cardNumber(1)=[];
                cardPlayed=nextCardPlayed;
        elseif (length(strfind(nextCardPlayed,i))>0 || length(strfind(nextCardPlayed,i2))>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"s"))>0
            fprintf("You played a skip card. The player's turn is skipped. It is now your turn again: ")
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            pause(1)
            cardPlayed=nextCardPlayed;
        elseif (length(strfind(nextCardPlayed,i))>0 || length(strfind(nextCardPlayed,i2))>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"v"))>0
            fprintf("You played a reverse card. The turn is reversed back to you. It is now your turn again: ")
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            pause(1)
            cardPlayed=nextCardPlayed;
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
            cardNumber(1)=[]; 
            cardNumber(1)=[]; 
            cardNumber(1)=[];
            cardNumber(1)=[];
            
        else
            continueLoop=true;
            %any other input by the user will repeat the loop to enable
            %them to try entering a valid input 
        end 
    end
   
% player goes second
        playersCardsLength=length(playersCards);
        playersCardsLength2=playersCardsLength; 
if length(usersCards)>0 %MAYBE NEED THIS FOR USERS TURN, NOT TOO SURE THOUGH.
    continueLooping=true;
    indexValue=1;
        while continueLooping && indexValue<=playersCardsLength
            nextCardPlayed=char(playersCards(indexValue));
            firstElement=nextCardPlayed(1); 
            secondElement=0;
            if length(nextCardPlayed)>1
                secondElement=nextCardPlayed(2);
            end
            if (length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0) && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
                fprintf("the Player has played a ")
                disp(nextCardPlayed)
                %delete card that was just played from the playersCards
                %array
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                cardPlayed=nextCardPlayed;
                continueLooping=false;
            elseif (length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0) && length(strfind(nextCardPlayed,"t"))>0
                fprintf ("The player has played a +2 card. \nYou will automatically pick up two cards and the player will go again:")
                usersCards=[usersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                cardNumber(1)=[]; 
                cardNumber(1)=[]; 
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                playersCardsLength2=playersCardsLength; %so the player still has a chance to pick up
                cardPlayed=nextCardPlayed;

            elseif (length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0) && length(strfind(nextCardPlayed,"s"))>0
                fprintf("The player has played a skip card. \nYour turn is skipped and the player will go again: ")
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                playersCardsLength2=playersCardsLength; %so the player still has a chance to pick up
                cardPlayed=nextCardPlayed;
            elseif (length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0) && length(strfind(nextCardPlayed,"v"))>0
                fprintf("The player has played a reverse card. The turn has reversed back to the player, skipping your turn. The player will go again: ")
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[]; 
                playersCardsLength=playersCardsLength-1;
                playersCardsLength2=playersCardsLength;
                cardPlayed=nextCardPlayed;
            elseif nextCardPlayed=="C"
                fprintf("The player has played a colour change card.\n")
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                colourArray=["r" "b" "g" "y"];
                colour=colourArray(randperm(4,1));
                cardPlayed=colour;
                fprintf("The colour is changed to %s,",colour)
                continueLooping=false;
            elseif nextCardPlayed=="W"
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                playersCardsLength2=playersCardsLength;
                colourArray=["r" "b" "g" "y"];
                colour=colourArray(randperm(4,1));
                cardPlayed=colour;
                fprintf("The player played a +4 wild card! You will automatically pick up four cards.\n")
                usersCards=[usersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))  cardDeck(cardNumber(3)) cardDeck(cardNumber(4))];
                cardNumber(1)=[]; 
                cardNumber(1)=[]; 
                cardNumber(1)=[];
                cardNumber(1)=[];
                fprintf("The player has changed the colour to %s.",colour)
             
            end
            indexValue=indexValue+1;
        end 
        %if the player has looped through its entire array of cards without
        %playing a single card, the length of its array would be equal to
        %its original copy. this can be used to determine when the player
        %must pick up another card. 
        % if length(playersCardsLength)==length(playersCards) || playersCardsLength==playersCardsLength2 
        if playersCardsLength==playersCardsLength2
            fprintf("\nThe player has picked up a card. Your turn: ")
            playersCards=[playersCards cardDeck(cardNumber(1))];
            cardNumber(1)=[];
            pause(1)
        end
end
end

%END OF GAME
if length(usersCards)==0
    fprintf("YOU WON!")
elseif length(playersCards)==0
    fprintf("YOU LOST :(")
else
    fprintf("You tied.")
end
%display outcome of the game 