function [j,start]= joinbar(ar,t)
start=0;
sus =0;
for i=1:length(ar)
    if(i==1)
        [a,b,s]=chord(ar(1),t,sus);
        sus =s;
        j=a;
        start=b;
    else
        [a,b,s]=chord(ar(i),t,sus);
        sus =s;
        j = njoin(j,a,start);
        start = b;
    end
end
end