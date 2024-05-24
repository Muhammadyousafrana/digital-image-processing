
clear;
close all;
A=imread('rice.png');
figure,imshow(A);title('Original Image'); 
G=0.40;%Gamma =0.40
S=C*(r.^G);
Temp=255/(C*(255.^G));
%display image range [0 255]
S1=uint8(Temp*S);
figure,imshow(S1);title('Gamma corrected Image -> S = cr^\gamma  \gamma = 0.40 c = 1');
%Power Law(Gamma) Transformation
GRng=[0.04; 0.10; 0.20; 0.40; 0.67; 1; 1.5; 2.5; 5.0; 10.0; 25.0];
R=0:255;
figure,
for i = 1 : 11
X=C*(R.^GRng(i));
Temp=256/X(256);
s=Temp*X;
plot(R,s);
title('Plot Equation S = Cr^\gamma');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');
text(R(175),s(175),['\gamma = ',num2str(GRng(i))],'HorizontalAlignment','left');
hold all
axis([0 255 0 255]);
end
