clear;

disp("Free Kick Simulator");

% Get input from the user
ball_size = input('Please select the size of the ball (3, 4, 5): ');

% Constant Variable
AD = 1.2;       % Air Density at Sea Level (kg/m^3)
DC = 0.8;       % Drag Coefficient
cross_section = 0.1;  % Cross section area of a soccer ball (varies in size)
G = 1;              % Gravity
D = AD * DC * cross_section; % Drag Calculation

ball_mass = 2;      % Mass of the Ball (varies in size)
foot_mass = 2;      % Mass of the Foot
e = 0.68;       % Coefficient 
Vf1 = 1;            % Velocity of the foot before Kick
Vf2 = 1;            % Velocity of the foot after Kick
Vb1 = 0;        % Velocity of the ball before Kick (Constant value 0)
Vb2 = (Vf1 * (foot_mass * (1+ e)) + Vb1 * (ball_mass - e * foot_mass)) / (foot_mass + ball_mass); % Velocity of the ball after Kick

% Create Axis
axis equal;
axis([0 30 0 20 0 10]);
grid on;

% {Todo} Visualize the wall

% {Todo} Visualize the goal post

% {Todo} Bind the visual model to Axis

% {Todo} Calculate the kick

% {Todo} For loop for simulation