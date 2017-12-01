clear;clc;close all;
iGray = imread('unknown.jpg');
iThresh =iGray > 200;
figure;
imshow(iThresh);

SE = strel('disk',2);
BW = imdilate(~iThresh,SE);
figure;
imshow(BW);

 iStats = regionprops(BW, 'basic','Centroid');
 iStats([iStats.Area]<1000)=[];
 num = length(iStats);
 
  [maxVal,maxIndex] = max([iStats.Area]);
  tempIstats = sort([iStats.Area],'descend');

  
    
  iBox = floor([iStats.BoundingBox]);
  
  iBox=reshape(iBox,[4,num]);
  
  hold on;
  for i = 1:num
      rectangle('Position', [iBox(:,i)],'LineWidth',2,'EdgeColor','g');
  end
  
  for i = 1 : num
      col1 = iBox(1,i);
      col2 = iBox(1,i)+iBox(3,i);
      row1 = iBox(2,i);
      row2 = iBox(2,i)+iBox(4,i);
      subImage = BW(row1:row2, col1:col2);
      unknownImage{i} = subImage;
      unknownImageScaled{i} = imresize(subImage, [24 12]);
      figure;
      imshow(unknownImageScaled{i});
  end
  