Computer Assignment 2

clear all

%% Problem 1

Seg = [52, 55, 61, 66, 70, 61, 64, 73;...
    63, 59, 55, 90, 109, 85, 69, 72;...
    62, 59, 68, 113, 144, 104, 66, 73;...
    63, 58, 71, 122, 154, 106, 70, 69;...
    67, 61, 68, 104, 126, 88, 68, 70;...
    79, 65, 60, 70, 77, 68, 58, 75;...
    85, 71, 64, 59, 55, 61, 65, 83;...
    87, 79, 69, 68, 65, 76, 78, 94];

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
    
PSNR1 = 10*log((max(max(Seg))^2)./(sum(Noise^2)/numel(Seg)) %PSNR of originial with Noise   THIS ONE IS FIXED NEED TO FIX ALL OTHERS

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

