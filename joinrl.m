function [joinrl,start] = joinrl(rh,lh,t)
    
    [br,rs] = joinbar(rh,t);
    [bl,ls] = joinbar(lh,t);
    if(length(br)>length(bl))
        br(1:length(bl)) = br(1:length(bl)) + bl;
        joinrl = br;
        start = rs;
    else
        bl(1:length(br)) = bl(1:length(br)) + br;
        joinrl = bl;
        start = ls;
    end
end