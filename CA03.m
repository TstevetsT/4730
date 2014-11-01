Computer Assignment 3

clear all

%% Problem 1

Seg = [106, 107, 109, 111, 112, 138, 166, 164;...
107, 109, 110, 115, 111, 131, 167, 180;...
107, 109, 108, 111, 112, 128, 160, 180;...
110, 107, 109, 114, 114, 126, 159, 158;...
110, 109, 112, 114, 110, 126, 145, 160;...
109, 111, 109, 112, 108, 125, 123, 120;...
112, 107, 105, 107, 107, 127, 145, 140;...
110, 110, 109, 107, 110, 122, 163, 164];

Seg2 =[160 159 166 170 178 191 198 193;...
162 160 165 171 180 194 198 196;...
165 154 165 174 182 194 201 203;...
185 176 166 177 185 193 203 205;...
174 168 163 177 184 192 201 203;...
148 167 164 176 185 192 196 195;...
159 153 157 176 187 190 194 195;...
141 106 132 173 184 194 198 194];

Q = [ 72 92 95 98 112 100 103 99;
49 64 78 87 103 121 120 101;
24 35 55 64 81 104 113 92;
18 22 37 56 68 109 103 77;
14 17 22 29 51 87 80 62;
14 13 16 24 40 57 69 56;
12 12 14 19 26 58 60 55;
16 11 10 16 24 40 51 61];

%% Problem 2

TDResult = dct2(Seg);


    
    for i = 1:1:8
        OD2(i,:) = dct(Seg(i,:));
    end
    for i = 1:1:8
        OD2(:,i) = dct(OD2(:,i));
    end
    
 ODResult = OD2;
 

TDResult
ODResult

%% Problem 3

 InverseTD = idct2(TDResult)
 InverseOD = idct2(ODResult)
 
%% Problem 4

Noise = rand(8)*80; % Create and add noise
SegWn = Noise + Seg

test = dct2(SegWn); % DCT of original mtx plus noise

scale = ones(8);    %Create Scaling Mtx
inc = zeros(8);
inc(5:8,5:8) = -0.5;
scale = scale + inc;


SegWnSc = test.*scale; %DCT of Original Mtx plus noise TIMES the scaling matrix

%% Recovery

Recov = idct2(SegWnSc) %Inverse DCT giving Orignial Mtx plus Noise

Diff = SegWn - Recov;       %Subtracting out oringal Mtx pluse noise from recovered mtx

%% PSNR

PSNR1 = 10*log((max(max(Seg))^2)./((sum(sum(Noise/numel(Seg))))^2)) %PSNR of originial with Noise

%PSNR2 = 10*log(max(max(test))^2./(Recov-test).^2); %PSNR of transformed over recovered minus transformed

PSNR3 = 10*log(max(max(SegWn))^2./sum(sum((Recov-SegWn)./numel(SegWn))).^2) %PSNR of Recovered compared to origial with noise

%% Experimental


Noise = rand(8).*20; % Create and add noise
SegWn2 = Noise + Seg

test = dct2(SegWn2); % DCT of original mtx plus noise

scale = ones(8);    %Create Scaling Mtx
inc = zeros(8);
inc(3:8,3:8) = -1;
scale = scale + inc;


SegWnSc = test.*scale; %DCT of Original Mtx plus noise TIMES the scaling matrix

Recov2 = idct2(SegWnSc) %Inverse DCT giving Orignial Mtx plus Noise

Diff = Seg - Recov2; %Subtracting out oringal Mtx pluse noise from recovered mtx
dist = Diff./numel(Diff)

PSNR4 = 10*log(max(max(Seg))^2./sum(sum(dist))^2) %PSNR of Recovered compared to origial with noise

