%Generation of sinusoidal signal
%Fs = 8000;
%time = 3;
%t = 0:(1/Fs):time;
%N = length(t);
%f0 = 500;
%x = 0.1 * cos(2*pi*f0*t);
%plot(t(1:100),x(1:100))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generation of random signal
%Fs = 8000;
%time = 3;
%N = time * Fs;
%x = rand(1,N) * 2 - 1;
%t = linspace(0,time,N);
%plot(t(1:100),x(1:100))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Record voice from Microphone
%Prefered to use Fs = 8000,11025,22050,44100
Fs = 44100;
time = 5;
recObj = audiorecorder(Fs,16,1);
%Fs ==> Sampling Frequency
%16 ==> Bits per sample
% 1 ==> Mono => one array
%recordblocking(recObj,time); %stop progress & record
%get the data from recObj and store it in x
%x = getaudiodata(recObj);
%play the sound you recorded
%play(recObj);
%get the length of x and store it in N
%N = length(x);
%t = linspace(0,time,N);
%To draw the function of record
%plot(t,x)
%Save the file
%audiowrite("whistle.wav",x,Fs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get the file and read the record opposite of audiowrite
[x,Fs] = audioread('whistle.wav');
% To play it
sound(x,Fs,16);

% Now I want to know what is the length and time and t to draw signal or perform any process on it
%N = length(x);
% N is the length and Fs is the frquency in one sec so
%time = N / Fs;
%t = linspace(0,time,N);
%plot(t,x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FFt
%X_k = abs(fft(x));
%f = linspace(0,Fs,N);
%figure(1);plot(f,X_k),grid;
%title('Amplitude Spectrum of x(t)');
%xlabel('Frequency (Hz)');
%ylabel('|x(f)|');





