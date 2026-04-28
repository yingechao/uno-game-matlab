%INTRODUCE GAME TO USER
%print instructions 
fprintf("Welcome to UNO - matlab version.")
input("\nContinue pressing ""Enter"" to continue to the next sections:")
fprintf("\nThe rules of this game are like usual. You can only play a card that is the same colour (r, g, b, or y) or same number, \nor both the same colour and number, as the card on the deck.")
input("") %waits for user to press Enter
fprintf("\nUnlike rules to general UNO, you cannot stack +2 or +4 cards with the player. If you or the player places a +2 or +4 card, \n the other will automatically pick up the required amount of cards.")
input("")
fprintf("\nnote: card plays are CASE SENSITIVE. Follow the same formatting as shown on screen.\nFor example, if you want to play a red 8 card, input ""r8"" \nThe first player to get rid of all their cards WINS. ")
input("") 

repeatLegendRequest=true;
while repeatLegendRequest
    displayLegend=input("Would you like a legend to see the correct inputs for each card? Select Y (yes) or N (no): ","s");
    if displayLegend=="Y"
        r1=imread("red1.png");rt=imread("redPlusTwo.png");
        rs=imread("redSkip.png");rv=imread("redReverse.png");
        y1=imread("yellow1.png");yt=imread("yellowPlusTwo.png");
        ys=imread("yellowSkip.png");yv=imread("yellowReverse.png");
        b1=imread("blue1.png");bt=imread("bluePlusTwo.png");
        bs=imread("blueSkip.png");bv=imread("blueReverse.png");
        g1=imread("green1.png");gt=imread("greenPlusTwo.png");
        gs=imread("greenSkip.png");gv=imread("greenReverse.png");
        C=imread("colourChange.png");
        W=imread("plusFour.png"); %read in required images
    
        figure('color','#222222') %set up figure colour
        
        subplot(5,4,1),imshow(r1) %plot image
        title("r1","color","w") % add title to image
        subplot(5,4,2),imshow(rt)
        title("rt","color","w")
        subplot(5,4,3),imshow(rs)
        title("rs","color","w")
        subplot(5,4,4),imshow(rv)
        title("rv","color","w")
    
        subplot(5,4,5),imshow(y1)
        title("y1","color","w")
        subplot(5,4,6),imshow(yt)
        title("yt","color","w")
        subplot(5,4,7),imshow(ys)
        title("ys","color","w")
        subplot(5,4,8),imshow(yv)
        title("yv","color","w")
    
        subplot(5,4,9),imshow(b1)
        title("b1","color","w")
        subplot(5,4,10),imshow(bt)
        title("bt","color","w")
        subplot(5,4,11),imshow(bs)
        title("bs","color","w")
        subplot(5,4,12),imshow(bv)
        title("bv","color","w")
    
        subplot(5,4,13),imshow(g1)
        title("g1","color","w")
        subplot(5,4,14),imshow(gt)
        title("gt","color","w")
        subplot(5,4,15),imshow(gs)
        title("gs","color","w")
        subplot(5,4,16),imshow(gv)
        title("gv","color","w")
    
        subplot(5,4,18),imshow(C)
        title("C","color","w")
        subplot(5,4,19),imshow(W)
        title("W","color","w")
        
        repeatLegendRequest=false;
    elseif displayLegend=="N"
        repeatLegendRequest=false;
    else 
    end 
end

nameNotEntered=true; %set up flag for while loop of user inputting their name
while nameNotEntered
    userName=input("What is your name? ","s"); %get name input from user and store in variable userName
    if isletter(userName)>0 %check if the user has entered only letters 
        nameNotEntered=false; %break out of the while loop
    else 
        %if the user has not entered letters, the while loop is continued
        %and the error message is displayed
        fprintf("Please try again. Enter only letters.\n")
    end
end

%define card arrays and create game setting
cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];
%define deck of cards for shuffling and picking up cards

%create dictionary linking the cardDeck to display values that are more readable to the user
cardDeckInWords=["RED 1 (r1)" "RED 2 (r2)" "RED 3 (r3)" " RED 4 (r4)" "RED 5 (R5)" "RED 6 (r6)" "RED 7 (r7)" "RED 8 (r8)" "RED 9 (r9)" "RED SKIP (rs)" "RED REVERSE (rv)" "RED +2 (rt)" "YELLOW 1 (y1)" "YELLOW 2 (y2)" "YELLOW 3 (y3)" "YELLOW 4 (y4)" "YELLOW 5 (y5)" "YELLOW 6 (y6)" "YELLOW 7 (y7)" "YELLOW 8 (y8)" "YELLOW 9 (y9)" "YELLOW SKIP (ys)" "YELLOW REVERSE (yv)" "YELLOW +2 (yt)" "BLUE 1 (b1)" "BLUE 2 (b2)" "BLUE 3 (b3)" "BLUE 4 (b4)" "BLUE 5 (b5)" "BLUE 6 (b6)" "BLUE 7 (b7)" "BLUE 8 (b8)" "BLUE 9 (b9)" "BLUE SKIP (bs)" "BLUE REVERSE (bv)" "BLUE +2 (bt)" "GREEN 1 (g1)" "GREEN 2 (g2)" "GREEN 3 (g3)" "GREEN 4 (g4)" "GREEN 5 (g5)" "GREEN 6 (g6)" "GREEN 7 (g7)" " GREEN 8 (g8)" "GREEN 9 (g9)" "GREEN SKIP (gs)" "GREEN REVERSE (gv)" "GREEN +2 (gt)" "+4 WILD CARD (W)" "+4 WILD CARD (W)" "+4 WILD CARD (W)" "+4 WILD CARD (W)" "COLOUR CHANGE (C)" "COLOUR CHANGE (C)" "COLOUR CHANGE (C)" "COLOUR CHANGE (C)"];

gameOn=true; % set up flag for the UNO game. The game will be governed under a while loop so that the user can play as many rounds as they would like
usersScore=0;
playersScore=0;
%initiate the user's score and the player's score (the player is the
%automated player programmed into the game).

while gameOn
    endRound=0;
    clc;
    fprintf("Start round: ")
    pause(1)
    cardNumber=randperm(length(cardDeck)); 
    %shuffles card deck for accessing elements with in built function
    %randperm

    % initiation of users cards and player's cards
        usersCards=[]; 
        %defines vector for user
        playersCards=[]; 
        %defines vector for automated player 
    
        % define the starting card on deck
        % take a randomly generated card from the non-wild card deck (as UNO
        % games start on a non-wild card, and assign to variable cardPlayed.
        cardPlayed=cardDeckNonWild(randperm(length(cardDeckNonWild),1)); 
        % delete the card
        
        % loop through the entire card deck to find the matching string for
        % the card played (cardPlayed)
        for i=1:length(cardDeck)
            if strcmp(cardPlayed,cardDeck(i))
                % once the card played is found in the card deck, use
                % its index number (i) from the card deck to store in a variable 
                % (being the index of i in cardNumber), to find its
                % corresponding card number
                indexToUse=find(cardNumber==i);
            end
        end
        cardNumber(indexToUse(1))=[]; %delete the card number that was related to the card played.
    
        % build up user's cards and automated player's snaps
    for i=1:7
        usersCards=[usersCards cardDeck(cardNumber(i))]; 
        % creates user starting deck by concatenating 7 randomly generated
        % cards
        cardNumber(i)=[]; 
        % deletes the card that was used so no repeats are given
        playersCards=[playersCards cardDeck(cardNumber(i+7))]; 
        % builds player starting deck
        cardNumber(i+7)=[];
    end
    
    %START GAME%
    
    %define while loop conditions for game, all players need at least one card
    %AND the pick-up deck of cards must be greater than 0
    while length(usersCards)>0 && length(playersCards)>0 && length(cardNumber)>0
        usersTurn=true;
        
        while usersTurn
            fprintf("\n %s\n\n",cardPlayed)
            fprintf("\nYour cards are:")
            disp(usersCards) %%%%%%%%%%%%%%%%%%%%%%%%% MIGHT CHANGE THIS 
            nextCardPlayed=input("Please pick a valid card to play. If no card works or you want to pick up a card, enter ""p"": ","s");
            nextCardPlayed=char(nextCardPlayed); % turns nextCardPlayed into a character array so that each element can be accessed
    
            if nextCardPlayed=="p"
                fprintf("You picked up a card: ")
                disp(cardDeck(cardNumber(1)))
                fprintf("\n Player's turn: ")
                usersCards=[usersCards cardDeck(cardNumber(1))];
                cardNumber(1)=[];
                usersTurn=false; %break out of the loop
    
            elseif cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0 && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
                %checks if the card played has a matching element (either
                %matching number or matching  colour), and checks that the
                %card does not contain 't', 's' or 'v', and checks that the
                %nextCardPlayed is a part of the usersCards array
                fprintf("You played %s. ", nextCardPlayed)
                %delete the card that was just played from the user's array of
                %cards
                %first find the index of the card that the user has
                %recently played (nextCardPlayed) in the usersCards array
                index=find(usersCards==nextCardPlayed);
                %use the index to delete the card from the usersCards array
                usersCards(index(1))=[]; %deletes only the first version of the card it finds. For example, if the user has two "C" cards, index(1) will access the first "C" within the users card array
                cardPlayed=nextCardPlayed;
                %replace the card on the deck (cardPlayed) with the card
                %that the user has played (nextCardPlayed)
                usersTurn=false;
    
            elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"t"))>0
                    fprintf("You played a +2 card. The opponent will now automatically pick up two cards.\n It is your turn again.")
                    index=find(usersCards==nextCardPlayed);
                    usersCards(index(1))=[];

                    cardPlayed=nextCardPlayed;
                if length(usersCards)==0
                    usersTurn=false;
                end

                if length(cardNumber)>=2
                playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                %automatically add 
                cardNumber(1)=[]; 
                cardNumber(1)=[]; 
                elseif length(usersCards)==0
                    usersTurn=false;
                else 
                    usersTurn=false;
                    playersTurn=false;
                    for i=1:length(cardNumber)
                        cardNumber(1)=[]; %deletes all cards as there is not enough for this play. 
                    end
                end


            elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"s"))>0
                fprintf("You played a skip card. The player's turn is skipped. It is now your turn again: ")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                cardPlayed=nextCardPlayed;
                    if length(usersCards)==0
                        usersTurn=false;
                    end
    
            elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"v"))>0
                fprintf("You played a reverse card. The turn is reversed back to you. It is now your turn again: ")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                cardPlayed=nextCardPlayed;
                    if length(usersCards)==0
                        usersTurn=false;
                    end
    
            elseif nextCardPlayed=="C" %check if player has played a colour change card
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                fprintf("You played a colour change card.")
                colour=input("\nWhat colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ","s");
                %ask user what colour they would like to change to

                %make sure the user entered a valid value for the colour
                %change
                colourInputWasCorrect=false; %set up flag for while loop 
                while ~colourInputWasCorrect  
                if checkColour(colour)==0 %check is user has entered either one of these values
                    colour=input("Please try again. Enter either r, g, b, or y: ","s"); %display error message if not
                    colourInputWasCorrect=false;
                else
                    cardPlayed=colour;
                    colourInputWasCorrect=true;
                end
                    end 

                usersTurn=false;

            
    
            elseif nextCardPlayed=="W"
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                colour=input("You played a +4 wild card! The opponent will automatically pick up 4 cards. \nWhat colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ", "s");
                                
                colourInputWasCorrect=false;
                while ~colourInputWasCorrect  
                    if checkColour(colour)==0
                        colour=input("Please try again. Enter either r, g, b, or y: ","s");
                        colourInputWasCorrect=false;
                    else
                        cardPlayed=colour;
                        colourInputWasCorrect=true;
                    end
                end 

                if length(usersCards)==0 %if "W" was the last card that the user had played, the round should 
                    %be terminated as they have removed all their cards and
                    %won the round. 
                    usersTurn=false;
                end
    
                if length(cardNumber)>=4 %check if there are enough cards from the deck to concatenate to the playersCards array
                playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))  cardDeck(cardNumber(3)) cardDeck(cardNumber(4))];
                %automatically add cards to the players hand
                cardNumber(1)=[]; 
                cardNumber(1)=[]; 
                cardNumber(1)=[];
                cardNumber(1)=[];
                % elseif length(usersCards)==0
                %     usersTurn=false;

                else %there are not enough cards so the game must be terminated 
                    for i=1:length(cardNumber)
                        cardNumber(1)=[]; %delete all card numbers as there is not enough for this play
                    end
                    endRound=1; %skip players turn 
                end
            else
                usersTurn=true;
                %any other input by the user will repeat the loop to enable
                %them to try entering a valid input 
            end 

        end
       
    % player goes second
            playersCardsLength=length(playersCards);
            %playersCardsLength2=playersCardsLength; 
            %initiate the length of the players hand before they play any
            %cards. This is done to use the lengths later on.
    
            if length(usersCards)>0 && endRound==0
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
                    cardPlayed=nextCardPlayed;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"s"))>0
                    fprintf("\nThe player has played a skip card. \nYour turn is skipped and the player will go again: ")
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1;
                    cardPlayed=nextCardPlayed;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"v"))>0
                    fprintf("\nThe player has played a reverse card. The turn has reversed back to the player, skipping your turn. The player will go again: ")
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[]; 
                    playersCardsLength=playersCardsLength-1;
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
    end
    end
    
    %END OF GAME
    
    if length(usersCards)==0
        fprintf("\nYou have removed all cards in your hand. \nYOU WON!")
        fprintf("\n\nYou have scored 1 point. The current scores are: ")
        usersScore=usersScore+1;
        fprintf("\n\n%s's Score: %.0f",userName,usersScore)
        fprintf("\nPlayer's Score: %.0f",playersScore)
        playAgain=input("\n\nWould you like to play another round? (Enter Y/N): ","s");
        
    elseif length(playersCards)==0
        fprintf("\nThe player has removed all cards in their hand. \nYOU LOST :(")
        fprintf("\n\nThe player has scored 1 point. The current scores are: ")
        playersScore=playersScore+1;
        fprintf("\n\n%s's Score: %.0f",userName,usersScore)
        fprintf("\nPlayer Score: %.0f",playersScore) 
        playAgain=input("\n\nWould you like to play another round? (Enter Y/N): ","s");

    else
        fprintf("\nYou tied. There are not enough cards to continue playing. No points will be received for this round.")
        fprintf("\nThe current scores are: ")
        fprintf("\n\n%s's Score: %.0f",userName,usersScore)
        fprintf("\nPlayer Score: %.0f",playersScore) 
        playAgain=input("\n\nWould you like to play another round? (Enter Y/N): ","s");

    end
    repeatOn=true; %set up flag
    while repeatOn
        if playAgain=="Y"
            repeatOn=false; % end while loop 
            gameOn=true; % continue game
        elseif playAgain=="N"
            repeatOn=false; % end while loop
            gameOn=false; % end game
        else 
            playAgain=input("Please enter either Y or N","s");
            repeatOn=true; % continue while loop 
        end
    end
end

%display outcome of the game
if usersScore>playersScore
    fprintf("YOU WON THE GAME!")

elseif usersScore<playersScore
    fprintf("You lost the game.")

else
    fprintf("You tied overall.")

end

fprintf("\nThank you for playing. See you soon!")
endingImage=imread('backOfCard.png');
displayImage=[endingImage endingImage endingImage ; endingImage endingImage endingImage;endingImage endingImage endingImage];
%display the ending image for the user 
figure() %create new figure 
imshow(displayImage)
title("Thank you!")