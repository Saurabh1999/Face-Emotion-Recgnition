function [current_feature] = extract_feature_vector(I,crop)

if (crop == 1)
    display('Crop Image for feature extraction')
    FDetect = vision.CascadeObjectDetector;
    BB = step(FDetect,I);
    I = imcrop(I,BB);
  %  I = imresize(I,[480,480]);
end

wname = 'bior6.8';
level = 2;
[c,s] = wavedec2(I,level,wname);
X = waverec2(c,s,wname);
X = uint8(X);

[H1,V1,D1] = detcoef2('all',c,s,1);
A1 = appcoef2(c,s,'bior6.8',1); 
V1img = wcodemat(V1,256,'mat',1);
H1img = wcodemat(H1,256,'mat',1);
D1img = wcodemat(D1,256,'mat',1);
A1img = wcodemat(A1,256,'mat',1);


[H2,V2,D2] = detcoef2('all',c,s,2);
A2 = appcoef2(c,s,'bior6.8',2); 
V2img = wcodemat(V2,256,'mat',1);
H2img = wcodemat(H2,256,'mat',1);
D2img = wcodemat(D2,256,'mat',1);
A2img = wcodemat(A2,256,'mat',1);


A2img = uint8(A2img);
V2img = uint8(V2img);
V1img = uint8(V1img);
H2img = uint8(H2img);
H1img = uint8(H1img);
D2img = uint8(D2img);
D1img = uint8(D1img);


%{
figure;
subplot(2,2,1);
imagesc(A1img)

colormap 'pink'
title('Approximation Coef. of Level 1');
%}
%{
figure;
subplot(4,4,[3,4,7,8]);
imagesc(H1img);
set(gca,'xtick',[],'ytick',[])
title('H1');

subplot(4,4,[9,10,13,14]);
imagesc(V1img);
set(gca,'xtick',[],'ytick',[])
title('V1');

subplot(4,4,[11,12,15,16]);
imagesc(D1img);
set(gca,'xtick',[],'ytick',[])
title('D1');

subplot(4,4,1);
imagesc(A2img);
set(gca,'xtick',[],'ytick',[])
title('A2');

subplot(4,4,2)
imagesc(H2img);
set(gca,'xtick',[],'ytick',[])
title('H2');

subplot(4,4,5)
imagesc(V2img);
set(gca,'xtick',[],'ytick',[])
title('V2');

subplot(4,4,6)
imagesc(D2img);
set(gca,'xtick',[],'ytick',[])
title('D2');
%}

N_A2 = entropy(A2img);
N_H2 = entropy(H2img);
N_V2 = entropy(V2img);
N_D2 = entropy(D2img);
N_H1 = entropy(H1img);
N_V1 = entropy(V1img);
N_D1 = entropy(D1img);

current_feature = [N_A2 N_H2 N_V2 N_D2 N_H1 N_V1 N_D1];
end

