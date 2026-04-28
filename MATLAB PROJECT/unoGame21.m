%INTRODUCE GAME TO USER
%print instructions 
fprintf("Welcome to UNO - matlab version.")
input("\nContinue pressing ""Enter"" to continue to the next sections:")
fprintf("\nThe rules of this game are like usual. You can only play a card that is the same colour (r, g, b, or y) or same number, \nor both the same colour and number, as the card on the deck.")
input("") %waits for user to press Enter
fprintf("\nUnlike rules to general UNO, you cannot stack +2 or +4 cards with the player. If you or the player places a +2 or +4 card, \n the other will automatically pick up the required amount of cards.")
input("")
fprintf("\nnote: card plays are CASE SENSITIVE. Follow the same formatting as shown on screen.\nFor example, if you want to play a red 8 card, input ""r8"" \nThe first player to get rid of all their cards WINS. \nGOOD LUCK!")
input("") 

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

gameOn=true; % set up flag for the UNO game. The game will be governed under a while loop so that the user can play as many rounds as they would like
usersScore=0;
playersScore=0;
%initiate the user's score and the player's score (the player is the
%automated player programmed into the game).

while gameOn
    fprintf("Start round: ")

    cardNumber=randperm(length(cardDeck)); 
    %shuffles card deck for accessing elements with in built function
    %randperm

    %initiation of users cards and player's cards
        usersCards=[]; 
        %defines vector for user
        playersCards=[]; 
        %defines vector for automated player 
    
        % define the starting card on deck
        %take a randomly generated card from the non-wild card deck (as UNO
        %games start on a non-wild card, and assign to variable cardPlayed.
        cardPlayed=cardDeckNonWild(randperm(length(cardDeckNonWild),1)); 
        %delete the card

        %loop through the entire card deck to find the matching string for
        %the card played (cardPlayed)
        for i=1:length(cardDeck)
            if strcmp(cardPlayed,cardDeck(i))
                %once the card played is found in the card deck, use
                %its index number (i) from the card deck to store in a variable 
                % (being the index of i in cardNumber), to find its
                %corresponding card number
                indexToUse=find(cardNumber==i);
            end
        end
        cardNumber(indexToUse)=[]; %delete the card number that was related to the card played.
    
        %build up user's cards and automated player's snaps
    for i=1:7
        usersCards=[usersCards cardDeck(cardNumber(i))]; 
        % creates user starting deck by concatenating 7 randomly generated
        % cards
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
        usersTurn=true;
        
        while usersTurn
            fprintf("\n %s",cardPlayed)
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
                % pause(1)
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

                    playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                    cardNumber(1)=[]; 
                    cardNumber(1)=[];
                    cardPlayed=nextCardPlayed;
                    if length(usersCards)==0 %check if the user has used their last card
                        usersTurn=false; %break out of the while loop
                    end


            elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"s"))>0
                fprintf("You played a skip card. The player's turn is skipped. It is now your turn again: ")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                pause(1)
                cardPlayed=nextCardPlayed;
                    if length(usersCards)==0
                        usersTurn=false;
                    end
    
            elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"v"))>0
                fprintf("You played a reverse card. The turn is reversed back to you. It is now your turn again: ")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                pause(1)
                cardPlayed=nextCardPlayed;
                    if length(usersCards)==0
                        usersTurn=false;
                    end
    
            elseif nextCardPlayed=="C" %check is player has played a colour change card
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                fprintf("You played a colour change card.")
                colour=input("What colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ","s");
                %ask user what colour they would like to change to

                %make sure the user entered a valid value for the colour
                %change
                colourInputWasCorrect=false; %set up flag for while loop 
                while ~colourInputWasCorrect  
                if ~(colour=="r" || colour=="b" || colour=="g" || colour=="y") %check is user has entered either one of these values
                    colour=input("Please try again. Enter either r, g, b, or y: ","s"); %display error message if not
                    colourInputWasCorrect=false;
                else
                    cardPlayed=colour;
                    colourInputWasCorrect=true;
                end
                    end 

                usersTurn=false;

                %%%%%%%%%%%%%%%%%LETS ADD THIS INTO A FUNCTION
    
            elseif nextCardPlayed=="W"
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                colour=input("You played a +4 wild card! The opponent will automatically pick up 4 cards. \nWhat colour would you like to change to? Select either r (red), b (blue), g (green), or y (for yellow): ", "s");
                                
                colourInputWasCorrect=false;
                while ~colourInputWasCorrect  
                    if ~(colour=="r" || colour=="b" || colour=="g" || colour=="y")
                        colour=input("Please try again. Enter either r, g, b, or y: ","s");
                        colourInputWasCorrect=false;
                    else
                        cardPlayed=colour;
                        colourInputWasCorrect=true;
                    end
                end 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%ADD CASE FOR IF THERE ARE NOT ENOUGH CARD
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%NUMBERS TO PUT  
    
                if length(cardDeck)>=4
                playersCards=[playersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))  cardDeck(cardNumber(3)) cardDeck(cardNumber(4))];
                %automatically add 
                cardNumber(1)=[]; 
                cardNumber(1)=[]; 
                cardNumber(1)=[];
                cardNumber(1)=[];
                    if length(usersCards)==0
                        usersTurn=false;
                    end
                else 
                    usersTurn=false;
                    playersTurn=false;
                end
            else
                usersTurn=true;
                %any other input by the user will repeat the loop to enable
                %them to try entering a valid input 
            end 
        end
       
    % player goes second
            playersCardsLength=length(playersCards);
            playersCardsLength2=playersCardsLength; 
    
    if length(usersCards)>0 
        playersTurn=true;
        indexValue=1;
    
            while playersTurn && indexValue<=playersCardsLength
                nextCardPlayed=char(playersCards(indexValue));
    
                if (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
                    fprintf("the Player has played a ")
                    disp(nextCardPlayed)
                    %delete card that was just played from the playersCards
                    %array
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1;
                    cardPlayed=nextCardPlayed;
                    playersTurn=false;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"t"))>0
                    fprintf ("The player has played a +2 card. \nYou will automatically pick up two cards and the player will go again:")
                    usersCards=[usersCards cardDeck(cardNumber(1)) cardDeck(cardNumber(2))];
                    cardNumber(1)=[]; 
                    cardNumber(1)=[]; 
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1;
                    playersCardsLength2=playersCardsLength; %so the player still has a chance to pick up
                    cardPlayed=nextCardPlayed;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"s"))>0
                    fprintf("The player has played a skip card. \nYour turn is skipped and the player will go again: ")
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1;
                    playersCardsLength2=playersCardsLength; %so the player still has a chance to pick up
                    cardPlayed=nextCardPlayed;
    
                elseif (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"v"))>0
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
                    playersTurn=false;
    
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

            if playersCardsLength==playersCardsLength2
                if length(cardNumber)==0 || length(playersCards)==0 %%%%% COULD USE IF LENGTH(PLAYERSCARDS)==0 THEN NO PICK UP AND DO SAME FOR USER 
                    break
                end
                
                fprintf("\nThe player has picked up a card. Your turn: ")
                playersCards=[playersCards cardDeck(cardNumber(1))];
                cardNumber(1)=[];
                pause(1)
    
            end
    end
    end
    
    %END OF GAME
    
    
    if length(usersCards)==0
        fprintf("You have removed all cards in your hand. \nYOU WON!")
        fprintf("\n\nYou have scored 1 point. The current scores are: ")
        usersScore=usersScore+1;
        fprintf("\n\n%s's Score: %.0f",userName,usersScore)
        fprintf("\nPlayer Score: %.0f",playersScore)
        playAgain=input("\n\nWould you like to play another round? (Enter Y/N): ","s");
    
        repeatOn=true;
        while repeatOn
            if playAgain=="Y"
                repeatOn=false;
                gameOn=true;
            elseif playAgain=="N"
                repeatOn=false;
                gameOn=false;
            else 
                playAgain=input("Please enter either Y or N","s");
                repeatOn=true;
            end
        end
        
    elseif length(playersCards)==0
        fprintf("The player has removed all cards in their hand. \nYOU LOST :(")
        fprintf("\n\nThe player has scored 1 point. The current scores are: ")
        playersScore=playersScore+1;
        fprintf("\n\n%s's Score: %.0f",userName,usersScore)
        fprintf("\nPlayer Score: %.0f",playersScore) 
        playAgain=input("\n\nWould you like to play another round? (Enter Y/N): ","s");

        repeatOn=true;
        while repeatOn
            if playAgain=="Y"
                repeatOn=false;
                gameOn=true;
            elseif playAgain=="N"
                repeatOn=false;
                gameOn=false;
            else 
                playAgain=input("Please enter either Y or N","s");
                repeatOn=true;
            end
        end

    else
        fprintf("You tied. All cards on the deck have been used. No points will be received for this round.")
        fprintf("The current scores are: ")
        fprintf("\n\n%s's Score: %.0f",userName,usersScore)
        fprintf("\nPlayer Score: %.0f",playersScore) 
        playAgain=input("\n\nWould you like to play another round? (Enter Y/N): ","s");

        repeatOn=true;
        while repeatOn
            if playAgain=="Y"
                repeatOn=false;
                gameOn=true;
            elseif playAgain=="N"
                repeatOn=false;
                gameOn=false;
            else 
                playAgain=input("Please enter either Y or N: ","s");
                repeatOn=true;
            end
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
imshow(displayImage)
title("Thank you!")