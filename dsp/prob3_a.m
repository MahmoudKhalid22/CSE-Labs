%problem (3)
% A)finite low pass filter
a =1;
b =0.125*[1,1,1,1,1,1,1,1];
Fs=8000;

%impulse responce
figure;impz(b,a,10),grid;
title('impulse responce');
xlabel('n(Samples)');
ylabel('impulse responce');

%freqancy responce
f=(0:.001:1)*Fs/2;
H= freqz(b,a,f,Fs);
figure;plot(f,abs(H)),grid;
title('freqancy responce');
xlabel('f(HZ)');
ylabel('freqancy responce');
