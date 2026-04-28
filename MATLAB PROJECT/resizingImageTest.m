%read in images, resize and concatenate 

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


r1=imresize(r1,[1,1]);r2=imresize(r2,[250,160]);r3=imresize(r3,[250,160]);
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

imshow(r1)


