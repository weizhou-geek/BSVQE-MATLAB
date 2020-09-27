function calCorr

close all;
clear all;

load('featureEntropy.mat');
load('featureNSS.mat');

load('MOSqoe.mat');
MOS=MOSqoe;

%% qoe
X=[featDS', Hvalue];

K=5;
N=length(X);
indices = crossvalind('Kfold',N,K);
g=-8;
c=12;
lower=0;
upper=1;
for i = 1:1000
    indices=randperm(N);
    traindata=X(indices(1:floor(N*0.8)),:);
    trainlabel=MOS(indices(1:floor(N*0.8)));
    testdata=X(indices(floor(N*0.8)+1:end),:);
    testlabel=MOS(indices(floor(N*0.8)+1:end));
    [traindata_norm,MAX,MIN]=normalization(traindata,lower,upper);
    model=libsvmtrain(trainlabel,traindata_norm,['-s 3 -t 2 -c ',num2str(2^c),'-g ',num2str(2^g)]);
    testdata_norm=normalization(testdata,lower,upper,MAX,MIN);
    predicted_label = libsvmpredict(testlabel,testdata_norm,model)
    LCC(i)=corr(predicted_label,testlabel);
    SROCC(i)=corr(predicted_label,testlabel,'type','spearman');
end
LCCmedian=median(LCC,'omitnan')
SROCCmedian=median(SROCC,'omitnan')


