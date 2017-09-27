function [r_new] = assign(l_in, r_in)

    len = length(l_in(1,:));
    dist = ones(len, len);
    r_new = r_in;

    for i=1:len 
        for j=1:len
            dist(j,i)=sqrt((r_in(1,j) - l_in(1,i))^2+(r_in(2,j) - l_in(2,i))^2+(r_in(3,j) - l_in(3,i))^2);
        end
    
    [Min,Imin] = min(dist(j,:));
    r_new(:,j) = r_in(:,Imin);
    end
end