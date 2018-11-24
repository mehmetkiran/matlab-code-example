function [image,filteredImage] = addNoise(image, filterRate)
% @author: Mehmet KIRAN
% @date: 21.11.2018
% @license: GNU GPL v3

% How To Use
% The function requires 2 parameters. First parameter is the file's path or file name.
% Second parameter is filter rate.

image = imread(image);

filteredImage= imnoise(image, 'salt & pepper', filterRate);

subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(filteredImage);

end

