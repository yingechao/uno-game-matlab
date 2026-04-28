cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];
%define deck of cards for shuffling and picking up cards
cardNumber=randperm(length(cardDeck)); 
usersCards=["r1"];
cardPlayed="rs";
playersCards=["W" "W" "b9" "W"];

playersCardsLength=length(playersCards);
playersTurn=true;
indexValue=1; %initiate index value for number of loop iterations 
    
            while playersTurn && indexValue<=playersCardsLength
                nextCardPlayed=char(playersCards(indexValue)); % loop through players hand with a while loop, using the indexValue
    
                if (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
                    fprintf("\nThe Player has played a ")
                    disp(nextCardPlayed)
                    %delete card that was just played from the playersCards
                    %array
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    cardPlayed=nextCardPlayed;
                    playersTurn=false;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"t"))>0
                    fprintf ("The player has played a +2 card. \nYou will automatically pick up two cards and the player will go again:")

                    usersCards=[usersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                    cardNumber(1)=[]; 
                    cardNumber(1)=[]; 
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1; %so the player still has a chance to pick up
                    indexValue=0;
                    cardPlayed=nextCardPlayed;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"s"))>0
                    fprintf("\nThe player has played a skip card. \nYour turn is skipped and the player will go again: ")
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1;
                    indexValue=0;
                    cardPlayed=nextCardPlayed;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"v"))>0
                    fprintf("\nThe player has played a reverse card. The turn has reversed back to the player, skipping your turn. The player will go again: ")
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[]; 
                    playersCardsLength=playersCardsLength-1;
                    indexValue=0;
                    cardPlayed=nextCardPlayed;
    
                elseif nextCardPlayed=="C"
                    fprintf("\nThe player has played a colour change card.\n")
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    colourArray=["r" "b" "g" "y"];
                    colour=colourArray(randperm(4,1));
                    cardPlayed=colour; %set card played to colour
                    switch colour %display randomised colour change depending on case 
                        case {"r"}
                            fprintf("The colour is changed to red. ")
                        case {"b"}
                            fprintf("The colour is changed to blue. ")
                        case {"g"}
                            fprintf("The colour is changed to green. ")
                        case {"y"}
                            fprintf("The colour is changed to yellow. ")
                    end

                    %fprintf("The colour is changed to %s,",colour)

                    playersTurn=false;
    
                elseif nextCardPlayed=="W"
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1;
                    colourArray=["r" "b" "g" "y"];
                    colour=colourArray(randperm(4,1)); %selects random element from colourArray
                    indexValue=0;
                    cardPlayed=colour; % assigns the colour to cardPlayed 
                    fprintf("\nThe player played a +4 wild card! You will automatically pick up four cards.\n")

                    if length(cardNumber)>=4 % check if there are enough cards to give to the user 
                        usersCards=[usersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))  cardDeck(cardNumber(3)) cardDeck(cardNumber(4))];
                        cardNumber(1)=[]; 
                        cardNumber(1)=[]; 
                        cardNumber(1)=[];
                        cardNumber(1)=[];
                    elseif length(playersCards)==0
                        playersTurn=false;
                        
                    else 
                        playersTurn=false; % terminate game by deleting the remaining elements in cardNumber. This will cause a tie between the user and player as there are not enough cards to continue.
                        for i=1:length(cardNumber)
                            cardNumber(1)=[];
                        end
                    end

                    switch colour
                        case {"r"}
                            fprintf("The colour is changed to red. ")
                        case {"b"}
                            fprintf("The colour is changed to blue. ")
                        case {"g"}
                            fprintf("The colour is changed to green. ")
                        case {"y"}
                            fprintf("The colour is changed to yellow. ")
                    end
                end
                indexValue=indexValue+1;
            end 
            %if the player has looped through its entire array of cards without
            %playing a single card, the length of its array would be equal to
            %its original copy. This can be used to determine when the player
            %must pick up another card. Additionally, if the player plays a reverse, skip,
            % +2 or +4 card, playersCardLength is reduced by 1 as the
            % player needs to take another turn and thus may neeed to pick
            % up a card

            if playersCardsLength==length(playersCards) && length(cardNumber)>0 && length(playersCards)>0 && length(cardNumber)>0  
                fprintf("\nThe player has picked up a card. Your turn: ")
                playersCards=[playersCards cardDeck(cardNumber(1))];
                cardNumber(1)=[];
            end