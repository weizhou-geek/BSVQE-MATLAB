function saveDisparity_igm

close all;
clear all;

% Input-3D processed texture videos, left and right views
% Output-Depth quality score, entropy of the predicted and disorderly parts

%% processed left and right views
dataleft = load('src01_HRC102_2.mat');
dataright = load('src01_HRC102_0.mat');
Disparity = abs(dataleft.Ydst - dataright.Ydst);

% AR prediction
[img_dis, img_prd] = igm_predict(Disparity);
    
Hdis = calEntropy(abs(img_dis));
Hprd = calEntropy(abs(img_prd));

if Hdis == 0
    H = Hdis;
else
    H = Hprd * Hdis;
end
Hvalue = H;

save('featureEntropy.mat','Hvalue');


