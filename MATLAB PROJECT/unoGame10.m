%define card arrays and create game setting
cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];
%define deck of cards for shuffling and picking up cards
cardNumber=randperm(length(cardDeck)); %shuffles card deck for accessing elements %MIGHT NEED TO REPEAT THIS LINE TO AVOID EXCEEDING INDEX ERROR
    usersCards=[]; %defines vector for user
    playersCards=[]; %defines vector for automated player 
    % define the starting card on deck
    cardPlayed=cardDeckNonWild(randperm(length(cardDeckNonWild),1));
    for i=1:length(cardDeck)
        if strcmp(cardPlayed,cardDeck(i))
            k=i;
            indexToUse=find(cardNumber==k);
        end
    end
    cardNumber(indexToUse)=[];
for i=1:7
    usersCards=[usersCards cardDeck(cardNumber(i))]; % creates user starting deck
    cardNumber(i)=[]; %deletes the card that was used so no repeats are given
    playersCards=[playersCards cardDeck(cardNumber(i+7))]; % builds player starting deck
    cardNumber(i+7)=[];
end
%CAN CHANGE USING ISLETTER SO NEW DECK DOESN'T NEED TO BE DEFINED
%START GAME%
while length(usersCards)>0 && length(playersCards)>0 && length(cardDeck)>0
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
        elseif (length(strfind(nextCardPlayed,i))>0 || length(strfind(nextCardPlayed,i2))>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
            %%%%
            fprintf("You played %s. ", nextCardPlayed)
            %delete the card that was just played
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
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
                cardNumber(2)=[];
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
        elseif nextCardPlayed=="C" && ismember(nextCardPlayed,usersCards)>0
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            fprintf("You played a colour change card.")
            colour=input("What colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ","s");
            cardPlayed=colour;
            continueLoop=false;
        elseif nextCardPlayed=="W" && ismember(nextCardPlayed,usersCards)>0
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            colour=input("You played a +4 wild card! The opponent will automatically pick up 4 cards. \nWhat colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ", "s");
            cardPlayed=colour;
            playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))  cardDeck(cardNumber(3)) cardDeck(cardNumber(4))];
            cardNumber(1)=[]; 
            cardNumber(2)=[]; 
            cardNumber(3)=[];
            cardNumber(4)=[];
            
            %cardNumber=randperm(length(cardDeck));
        else
            continueLoop=true;
        end 
    end
% player goes second
        playersCardsLength=length(playersCards);
        playersCardsLength2=playersCardsLength; %COULD USE THIS
if length(usersCards)>0 %MAYBE NEED THIS FOR USERS TURN, NOT TOO SURE THOUGH.
        for j=1:playersCardsLength
            nextCardPlayed=char(playersCards(j));
            firstElement=nextCardPlayed(1); 
            secondElement=0;
            if length(nextCardPlayed)>1
                secondElement=nextCardPlayed(2);
            end
            if (length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0) && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
                fprintf("the Player has played a ")
                disp(nextCardPlayed)
                %delete card that was just played from the playersCards
                %arry
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                cardPlayed=nextCardPlayed;
                break
            elseif (length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0) && length(strfind(nextCardPlayed,"s"))>0
                fprintf("The player has played a skip card. Your turn is skipped and the player will go again: ")
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                playersCardsLength2=playersCardsLength;
                cardPlayed=nextCardPlayed;
                %j=j-1;
            elseif (length(strfind(cardPlayed,firstElement))>0 || length(strfind(cardPlayed,secondElement))>0) && length(strfind(nextCardPlayed,"v"))>0
                fprintf("The player has played a reverse card. The turn has reversed back to the player, skipping your turn. The player will go again: ")
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[]; %??????????????????????????? IDK ABOUT THIS LOL 
                playersCardsLength=playersCardsLength-1;
                playersCardsLength2=playersCardsLength;
                cardPlayed=nextCardPlayed;
                %j=j-1;
            elseif nextCardPlayed=="C"
                fprintf("The player has played a colour change card.\n")
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                colourArray=["r" "b" "g" "y"];
                colour=colourArray(randperm(4,1));
                cardPlayed=colour;
                fprintf("The colour is changed to %s,",colour)
                break
            elseif nextCardPlayed=="W"
                index=find(playersCards==nextCardPlayed);
                playersCards(index(1))=[];
                playersCardsLength=playersCardsLength-1;
                playersCardsLength2=playersCardsLength;
                %j=j-1; %IDK IF THIS WILL WORK
                colourArray=["r" "b" "g" "y"];
                colour=colourArray(randperm(4,1));
                cardPlayed=colour;
                fprintf("The player played a +4 wild card! You will automatically pick up four cards.\n")
                usersCards=[usersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))  cardDeck(cardNumber(3)) cardDeck(cardNumber(4))];
                cardNumber(1)=[]; 
                cardNumber(2)=[]; 
                cardNumber(3)=[];
                cardNumber(4)=[];
                fprintf("The player has changed the colour to %s.",colour)
                % break
            end
        end 
end
        %if the player has looped through its entire array of cards without
        %playing a single card, the length of its array would be equal to
        %its original copy. this can be used to determine when the player
        %must pick up another card. 
        % if length(playersCardsLength)==length(playersCards) || playersCardsLength==playersCardsLength2 
        if playersCardsLength==playersCardsLength2
            fprintf("The player has picked up a card. Your turn: ")
            playersCards=[playersCards cardDeck(cardNumber(1))];
            cardNumber(1)=[];
            pause(1)
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