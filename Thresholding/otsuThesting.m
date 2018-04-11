DIR = 'G:\Image Processing\Starting\Thresholding\data\';
%input image
image1 = imread([DIR,'','image1.jpg']);

%convert to grayscale


I = im2uint8(image1);
Ib = im2bw(I, graythresh(I));


DIR_OUTPUT1 =[DIR,'','image2.jpg'];
imwrite(Ib,DIR_OUTPUT1);