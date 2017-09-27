function[t] = compute_translation(r, s , R, l)

for i = 1:3;
    r_(i,:) = (1/length(r))*sum(r(i,:));
    l_(i,:) = (1/length(l))*sum(l(i,:));
end

t = r_ - s*R*l_;

end