function [l_red] = red_l(l)

for i = 1:3;
    l_(i,:) = (1/length(l))*sum(l(i,:));
end

for j = 1:length(l);
        l_red(:,j) = l(:,j)-l_;
end

end