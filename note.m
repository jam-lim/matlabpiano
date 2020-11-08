function [n,dur]= note(str,t,sus)
%splits the string to pitch,duration,amplitude part
aaa=split(str,",");
pitch=upper(aaa(1));

dur = str2double(aaa(2));
amp=str2double(aaa(3));
fs=30000;
%sets the note 3 seconds long
t1 = [0:1/fs:4-1/fs];
if(amp~=0)

%calculate the frequnecy based on the desired pitch
p=extractBetween(pitch,1,2);
pp=0;
if(p=="A0")
    pp=9;
elseif(p=="A#")
    pp=10;
elseif(p=="B0")
    pp=11;
elseif(p=="C0")
    pp=0;
elseif(p=="C#")
    pp=1;
elseif(p=="D0")
    pp=2;
elseif(p=="D#")
    pp=3;    
elseif(p=="E0")
    pp=4;
elseif(p=="F0")
    pp=5;
elseif(p=="F#")
    pp=6;
elseif(p=="G0")
    pp=7;
elseif (p=="G#")
    pp=8;
end
ppp= extractBetween(pitch,3,strlength(pitch));

pitchval=pp+(str2double(ppp)-4)*12;
frequency=220*2^((3+pitchval)/12);
n = amp*piano(frequency,t1);

% puts the reverb on the note if sus pedal is not pressed.

if(sus==0)
reverb=floor(dur*t/3*length(n));
 t=[1:length(n)-reverb];
  t=exp(-t/(0.0375*length(n)));
 n(reverb+1:length(n))=n(reverb+1:length(n)).*t;
end
else
    n=0.*t1;

end
end
 