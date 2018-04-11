DIR = 'data/dataScanned/';
%input image
imageName = '17.jpg'
Orimage = imread([DIR,'',imageName]);

%convert to grayscale
image = rgb2gray(Orimage);

nickThres = nick(image, [100 100]);

%imshow(nick(image1, [100 100]));
niblackThres = niblack(image, [100 100], -0.2, 10);
%imshow();
%bradleyThres1 = bradley(image1, [300 300], 20);
%bradleyThres2 = bradley(image2, [300 300], 20);
%meanThres1= meanthresh(image1, [150 150], 0.14)
%meanThres2= meanthresh(image2, [150 150], 0.14)

sauvolaThres = sauvola(image, [150 150]);

image = im2uint8(Orimage);
otsuThres =  im2bw(image,graythresh(image));


%subplot(1,2,1), imshow(sauvolaThres1);
%subplot(1,2,2), imshow(sauvolaThres1);
% Write image to graphics file. 

SAUVOLA_OUTPUT =[DIR,'','sauvolaThres.jpg'];
OTSU_OUTPUT =[DIR,'','otsuThres.jpg'];
NICK_OUTPUT =[DIR,'','nickThres.jpg'];
NIBLACK_OUTPUT =[DIR,'','niblackThres.jpg'];
imwrite(sauvolaThres,SAUVOLA_OUTPUT);
imwrite(otsuThres,OTSU_OUTPUT);
imwrite(nickThres,NICK_OUTPUT);
imwrite(niblackThres,NIBLACK_OUTPUT);