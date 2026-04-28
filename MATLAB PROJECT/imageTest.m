% red1=imread("red1.png");
% blue1=imread("blue1.png");
% yellow1=imread("yellow1.png");
% green1=imread("green1.png");
% plusfour=imread("plusFour.png");
% 
% nextCardPlayed=input("play a card","s");
% 
% figure('color','#222222')
% 
% subplot(5,7,8), imshow(nextCardPlayed)
% title('r1','color','w')
% subplot(5,7,9),imshow(yellow1)
% subplot(5,7,10),imshow(green1)
% subplot(5,7,11),imshow(blue1)
% 
% subplot(5,7,4),imshow(plusfour)
% 
% title('CURRENT CARD ON DECK:','color','w')

% 101=imread("red1.png");
% 102=imread("red2.png");103=imread("red3.png");104=imread("red4.png");105=imread("red5.png");
% 106=imread("red6.png");107=imread("red7.png");108=imread("red8.png");109=imread("red9.png");110=imread("redPlusTwo.png");
% 111=imread("redSkip.png");112=imread("redReverse.png");
% 
% 113=imread("yellow1.png");114=imread("yellow2.png");115=imread("yellow3.png");116=imread("yellow4.png");
% 117=imread("yellow5.png");118=imread("yellow6.png");119=imread("yellow7.png");120=imread("yellow8.png");
% 121=imread("yellow9.png");122=imread("yellowPlusTwo.png");
% 123=imread("yellowSkip.png");124=imread("yellowReverse.png");
% 
% 125=imread("blue1.png");126=imread("blue2.png");127=imread("blue3.png");128=imread("blue4.png");129=imread("blue5.png");
% 130=imread("blue6.png");131=imread("blue7.png");132=imread("blue8.png");133=imread("blue9.png");134=imread("bluePlusTwo.png");
% 135=imread("blueSkip.png");136=imread("blueReverse.png");
% 
% 137=imread("green1.png");138=imread("green2.png");139=imread("green3.png");140=imread("green4.png");141=imread("green5.png");
% 142=imread("green6.png");143=imread("green7.png");144=imread("green8.png");145=imread("green9.png");146=imread("greenPlusTwo.png");
% 147=imread("greenSkip.png");148=imread("greenReverse.png");
% 
% 149=imread("colourChange.png");
% 150=imread("plusFour.png");
% 
% cardDeck=["r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "rs" "rv" "rt" "y1" "y2" "y3" "y4" "y5" "y6" "y7" "y8" "y9" "ys" "yv" "yt" "b1" "b2" "b3" "b4" "b5" "b6" "b7" "b8" "b9" "bs" "bv" "bt" "g1" "g2" "g3" "g4" "g5" "g6" "g7" "g8" "g9" "gs" "gv" "gt" "W" "W" "W" "W" "C" "C" "C" "C"];
% correspondingNumber=[101:150];
% 
% d=dictionary(cardDeck,correspondingNumber);
% d("r1")