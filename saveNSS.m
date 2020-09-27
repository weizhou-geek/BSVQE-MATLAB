function saveNSS

close all;
clear all;

% Input-3D processed texture videos, left and right views
% Output-NSS features

%% processed left and right views
dataleft = load('src01_HRC102_2.mat');
dataright = load('src01_HRC102_0.mat');
imDL = dataleft.Ydst;
imDR = dataright.Ydst;
    
imDD = abs(imDL-imDR);
imDS = abs(imDL+imDR);

[~,~,imDD2]=ZCA(imDD);
[~,~,imDS2]=ZCA(imDS);
    
featDD(:) = NSS_feature(imDD2);%featDD(:) = NSS_feature(imDD);
featDS(:) = NSS_feature(imDS2);%featDS(:) = NSS_feature(imDS);

save('featureNSS.mat','featDD','featDS');


