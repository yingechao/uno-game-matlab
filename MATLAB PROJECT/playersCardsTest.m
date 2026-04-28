cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];
%define deck of cards for shuffling and picking up cards
cardNumber=randperm(length(cardDeck)); 
playersCards=["r4" "r5" "y7" "y9"];
usersCards=["rt" "W"];
cardPlayed="r1";

    while continueLoop
        fprintf("\n %s",cardPlayed)
        fprintf("\nYour cards are:")
        disp(usersCards)
        nextCardPlayed=string(input("Please pick a valid card to play, if no card works, enter ""p"": ","s"));
        nextCardPlayed=char(nextCardPlayed); % turns nextCardPlayed into a character array so that each element can be accessed

        if nextCardPlayed=="p"
            fprintf("You picked up a card: ")
            disp(cardDeck(cardNumber(1)))
            fprintf("\n Player's turn: ")
            usersCards=[usersCards cardDeck(cardNumber(1))];
            cardNumber(1)=[];
            pause(1)
            %%%%
            continueLoop=false;
        elseif cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0 && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
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
        elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"t"))>0
                fprintf("You played a +2 card. The opponent will now automatically pick up two cards.\n It is your turn again.")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                cardNumber(1)=[]; 
                cardNumber(2)=[];
                cardPlayed=nextCardPlayed;
        elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"s"))>0
            fprintf("You played a skip card. The player's turn is skipped. It is now your turn again: ")
            index=find(usersCards==nextCardPlayed);
            usersCards(index(1))=[];
            pause(1)
            cardPlayed=nextCardPlayed;
        elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"v"))>0
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
            cardNumber(2)=[]; 
            cardNumber(3)=[];
            cardNumber(4)=[];
            
        else
            continueLoop=true;
            %any other input by the user will repeat the loop to enable
            %them to try entering a valid input 
        end 
    end