clear all
clc
close all

% load data sets
l = loadPly('left.ply');
r = loadPly('right.ply');

% set approximate parameters
R = [sqrt(2)/2 -sqrt(2)/2   0;
     sqrt(2)/2  sqrt(2)/2   0;
     0    0     1];
s = 1;
t = [1; 10;  3];

% transform left data set
l_t = transformation(s, R, l , t);

%% Iteration until convergenve
counter = 0;
mseDiff = inf;
mse = 0.0;
c = 0;
    while mseDiff > eps
        c = c + 1;
        mse_2 = mse;
        % assign point clouds
        r_new = assign(l_t, r);

        % estimate R_e, s_e, t_e
        [R_e, s_e, t_e] = compute_parameters(r_new, l);
        
        % transform with estimated parameters
        l_t = transformation(s_e, R_e, l, t_e);
        
        mse = sum(sum((r - l_t).^ 2));
        mse_xyz(c,:) = sum(abs(r - l_t).^ 2);
        mseDiff = abs(mse - mse_2);     
    end 

% print final parameters
R_e
s_e
t_e

% plot mse
% figure;
% hold on;
% plot(mse_xyz(:,1),'r');
% plot(mse_xyz(:,2),'g');
% plot(mse_xyz(:,3),'b');
% legend('MSE_x', 'MSE_y', 'MSE_z')
% xlabel('Number of iterations')
% ylabel('MSE')
%     
    
    
    
%% plot point clouds
% figure
% scatter3(l(1,:), l(2,:), l(3,:),'.');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('Left data set');
% axis equal
% grid on
% 
% figure
% scatter3(r(1,:), r(2,:), r(3,:),'.');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('Right data set');
% axis equal
% grid on
% 
% figure
% scatter3(l(1,:), l(2,:), l(3,:),'.');
% hold on
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% scatter3(r(1,:), r(2,:), r(3,:),'.');
% axis equal
% grid on
