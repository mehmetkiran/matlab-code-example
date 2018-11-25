function [image,filteredImage] = addNoise(image, noiseLevel)
% @author: Mehmet KIRAN
% @date: 21.11.2018
% @license: GNU GPL v3

% How To Use
% The function requires 2 parameters. First parameter is the file's path or file name.
% Second parameter is noise level.

image = imread(image);

filteredImage= imnoise(image, 'salt & pepper', noiseLevel);

subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(filteredImage);

randomString =char(floor(94*rand(1, 10)) + 32);
baseFileName = sprintf('Image%s.png',randomString);
fullFileName = fullfile('./savedImage/noise/', baseFileName);

imwrite(filteredImage, fullFileName);
end

