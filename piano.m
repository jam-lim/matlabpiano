function piano= piano(pitch,t1)
w=2*pi*pitch;

%harmonics to make a richer sound and closer to piano sound
piano =0.6*sin(1*w*t1).*exp(-0.0007*w*t1)+0.2*sin(2*w*t1).*exp(-0.0007*w*t1)+...
        0.02*sin(3*w*t1).*exp(-0.0007*w*t1)+0.05*sin(1/2*w*t1).*exp(-0.0007*w*t1);

% piano = piano + 0.3*sin(2*w*t1).*exp(-0.003*w*t1)+0.4*sin(2*w*t1).*exp(-0.003*w*t1)/(2^32);
% piano = piano + 0.2*sin(3*w*t1).*exp(-0.003*w*t1)+0.4*sin(2*w*t1).*exp(-0.003*w*t1)/(2^64);
% piano = piano + 0.1*sin(4*w*t1).*exp(-0.003*w*t1)+0.4*sin(2*w*t1).*exp(-0.003*w*t1)/(2^64);
%cubing them which makes it sound more like a piano 
piano = piano+ piano.*piano.*piano;
piano= piano.*(1+16*t1.*exp(-6*t1));

% time =t1;
% frequency = pitch;
% Y = sin(2 * pi * frequency * time) .* exp(-0.0004 * 2 * pi * frequency * time);
% Y = Y + sin(2 * 2 * pi * frequency * time) .* exp(-0.0004 * 2 * pi * frequency * time) / (2^50);
% Y = Y + sin(3 * 2 * pi * frequency * time) .* exp(-0.0004 * 2 * pi * frequency * time) / (2^50);
% Y = Y + sin(4 * 2 * pi * frequency * time) .* exp(-0.0004 * 2 * pi * frequency * time) / (2^50);
% Y = Y + sin(5 * 2 * pi * frequency * time) .* exp(-0.0004 * 2 * pi * frequency * time) / (2^50);
% Y = Y + sin(6 * 2 * pi * frequency * time) .* exp(-0.0004 * 2 * pi * frequency * time) / (2^50);
% Y = Y + Y .* Y .* Y;
% Y = Y.*(1 + 16 * time .* exp(-6 * time));
% 
% piano =Y;
% piano = sin(w*t1).*sin(w*t1).*sin(w*t1)+sin(pi *(t1+2/3));
% piano = piano .* exp(-0.0015*w*t1);

end