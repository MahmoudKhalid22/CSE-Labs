%problem (1)
% Infinite impluse filter (IIR)  => order =4
%===========================================
Fs = 10000;
%n = 4;
% filter order ==============> ( isstable(b,a) = 1 )
    %--------- Stable -------------
%[b ,a] = butter(n ,[200 2000]/ (Fs/2) ,'bandpass');

%figure; impz( b ,a ,20 );grid;
%f = (0 : 0.001 :1)* Fs/2;
%H = freqz (b,a,f,Fs);
%figure;plot(f , abs(H) );
%xlabel('Frequency (Hz)')
%ylabel('Amplitude')
%title('Frequency Respone')
%grid

    %infinite impluse filter (IIR) => order =21
%===========================================
n = 21 ; % filter order ==============> ( isstable(b,a) = 0 )

[d ,c] = butter(n ,[200 2000]/ (Fs/2) ,'bandpass');
    %--------- Unstable -------------
figure;
impz( d ,c ,20 );grid on;
f = (0 : 0.001 :1)* Fs/2;
H = freqz (d,c,f,Fs);
figure;
plot(f , abs(H) );
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Respone');
grid
