A = imread('img.png');% read image

[A,map] = rgb2ind(A,65);%convert to indexed image with 65 colors

A =double(A);
sizeOfImage = size(A);
numOfPixels = prod(sizeOfImage);
isMatch = zeros(sizeOfImage);
currentCanvas = nan(sizeOfImage);
percentageComplete = 0;

figure; ax = axes;

while(percentageComplete<.95)% stop, when 95% is done
    
    isMatch = (currentCanvas == A);% check matches
    randomCanvas =( randi([0 length(map)-1],sizeOfImage)); % create random canvas
    currentCanvas = A.* isMatch + randomCanvas .* ~isMatch;  %change only not-matched pixels
    
    imshow(uint16(currentCanvas),map,'Parent',ax)% show result
    pause(0.0001)
    percentageComplete = sum(isMatch(:))/numOfPixels;
end


