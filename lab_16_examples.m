% % Create a black 30x30 image
% f=zeros(30,30); 
%  
% % With a white rectangle in it. 
% f(5:24,13:17)=1; 
%  
% imshow(f,'InitialMagnification', 'fit');


% %Calculate the DFT.  
% F=fft2(f); 
%  
% %There are real and imaginary parts to F. %Use the abs function to compute the magnitude  
% %of the combined components. 
% F2=abs(F); 
%  
% figure, imshow(F2,[], 'InitialMagnification','fit') 



% %To create a finer sampling of the Fourier transform,  
% %you can add zero padding to f when computing its DFT  
% %Also note that we use a power of 2, 2^256  
% %This isbecause the FFT -Fast Fourier Transform -  
% %is fastest when the image size has many factors. 
% F=fft2(f, 256, 256); 
%  
% F2=abs(F); 
% figure, imshow(F2, [])



% %The zero-frequency coefficient is displayed in the  
% %upper left hand  corner. To display it in the center, 
% %you can use the function fftshift. 
% F2=fftshift(F); 
%  
% F2=abs(F2);        figure,imshow(F2,[]) 


% % %In Fourier transforms, high peaks are so high they  
% % %hide details. Reduce contrast with the log function. 
% % F2=log(1+F2); 
% %  
% % figure,imshow(F2,[])      
% 
% 
% f=zeros(30,30); f(5:24,13:17)=1; F=fft2(f, 256,256); F2=fftshift(F);        
% figure,imshow(log(1+abs(F2)),[])  



% %Create the SpacialFiltered Image 
% f = imread('E:\entry2.png'); 
% h = fspecial('sobel'); 
% sfi = imfilter(double(f),h, 0, 'conv');  
% %Display results (show all values) \
% figure,imshow(sfi, []);


% %The abs function gets correct magnitude 
% %when used on complex numbers 
% sfim = abs(sfi); 
% figure, imshow(sfim, []); 



% %Create the SpacialFiltered Image 
% f = imread('E:\entry2.png'); 
% h = fspecial('sobel'); 
% sfi = imfilter(double(f),h, 0, 'conv');  
% figure,imshow(sfi, []);
% %The abs function gets correct magnitude 
% %when used on complex numbers 
% sfim = abs(sfi); 
% figure, imshow(sfim, []); 


% %Create the Frequency Filtered Image
% f = imread('E:\entry2.png'); 
% h = fspecial('sobel'); 
% PQ = paddedsize(size(f)); 
% F = fft2(double(f), PQ(1), PQ(2)); 
% H = fft2(double(h), PQ(1), PQ(2)); 
% F_fH = H.*F; 
% ffi = ifft2(F_fH); 
% ffi = ffi(2:size(f,1)+1,2:size(f,2)+1); 
% %Display results (show all values) 



% %ex1.m 
% clear all
% close all
% I=imread('cameraman.tif'); 
% I=im2double(I); 
% FI=fft2(I);   
%  %(DFT) get the frequency  for the image 
% FI_S=abs(fftshift(FI));
% %Shift zero-frequency component to center of img_spectrum.
% I1=ifft2(FI); 
% I2=real(I1); 
% subplot(131),imshow(I),title('Original'), 
% subplot(132),imagesc(0.5*log(1+FI_S)),title('Fourier Spectrum'),axis off 
% subplot(133),imshow(I2),title('Reconstructed') 
% %imagesc: the data is scaled to use the full colormap. 



%ex2.m 
close all 
clear 
%============================= 
% 2) Low-Pass Gaussian Filter: 
%============================= 
I=imread('cameraman.tif'); 
I=im2double(I); 
FI=fft2(I);     
%1.Obtain the Fourier transform 
LP=fspecial('gaussian',[11 11],1.3);%2.Generate a Low-Pass filter  
FLP=fft2(LP,size(I,1),size(I,2)); %3. Filter padding 
LP_OUT=FLP.*FI;  %4.Multiply the transform by the filter 
I_OUT_LP=ifft2(LP_OUT); %5.inverse DFT 
I_OUT_LP=real(I_OUT_LP); %6.Obtain the real part(Output)  
%%%%spectrum%%%% 
FLP_S=abs(fftshift(FLP));
%Filter spectrum 
LP_OUT_S=abs(fftshift(LP_OUT));
%output spectrum  
subplot(221),imshow(I),title('Original'), 
subplot(222),imagesc(0.1*log(1+FLP_S)),title('LowPass Filter Spectrum'),axis off 
subplot(223),imshow(I_OUT_LP),title('LowPass Filtered Output') 

subplot(224),imagesc(0.1*log(1+LP_OUT_S)),title('LowPass Spectrum'),axis off 
figure, imshow(ffi,[]) 
%The abs function gets correct magnitude 
%when used on complex numbers 
ffim = abs(ffi);
 figure, imshow(ffim, []); 
