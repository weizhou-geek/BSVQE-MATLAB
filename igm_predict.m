function [ img_dis, img_prd] = igm_predict( img )

% transform color into gray
if size( img, 3 ) == 3
    img = double( rgb2gray( img ) );
else
    img = double( img );
end

%% decompose into two portions
[row, col] = size( img );
sigma_value = 2*20.^2;
r = 3;
R = 10;
edge_threshold = 0.2;
mat_pad = padarray(img, [R+r,R+r], 'symmetric'); % pad the mat for edge processing
img_pad = mat_pad( R+1:end-R, R+1:end-R );
mat_edge = edge(mat_pad,'canny',edge_threshold);
edge_c = mat_edge( R+1:end-R, R+1:end-R );
ker = ones( 2*r+1 ) / ( 2*r+1 )^2;
img_reco = zeros( row, col );
weight_mat = zeros( row, col );
max_weight = ones( row, col ) * 0.01;
for u = -R : R
    for v = -R : R      
        if u==0 && v==0
            continue;
        end
        img_move = mat_pad( R+1+u:end-R+u, R+1+v:end-R+v );
        mat_dif = ( img_pad - img_move ).^2;
        sum_val = filter2( ker, mat_dif, 'valid' );        
        simi_val = exp( - sum_val ./ sigma_value );
        edge_m = mat_edge( R+1+u:end-R+u, R+1+v:end-R+v );
        sign_edge = ones( size( edge_c ) );
        sign_edge( edge_c == edge_m ) = 10;
        edge_simi =  sign_edge( r+1:end-r, r+1:end-r );       
        mat_simi = simi_val .* edge_simi;
        img_reco = img_reco + img_move(r+1:end-r, r+1:end-r).*mat_simi;
        weight_mat = weight_mat + mat_simi;
        max_weight( mat_simi > max_weight ) = weight_mat( mat_simi > max_weight );
    end
end
img_recon = img_reco + max_weight .* img;
weight_mat = weight_mat + max_weight;
img_reconst = uint8(img_recon ./ weight_mat);
img_dis = img - double( img_reconst );
img_prd = double( img_reconst );
%img_prd = img;
end


