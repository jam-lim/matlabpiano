function [h,dur,sus]= chord(str,t,ss)


s=upper(str);
ar = 0;
%check if the string contains any suspension pedal or arpeggio 
if(contains(s,"\"))
    ar=1;
    s=extractBetween(s,1,strlength(s)-1);
end
sus =ss;
if(contains(s,"$"))
    sus=1;
    s=extractBetween(s,2,strlength(s));
elseif(contains(s,"*"))
    sus =0;
    s=extractBetween(s,2,strlength(s));
end
%splits the chords to note, note is separated by :
hh=split(s,":");

h=0;
maxduration=0;
if(~ar)
 %if the chord is not arppegiated, it forms a chord by adding each note
 %and returns the duration with the longest note
for i = 1:length(hh)
    [a,d]=note(hh(i),t,sus);
    
    if(maxduration<d)
        maxduration=d;
    end
    h=a+h;
end
else
    %if the chord is arppegiated, the duration is the lowest note's
    %duration and gradually builds the chord
    for i = 1:length(hh)
    [a,d]=note(hh(i),t,sus);
    if(i==1)
        maxduration=d;
        arpspeed=floor(1/6*maxduration*t/3*length(a));
        h=a;
    else
          h(arpspeed*(i-1):length(h))=h(arpspeed*(i-1):length(h))+...
          a(1:length( h(arpspeed*(i-1):length(h))));
            
    end
    end
end
%returns the duration of the note in terms of which element in the vector
%is the end of the note
dur=length(h)-floor(maxduration*t/3*length(h));
end
