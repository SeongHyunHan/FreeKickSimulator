
ballsWeight=[[340,69],[390,69],[450,68.83185 ]];
 	 
clear;

disp("Free Kick Simulator");

% Get input from the user

% Constant Variable
AD = 1.2;       % Air Density at Sea Level (kg/m^3)
DC = 0.8;       % Drag Coefficient
cross_section = 0.1;  % Cross section area of a soccer ball (varies in size)
G = 1;              % Gravity
D = AD * DC * cross_section; % Drag Calculation

ball_mass = 2;      % Mass of the Ball (varies in size)
foot_mass = 1.43;      % Mass of the Foot
e = 0.68;       % Coefficient 
Vf1 = 1;            % Velocity of the foot before Kick
Vf2 = 1;            % Velocity of the foot after Kick
Vb1 = 0;        % Velocity of the ball before Kick (Constant value 0)
Vb2 = (Vf1 * (foot_mass * (1+ e)) + Vb1 * (ball_mass - e * foot_mass)) / (foot_mass + ball_mass); % Velocity of the ball after Kick

%goal post
l =  8;                                                 % Length
w =  7.3;                                                 % Width
h = 8;                                                 % Height
X = [-1  -1   1   1  -1; -1  -1   1   1  -1]*l;
Y = [3   5   5  3  3; 3   5   5  3  3]*w;
Z = [ 1   1   1   1   1;  0   0   0   0   0]*h;
figure(1)
surf(X, Y, Z)                                           % Plot Walls
hold on
patch(X(1,:), Y(1,:), Z(1,:), 'y')                      % Plot Flat Roof
hold off
grid on
axis equal
axis([-25  25    -40.3  40.3    0  9])
