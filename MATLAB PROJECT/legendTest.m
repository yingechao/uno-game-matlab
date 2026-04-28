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