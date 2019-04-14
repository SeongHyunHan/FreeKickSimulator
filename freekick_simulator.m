clear;

disp("Free Kick Simulator");

% Get input from the user
ball_size = input('Please select the size of the ball (3, 4, 5): ');

% Constant Variable
AD = 1.2;       % Air Density at Sea Level (kg/m^3)
DC = 0.8;       % Drag Coefficient
cross_section;  % Cross section area of a soccer ball (varies in size)
G;              % Gravity
D = AD * DC * cross_section; % Drag Calculation

ball_mass;      % Mass of the Ball (varies in size)
foot_mass;      % Mass of the Foot
e = 0.68;       % Coefficient 
Vf1;            % Velocity of the foot before Kick
Vf2;            % Velocity of the foot after Kick
Vb1 = 0;        % Velocity of the ball before Kick (Constant value 0)
Vb2 = (Vf1 * (foot_mass * (1+ e)) + Vb1 * (ball_mass - e * foot_mass)) / (foot_mass + ball_mass); % Velocity of the ball after Kick
