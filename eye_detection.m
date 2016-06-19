%Read the input image 
imgLocation = input('Enter your file path here:','s');
if(strcmp(imgLocation(end),'\')==false)
    imgLocation = strcat(imgLocation,'\');
end
filename = input('Enter file name(with extension) :','s');
format = filename(end-2:end);
inString = strcat(imgLocation,filename);
I = imread(inString,format);
%To detect Mouth
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
BB=step(MouthDetect,I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
%To detect Eyes
% EyeDetect = vision.CascadeObjectDetector('EyePairBig');
% BB=step(EyeDetect,I);
% figure,imshow(I);
% rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','b');
% E=imcrop(I,BB);
% figure,imshow(E);
