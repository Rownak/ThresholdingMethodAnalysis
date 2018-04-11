DIR = 'G:\Image Processing\Starting\Thresholding\data\';
%input image
Orimage1 = imread([DIR,'','illuminated1.jpg']);
Orimage2 = imread([DIR,'','illuminated2.jpg']);
%convert to grayscale
image1 = rgb2gray(Orimage1);
image2 = rgb2gray(Orimage2);

nickThres1 = nick(image1, [100 100]);
nickThres2 = nick(image2, [100 100]);
%imshow(nick(image1, [100 100]));
niblackThres1 = niblack(image1, [100 100], -0.2, 10);
niblackThres2 = niblack(image2, [100 100], -0.2, 10);
%imshow();
%bradleyThres1 = bradley(image1, [300 300], 20);
%bradleyThres2 = bradley(image2, [300 300], 20);
%meanThres1= meanthresh(image1, [150 150], 0.14)
%meanThres2= meanthresh(image2, [150 150], 0.14)

sauvolaThres1 = sauvola(image1, [150 150]);
sauvolaThres2 = sauvola(image2, [150 150]);



image1 = im2uint8(Orimage1);
image2 = im2uint8(Orimage2);
otsuThres1 =  im2bw(image1,graythresh(image1));
otsuThres2 =  im2bw(image1,graythresh(image2));


%subplot(1,2,1), imshow(sauvolaThres1);
%subplot(1,2,2), imshow(sauvolaThres1);
% Write image to graphics file. 
%imwrite(nickThres,'G:\Image Processing\Starting\Thresholding\nickThres.jpg');
%imwrite(niblackThres,'G:\Image Processing\Starting\Thresholding\niblackThres.jpg');
%imwrite(bradleyThres,'G:\Image Processing\Starting\Thresholding\bradleyThres.jpg');
DIR_OUTPUT1 =[DIR,'','sauvolaThres1.jpg'];
DIR_OUTPUT2 =[DIR,'','sauvolaThres2.jpg'];
DIR_OUTPUT3 =[DIR,'','otsuThres1.jpg'];
DIR_OUTPUT4 =[DIR,'','otsuThres2.jpg'];
DIR_OUTPUT5 =[DIR,'','nickThres1.jpg'];
DIR_OUTPUT6 =[DIR,'','nickThres2.jpg'];
DIR_OUTPUT7 =[DIR,'','niblackThres1.jpg'];
DIR_OUTPUT8 =[DIR,'','niblackThres2.jpg'];
imwrite(sauvolaThres1,DIR_OUTPUT1);
imwrite(sauvolaThres1,DIR_OUTPUT2);
imwrite(otsuThres1,DIR_OUTPUT3);
imwrite(otsuThres2,DIR_OUTPUT4);
imwrite(nickThres1,DIR_OUTPUT5);
imwrite(nickThres2,DIR_OUTPUT6);
imwrite(niblackThres1,DIR_OUTPUT7);
imwrite(niblackThres2,DIR_OUTPUT8);