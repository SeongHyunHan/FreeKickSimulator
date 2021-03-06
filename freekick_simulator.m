 clear;

import Ball.*
%balls
ballSize5=Ball;
ballSize4=Ball;
ballSize3=Ball;
% ball masses divided by 10
ballSize5.mass=6.883185;
ballSize4.mass=5.893;
ballSize3.mass=4.699;
% ball cross sections in meters
ballSize3.cross_section=0.027759;
ballSize4.cross_section=0.032365;
ballSize5.cross_section=0.036644;
% ball sizes in inch
ballSize5.circumference=21.6;
ballSize4.circumference=20.3;
ballSize3.circumference=18.8;
% ball color
ballSize5.color='r';
ballSize4.color='b';
ballSize3.color='g';
% ball
ballSize5.name='Ball size 5';
ballSize4.name='Ball size 4';
ballSize3.name='Ball size 3';
balls=[ballSize3;ballSize4;ballSize5];
% bsizes=[ballSize3.circumference,ballSize4.circumference,ballSize5.circumference];
disp("Free Kick Simulator");

% Get input from the user
Vf1 = input('Enter velocity for the kick: '); % Velocity of the foot before Kick 
h_angle = input('Enter angle for height of the kick: ');
d_angle = input('Enter the angle for direction of the kick: ');

% Constant Variable
AD = 1.2;       % Air Density at Sea Level (kg/m^3)
DC = 0.25;       % Drag Coefficient
% cross_section =[ballSize3.cross_section	; ballSize4.cross_section;ballSize5.cross_section];  % Cross section area of a soccer ball
G = 9.81;              % Gravity
% D = 1/2*AD * DC * cross_section; % Drag Calculation
t = 0:0.1:3; % Time

% ball_mass = [ballSize3.mass; ballSize4.mass; ballSize5.mass ];      % Mass of the Ball (varies in size)
foot_mass = 1.43;      % Mass of the Foot
e = 0.68;       % Coefficient 
Vf2 = 1;            % Velocity of the foot after Kick
Vb1 = 0;        % Velocity of the ball before Kick (Constant value 0)

%goal post
l =  8;                                                 % Length
w = 7.3;                                                 % Width
h = 8;                                                 % Height
X = [-1  -1   1   1  -1; -1  -1   1   1  -1]*l;
Y = [2.42  3.42   3.42  2.42  2.42; 2.42   3.42   3.42  2.42  2.42]*w;
Z = [ 1   1   1   1   1;  0   0   0   0   0]*h;
figure(1)
surf(X, Y, Z)                                           % Plot Walls post
hold on
patch(X(1,:), Y(1,:), Z(1,:), 'y')               


wX = [-1  -1   1   1  -1; -1  -1   1   1  -1]*5;
wY = [2  3   3  2  2; 2   3   3  2  2]*0.5;
wZ = [ 1   1   1   1   1;  0   0   0   0   0]*5;

surf(wX, wY, wZ)                                           % Plot Wall of meat
patch(X(1,:) + 15, Y(1,:) + 20, Z(1,:), 'y')            

grid on
axis equal
axis([-40.3  40.3 -25  25 0 30])
hold on

%Label Graph
xlabel('X');
ylabel('Y');
zlabel('Z');

y_initial = -25;

for j = 1:3
    % Calculate the Velocity respect to angle
    Vb2 = (Vf1 * (foot_mass * (1+ e)) + Vb1 * (balls(j).mass - e * foot_mass)) / (foot_mass + balls(j).mass); % Velocity of the ball after Kick
 
    D= 1/2*((AD *(Vb2*Vb2))/2)* DC * balls(j).cross_section;
    vx = Vb2*cosd(d_angle)*sind(d_angle);
    v0y = Vb2 * cosd(h_angle)-D;
    v0z = Vb2 * sind(h_angle);
    vz = v0z-G*t;
    x = vx.*t;
    y = y_initial+v0y.*t;
    z = v0z.*t-0.5*G*(t.^2);
    h = animatedline('LineWidth', 2,'color',balls(j).color);
    for i = 1:length(t)
        % Calculate the position
        addpoints(h,x(i),y(i),z(i));
        head=scatter3(x(i),y(i),z(i),balls(j).circumference,'MarkerFaceColor',balls(j).color);
        drawnow;
        pause(0.2)
        delete(head)
      


        if x(i)>=-8 && x(i)<=8 && y(i)<=18 && y(i)>16 &&z(i)>=0 &&z(i)<=8
            disp('goal with');
            disp(balls(j).name);
        end
    end
end 
% Then plot 3D




