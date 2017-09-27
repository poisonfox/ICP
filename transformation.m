function [r] = transformation(s, R, l, t)

for i = 1:length(l)
    
   r = s*R*l;
   
    for i=1:length(r)
        r(:,i) = r(:,i)+t;
    end
   
end

end