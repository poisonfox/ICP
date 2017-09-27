function[s] = compute_scale(l_red, r_red)


s = sqrt(sum(norm(r_red)^2)/sum(norm(l_red)^2));
end