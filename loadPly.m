function [ points ] = LoadPly( path )
% Liest eine Punktwolke im ply-Format ein

%% get end of header k
s=textread(path,'%s', 'delimiter','\n','whitespace',''); 
lines=size(s,1);

k = 1;
for i=1:lines
    b = strcmp(s(i),'end_header');
    if b>0   % ifnot empty 
        k = i;
    end 
end
if k+1 > lines
    return
end

%% get columns
string = char(s(k+1));
c = strsplit(string);
columns = length(c);



%% load points
fid = fopen(path);
temp = textscan(fid, repmat('%f ', 1, columns), 'Headerlines',k);
fclose(fid);
points(1,:) = temp{1,1};   % X
points(2,:) = temp{1,2};   % Y
points(3,:) = temp{1,3};   % Z