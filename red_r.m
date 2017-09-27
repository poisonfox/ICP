function [r_red] = red_r(r)

for i = 1:3;
    r_(i,:) = (1/length(r))*sum(r(i,:));
end

for j = 1:length(r);
     r_red(:,j) = r(:,j)-r_;
end

end