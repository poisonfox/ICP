function[R, s, t] = compute_parameters(r, l)

l_red = red_l(l);
r_red = red_r(r);

% compute R
S = compute_S(l_red, r_red);
R = compute_R(S);

% compute scale
s = compute_scale(l_red, r_red);

% compute translation 
t = compute_translation(r, s, R, l);

end