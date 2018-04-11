%MEANTHRESH local thresholding.
%   BW = MEANTHRESH(IMAGE) performs local thresholding of a two-dimensional 
%   array IMAGE with mean thresh algorithm.
%      
%   BW = MEANTHRESH(IMAGE, [M N], THRESHOLD, PADDING) performs local 
%   thresholding with M-by-N neighbourhood (the default is 15-by-15) and 
%   threshold THRESHOLD between 0 and 1 (the default is 0.1). 
%   To deal with border pixels the image is padded with PADARRAY. The 
%   PADDING parameter can be either set to a scalar or a string: 
%       'circular'    Pads with circular repetition of elements.
%       'replicate'   Repeats border elements of matrix A (default).
%       'symmetric'   Pads array with mirror reflections of itself. 
%       
%   Example
%   -------
%       imshow(meanthresh(imread('eight.tif'), [150 150], 0.14));
%
%   See also PADARRAY, RGB2GRAY.

%   Contributed by Jan Motl (jan@motl.us)
%   $Revision: 1.1 $  $Date: 2013/03/09 16:58:01 $

I = im2uint8(I);
if size(I,3) ~= 1
    I = rgb2gray(I);
end;