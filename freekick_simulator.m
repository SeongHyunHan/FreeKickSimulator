 
clear;

disp("Free Kick Simulator");

% Get input from the user
Vf1 = input('Enter velocity for the kick: '); % Velocity of the foot before Kick 
angle = input('Enter angle for the kick: ');

% Constant Variable
AD = 1.2;       % Air Density at Sea Level (kg/m^3)
DC = 0.8;       % Drag Coefficient
cross_section = 2.5;  % Cross section area of a soccer ball
G = 9.81;              % Gravity
D = AD * DC * cross_section; % Drag Calculation
t = 0:0.1:3; % Time

ball_mass = [4.699; 5.893; 6.883185 ];      % Mass of the Ball (varies in size)
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
    Vb2 = (Vf1 * (foot_mass * (1+ e)) + Vb1 * (ball_mass(j) - e * foot_mass)) / (foot_mass + ball_mass(j)); % Velocity of the ball after Kick
    vx = Vb2*cosd(90)*sind(90);
    v0y = Vb2 * cosd(angle)-D;
    v0z = Vb2 * sind(angle);
    vz = v0z-G*t;
    x = vx.*t;
    y = y_initial+v0y.*t;
    z = v0z.*t-0.5*G*(t.^2);
    h = animatedline('LineWidth', 2);
    for i = 1:length(t)
        % Calculate the position
        addpoints(h,x(i),y(i),z(i));
        head=scatter3(x(i),y(i),z(i),500);
        drawnow;
        pause(0.2)
        delete(head)
    end
end 
% Then plot 3D




