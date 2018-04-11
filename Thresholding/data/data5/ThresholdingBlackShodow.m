DIR = 'G:\Image Processing\Starting\Thresholding\data\data5\';
%input image
Orimage1 = imread([DIR,'','blackShadow1.jpg']);
Orimage2 = imread([DIR,'','blackShadow2.jpg']);
%convert to grayscale
image1 = rgb2gray(Orimage1);
image2 = rgb2gray(Orimage2);

nickThres1 = nick(image1, [100 100]);
nickThres2 = nick(image2, [100 100]);
%imshow(nick(image1, [100 100]));
niblackThres1 = niblack(image1, [100 100], -0.2, 10);
niblackThres2 = niblack(image2, [100 100], -0.2, 10);
%imshow();
bradleyThres1 = bradley(image1, [300 300], 20);
bradleyThres2 = bradley(image2, [300 300], 20);
%meanThres1= meanthresh(image1, [150 150], 0.14)
%meanThres2= meanthresh(image2, [150 150], 0.14)

sauvolaThres1 = sauvola(image1, [150 150]);
sauvolaThres2 = sauvola(image2, [150 150]);



image1 = im2uint8(Orimage1);
image2 = im2uint8(Orimage2);
otsuThres1 =  im2bw(image1,graythresh(image1));
otsuThres2 =  im2bw(image2,graythresh(image2));


%subplot(1,2,1), imshow(sauvolaThres1);
%subplot(1,2,2), imshow(sauvolaThres1);
% Write image to graphics file. 
%imwrite(nickThres,'G:\Image Processing\Starting\Thresholding\nickThres.jpg');
%imwrite(niblackThres,'G:\Image Processing\Starting\Thresholding\niblackThres.jpg');
%imwrite(bradleyThres,'G:\Image Processing\Starting\Thresholding\bradleyThres.jpg');
DIR_OUTPUT1 =[DIR,'','sauvoladarkShadow1.jpg'];
DIR_OUTPUT2 =[DIR,'','sauvoladarkShadow2.jpg'];
DIR_OUTPUT3 =[DIR,'','otsudarkShadow1.jpg'];
DIR_OUTPUT4 =[DIR,'','otsudarkShadow2.jpg'];
DIR_OUTPUT5 =[DIR,'','nickdarkShadow1.jpg'];
DIR_OUTPUT6 =[DIR,'','nickdarkShadow2.jpg'];
DIR_OUTPUT7 =[DIR,'','niblackdarkShadow1.jpg'];
DIR_OUTPUT8 =[DIR,'','niblackdarkShadow2.jpg'];
DIR_OUTPUT9 =[DIR,'','bradleydarkShadow1.jpg'];
DIR_OUTPUT10 =[DIR,'','bradleydarkShadow2.jpg'];
imwrite(sauvolaThres1,DIR_OUTPUT1);
imwrite(sauvolaThres2,DIR_OUTPUT2);
imwrite(otsuThres1,DIR_OUTPUT3);
imwrite(otsuThres2,DIR_OUTPUT4);
imwrite(nickThres1,DIR_OUTPUT5);
imwrite(nickThres2,DIR_OUTPUT6);
imwrite(niblackThres1,DIR_OUTPUT7);
imwrite(niblackThres2,DIR_OUTPUT8);
imwrite(bradleyThres1,DIR_OUTPUT9);
imwrite(bradleyThres2,DIR_OUTPUT10);