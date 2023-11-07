% Set the figure properties
figure('Color', 'white');
axis equal;
axis off;
hold on;

% Define the coordinates of the outer circle
t = linspace(0, 2*pi, 100);
x = 0.8 * cos(t);
y = 0.8 * sin(t);
fill(x, y, [0.2, 0.2, 0.2], 'LineWidth', 2);

% Define the coordinates of the inner circle
t = linspace(0, 2*pi, 100);
x = 0.4 * cos(t);
y = 0.4 * sin(t);
fill(x, y, 'white', 'LineWidth', 2);

% Define the coordinates of the top left quadrilateral
x = [-0.8 -0.4 -0.3 -0.7];
y = [0.3 0.3 0.5 0.5];
fill(x, y, [0.2, 0.2, 0.2], 'LineWidth', 2);

% Define the coordinates of the top right quadrilateral
x = [0.8 0.4 0.3 0.7];
y = [0.3 0.3 0.5 0.5];
fill(x, y, [0.2, 0.2, 0.2], 'LineWidth', 2);

% Define the coordinates of the bottom left quadrilateral
x = [-0.8 -0.4 -0.3 -0.7];
y = [-0.3 -0.3 -0.5 -0.5];
fill(x, y, [0.2, 0.2, 0.2], 'LineWidth', 2);

% Define the coordinates of the bottom right quadrilateral
x = [0.8 0.4 0.3 0.7];
y = [-0.3 -0.3 -0.5 -0.5];
fill(x, y, [0.2, 0.2, 0.2], 'LineWidth', 2);