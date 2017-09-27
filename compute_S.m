function [S] = compute_S(l_red, r_red)

    S_xx= dot(l_red(1,:),r_red(1,:));
    S_xy= dot(l_red(1,:),r_red(2,:));
    S_xz= dot(l_red(1,:),r_red(3,:));
    
    S_yx= dot(l_red(2,:),r_red(1,:));
	S_yy= dot(l_red(2,:),r_red(2,:));
    S_yz= dot(l_red(2,:),r_red(3,:));

    S_zx= dot(l_red(3,:),r_red(1,:));
    S_zy= dot(l_red(3,:),r_red(2,:));
	S_zz= dot(l_red(3,:),r_red(3,:));
    

    S = [S_xx + S_yy + S_zz,        S_yz - S_zy,                S_zx - S_xz,            S_xy - S_yx;
         S_yz - S_zy,               S_xx - S_yy - S_zz,         S_xy + S_yx,            S_zx + S_xz;
         S_zx - S_xz,               S_xy + S_yx,              - S_xx + S_yy - S_zz,     S_yz + S_zy; 
         S_xy - S_yx,               S_zx + S_xz,                S_yz + S_zy,          - S_xx - S_yy + S_zz];

end