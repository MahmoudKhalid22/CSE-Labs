clc;clear;close all;
% To read the file
[x,Fs] = audioread('whistle.wav');
%% No of Samples
N = length(x);
fprintf('No of samples: %i\n', N);
%% time in sec
time = N / Fs;
fprintf('time in sec: %.3f\n', time);
%% Energy of the signal before wistle rejection
energy1 = sum(x.^2);
fprintf('Total Energy : %.2f\n',energy1)
%% time domain representation
t = linspace(0 , time ,N);

% Play the audio
sound(x,Fs);
pause(time);

figure(1);plot(t,x);
xlabel('Time (sec)');
ylabel('Amplitude');
title('Time domain representation of x(t)');

%% Get the fft and plot abs spectrum:
X_k = abs(fft(x)); %calc abs of fast fourier transform
f = linspace(0,Fs,N); %discretize freq
figure(2);plot(f,X_k);
title('Amplitude spectrum of x(t)');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');


%% Bandstop filter design FIR
% Design a Butterworth bandstop filter
n = 4; % Filter order
fstop = [475 525]; % Stopband frequency range
[b, a] = butter(n, fstop/(Fs/2), 'stop');

% Check if the filter is stable
if all(abs(roots(a)) < 1)
    disp('Filter is stable');
else
    disp('Filter is unstable');
end

% Apply the filter to the audio signal
y = filter(b, a, x);

% Play the filtered audio signal
sound(y, Fs);
pause(time);
%% Energy of the signal after y bandstop
energy2 = sum(y.^2);
fprintf('Total Energy of filtered signal : %.2f\n',energy2);

%% Impulse Response
figure(4);
impz(b , a),grid;
title('Impulse resonse');
xlabel("n samples");
ylabel("Amplitude");

%% Freq response
f=(0:0.001:1)*Fs/2;
H= freqz(b,a,f,Fs);
figure(5);plot(f,abs(H)),grid;
title('frequency response');
xlabel('Physical frequency f(HZ)');
ylabel('frequency response');


%% plot y in  time domain
figure(6);plot(t,y),grid;
xlabel('Time (sec)');
ylabel('Amplitude');
title('Time domain representation of y(t)');

%% Plot y in freq domain
Y_k = abs( fft(y) ); %calc abs of fast fourier transform
f = linspace(0 , Fs, N); %discretize freq
figure(7);
plot(f ,Y_k);grid;
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amp spectrum of y(t) filtered signal')

%% Bandstop filter design
n=4;
[b , a] = butter(n ,[1475 1525] / (Fs/2), 'stop');
if all(abs(roots(a)) < 1)
    n=n-1;
   [b , a] = butter(n ,[1475 1525] / (Fs/2), 'stop');
   disp('Filter is stable');
else
    disp('Filter is unstable');
end
S =filter (b , a , y);
sound(S, Fs, 16);


%% Energy of the signal after wistle rejection
energy3 = sum(S.^2);
fprintf('Total Energy : %.2f\n',energy3)

%% plot S in  time domain
figure(8);
plot(t,S);
xlabel('Time (sec)');
ylabel('Amplitude');
title('Time domain representation of S(t)');

%% Plot S in freq domain
S_k = abs( fft(S) ); %calc abs of fast fourier transform
f = linspace(0 , Fs, N); %discretize freq
figure(9);
plot(f ,S_k);
grid on ;
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amp spectrum of S(t)');
