function [image, filteredImage] = medianFilter(image, matrixSize)
% @author: Mehmet KIRAN
% @date: 21.11.2018
% @license: GNU GPL v3
% How To Use
% This function requires two parameters. 
% The first parameter is the image path, the second parameter is the matrix size.

image = imread(image);
[x, y, z] =size(image);
mI = image;
I = image;

if matrixSize == 3
%3x3 Median Filter
for i1 = 2:x-1
    for i2=2:y-1
        for i3 =1:z
            m = median(sort([I(i1-1, i2-1, i3), ...
                             I(i1, i2-1, i3), ...
                             I(i1+1, i2-1, i3), ...
                             I(i1-1, i2, i3), ...
                             I(i1, i2, i3), ...
                             I(i1+1, i2, i3), ...
                             I(i1-1, i2+1, i3), ...
                             I(i1, i2+1, i3), ...
                             I(i1+1, i2+1, i3)]));

        mI(i1, i2, i3) = uint8(m);
        end
    end
end

elseif matrixSize == 5
%5x5 Median Filter
for i1 = 3:x-2
    for i2=3:y-2
        for i3 =1:z
            m = median(sort([I(i1-2, i2-1, i3), ...
                             I(i1-1, i2-1, i3), ...
                             I(i1  , i2-1, i3), ...
                             I(i1+1, i2-1, i3), ...
                             I(i1+2, i2-1, i3), ...
                             I(i1-2, i2, i3), ...
                             I(i1-1, i2, i3), ...
                             I(i1  , i2, i3), ...
                             I(i1+1, i2, i3), ...
                             I(i1+2, i2, i3),...
                             I(i1-2, i2+1, i3), ...
                             I(i1-1, i2+1, i3), ...
                             I(i1  , i2+1, i3), ...
                             I(i1+1, i2+1, i3), ...
                             I(i1+2, i2+1, i3)]));

        mI(i1, i2, i3) = uint8(m);
        end
    end
end
else
    disp('Invalid value entered / Gecersiz Deger Girildi');
end

filteredImage = mI;
subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(filteredImage);


randomString =char(floor(94*rand(1, 10)) + 32);
baseFileName = sprintf('Image%s.png',randomString);
fullFileName = fullfile('./savedImage/medianFilter', baseFileName);

imwrite(filteredImage, fullFileName);

end

