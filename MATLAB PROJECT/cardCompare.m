function value=cardCompare(cardPlayed,nextCardPlayed)
nextCardPlayed=char(nextCardPlayed);%converts nextCardPlayed to character array 
if length(nextCardPlayed)>0
    for i=1:length(nextCardPlayed)
    %loop through character array of nextCardPlayed
        if length(strfind(cardPlayed,nextCardPlayed(i)))>0 %given from MATLAB in-built functions list
            value=1;
            break %breaks out of the loop so that the value cannot be changed to 0, if the second element of nextCardPlayed is not found in cardPlayed
        else
            value=0;
        end 

    end
else
    value=0;
end
end