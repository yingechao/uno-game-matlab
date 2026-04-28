%INTRODUCE GAME TO USER
fprintf("Welcome to UNO - matlab version.")
input("\nContinue pressing ""Enter"" to continue to the next sections:")
fprintf("\nThe rules of this game are like usual. You can only play a card that is the same colour (r, g, b, or y) or same number, \nor both the same colour and number, as the card on the deck.")
input("")
fprintf("\nYou may not end on a wild +4 card, reverse, or skip card. You may end on any other card, including colour changes.")
input("")
fprintf("\nUnlike rules to general UNO, you cannot stack +2 or +4 cards with the player. If you or the player places a +2 or +4 card, \n the other will automatically pick up the required amount of cards.")
input("")
fprintf("\nnote: card plays are CASE SENSITIVE. Follow the same formatting as shown on screen.\nFor example, if you want to play a red 8 card, input ""r8"" \nThe first player to get rid of all their cards WINS. \nGOOD LUCK!")
input("") 

nameNotEntered=true;
while nameNotEntered
    userName=input("What is your name? ","s");
    if isletter(userName)>0
        nameNotEntered=false; %break out of the while loop
    else 
        fprintf("Please try again. Enter only letters.\n")
    end
end

%define card arrays and create game setting
cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "W" "W" "W" "W" "C" "C" "C" "C"];
cardDeckNonWild=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9"];
%define deck of cards for shuffling and picking up cards

%assign variables to corresponding images
r1=imread("red1.png");r2=imread("red2.png");r3=imread("red3.png");r4=imread("red4.png");r5=imread("red5.png");
r6=imread("red6.png");r7=imread("red7.png");r8=imread("red8.png");r9=imread("red9.png");rt=imread("redPlusTwo.png");
rs=imread("redSkip.png");rv=imread("redReverse.png");

y1=imread("yellow1.png");y2=imread("yellow2.png");y3=imread("yellow3.png");y4=imread("yellow4.png");
y5=imread("yellow5.png");y6=imread("yellow6.png");y7=imread("yellow7.png");y8=imread("yellow8.png");
y9=imread("yellow9.png");yt=imread("yellowPlusTwo.png");
ys=imread("yellowSkip.png");yv=imread("yellowReverse.png");

b1=imread("blue1.png");b2=imread("blue2.png");b3=imread("blue3.png");b4=imread("blue4.png");b5=imread("blue5.png");
b6=imread("blue6.png");b7=imread("blue7.png");b8=imread("blue8.png");b9=imread("blue9.png");bt=imread("bluePlusTwo.png");
bs=imread("blueSkip.png");bv=imread("blueReverse.png");

g1=imread("green1.png");g2=imread("green2.png");g3=imread("green3.png");g4=imread("green4.png");g5=imread("green5.png");
g6=imread("green6.png");g7=imread("green7.png");g8=imread("green8.png");g9=imread("green9.png");gt=imread("greenPlusTwo.png");
gs=imread("greenSkip.png");gv=imread("greenReverse.png");

C=imread("colourChange.png");
W=imread("plusFour.png");

r1=imresize(r1,[250,160]);r2=imresize(r2,[250,160]);r3=imresize(r3,[250,160]);
r4=imresize(r4,[250,160]);r5=imresize(r5,[250,160]);r6=imresize(r6,[250,160]);
r7=imresize(r7,[250,160]);r8=imresize(r8,[250,160]);r9=imresize(r9,[250,160]);
rt=imresize(rt,[250,160]);rs=imresize(rs,[250,160]);rv=imresize(rv,[250,160]);

y1=imresize(r1,[250,160]);y2=imresize(y2,[250,160]);y3=imresize(y3,[250,160]);
y4=imresize(r4,[250,160]);y5=imresize(y5,[250,160]);y6=imresize(y6,[250,160]);
y7=imresize(r7,[250,160]);y8=imresize(y8,[250,160]);y9=imresize(y9,[250,160]);
yt=imresize(rt,[250,160]);ys=imresize(ys,[250,160]);yv=imresize(yv,[250,160]);

b1=imresize(b1,[250,160]);b2=imresize(b2,[250,160]);b3=imresize(b3,[250,160]);
b4=imresize(b4,[250,160]);b5=imresize(b5,[250,160]);b6=imresize(b6,[250,160]);
b7=imresize(b7,[250,160]);b8=imresize(b8,[250,160]);b9=imresize(b9,[250,160]);
bt=imresize(bt,[250,160]);bs=imresize(bs,[250,160]);bv=imresize(bv,[250,160]);

g1=imresize(g1,[250,160]);g2=imresize(g2,[250,160]);g3=imresize(g3,[250,160]);
g4=imresize(g4,[250,160]);g5=imresize(g5,[250,160]);g6=imresize(g6,[250,160]);
g7=imresize(g7,[250,160]);g8=imresize(g8,[250,160]);g9=imresize(g9,[250,160]);
gt=imresize(gt,[250,160]);gs=imresize(gs,[250,160]);gv=imresize(gv,[250,160]);

C=imresize(C,[250,160]);W=imresize(W,[250,160]);

figure('color','#222222')

keySet=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "C" "W"];
valueSet=[r1 r2 r3 r4 r5 r6 r7 r8 r9 rs rv rt y1 y2 y3 y4 y5 y6 y7 y8 y9 ys yv yt b1 b2 b3 b4 b5 b6 b7 b8 b9 bs bv bt g1 g2 g3 g4 g5 g6 g7 g8 g9 gs gv gt C W];
% d=dictionary(keySet,valueSet);
% what=d("r1")
% aaa=valueSet(1);
disp(valueSet)

gameOn=true;
usersScore=0;
playersScore=0;

while gameOn
    fprintf("Start round: ")

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
    
        %build up user's cards and automated player's snaps
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
                    cardNumber(1)=[];
                    cardPlayed=nextCardPlayed;
                    if length(usersCards)==0
                        continueLoop=false;
                    end
            elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"s"))>0
                fprintf("You played a skip card. The player's turn is skipped. It is now your turn again: ")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                pause(1)
                cardPlayed=nextCardPlayed;
                    if length(usersCards)==0
                        continueLoop=false;
                    end
    
            elseif (cardCompare(cardPlayed,nextCardPlayed)>0 && ismember(nextCardPlayed,usersCards)>0) && length(nextCardPlayed)==2 && length(strfind(nextCardPlayed,"v"))>0
                fprintf("You played a reverse card. The turn is reversed back to you. It is now your turn again: ")
                index=find(usersCards==nextCardPlayed);
                usersCards(index(1))=[];
                pause(1)
                cardPlayed=nextCardPlayed;
                    if length(usersCards)==0
                        continueLoop=false;
                    end
    
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
                    if length(usersCards)==0
                        continueLoop=false;
                    end
                
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
                % firstElement=nextCardPlayed(1); 
                % secondElement=0;
                % if length(nextCardPlayed)>1
                %     secondElement=nextCardPlayed(2);
                % end
    
                if (cardCompare(cardPlayed,nextCardPlayed))>0 && length(strfind(nextCardPlayed,"t"))==0 && length(strfind(nextCardPlayed,"s"))==0 && length(strfind(nextCardPlayed,"v"))==0
                    fprintf("the Player has played a ")
                    disp(nextCardPlayed)
                    %delete card that was just played from the playersCards
                    %array
                    index=find(playersCards==nextCardPlayed);
                    playersCards(index(1))=[];
                    playersCardsLength=playersCardsLength-1;
                    cardPlayed=nextCardPlayed;
                    continueLooping=false;
    
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
        fprintf("\n\n%s's: %.0f",userName,usersScore)
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
        fprintf("\n\n%s's: %.0f",userName,usersScore)
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
        fprintf("\n\n%s's: %.0f",userName,usersScore)
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