function H_img = calEntropy(img)

I = img;
%I=double(I);
[C, R] = size(I);
Img_size = C * R;
L = 256;
H_img = 0;
nk = zeros(L, 1);
for i = 1:C
    for j = 1:R
        Img_level = I(i, j) + 1;       
        nk(Img_level) = nk(Img_level) + 1;
    end
end
for k = 1:L
    Ps(k) = nk(k) / Img_size;
    if Ps(k) ~= 0;
        H_img = -Ps(k)*log2(Ps(k)) + H_img;
    end
end

%entropy(I)


