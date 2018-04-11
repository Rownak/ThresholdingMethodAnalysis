% DEGHOST removes ghost objects.
%   BW = DEGHOST(IMAGE, BW) performs a postprocessing step used in Yanowitz
%   and Bruckstein's binarization to remove ?ghost? objects. The method
%   takes the original image IMAGE and the binarized image BW and returns 
%   the deghosted binary image BW.   
%      
%   BW = DEGHOST(IMAGE, BW, KERNELSIZE, CONNECTIVITY, TP) performs
%   deghosting with blurring defined by KERNELSIZE (default is 3) and 
%   the connectivity schema defined by CONNECTIVITY (default is 4). 
%   Threshold TP defines the strenght of the deghosting (default is 0).
%
%   [BW, COMPONENTS] = DEGHOST(IMAGE, BW) also returns image
%   statistics.
%
%   Method description
%   ------------------
%   The postprocessing step used in Yanowitz and Bruckstein's method 
%   removes ?ghost? objects, and can be incorporated
%   into other methods as well. The average gradient value at
%   the edge of each printed object is calculated. Objects hav-
%   ing an average gradient below a threshold TP are labeled
%   as misclassified, and are removed. The main steps of the
%   algorithm are given below:
%       1. Smooth the original image by a (33) mean filter to
%          remove noise.
%       2. Calculate the gradient magnitude image G of the
%          smoothed image, using, e.g., Sobel's edge operator.
%       3. Select a value for TP. 
%       4. For all 4-connected print components, calculate the
%          average gradient of the edge pixels. Edge pixels are
%          print pixels that are 4-connected to the background.
%          Remove print components having an average edge gra-
%          dient below the threshold TP.

%   Example
%   -------
%       image = imread('eight.tif');
%       bw = niblack(image, [195 195]);
%       figure; imshow(bw);
%       bw2 = deghost(image, bw);
%       figure; imshow(bw2);
%
%   See also BWCONNCOMP, SOBELKERNEL.

%   For method description see:
%       Oivind Due Trier and Torfinn Taxt, Evaluation of Binarization
%       Methods for Document Images. doi=10.1.1.53.5284
%
%   Contributed by Jan Motl (jan@motl.us)
%   $Revision: 1.0 $  $Date: 2013/05/10 16:58:01 $

function [output, components] = deghost(image, bw, varargin)

% Initialization
numvarargs = length(varargin);      % Only want 3 optional inputs at most
if numvarargs > 3
    error('myfuns:somefun2Alt:TooManyInputs', ...
     'Possible parameters are: (image, bw, kernelSize, connectivity, tp)');
end
 
optargs = {3 4 0}; % Set defaults
 
optargs(1:numvarargs) = varargin;   % Use memorable variable names
[kernelSize, connectivity, tp] = optargs{:};

% DeGhosting
image = mat2gray(image(:,:,1));     % Make sure the image is 2D double
gradient = abs(imfilter(image, sobelkernel(kernelSize))); % Smooth gradient
components = bwconncomp(~bw, connectivity); % Get the objects
edges = edge(bw, 'sobel');          % Defines the object's edge
output = true(size(image));         % Prealocate white output image

for component = 1:components.NumObjects
    pixels = components.PixelIdxList{component};
    meanGradient = mean(double(gradient(pixels)).*edges(pixels));
    components.MeanGrad(component) = meanGradient;
    if meanGradient > tp
        output(pixels) = 0;
    end
end
