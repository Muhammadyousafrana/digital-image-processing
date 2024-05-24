% MX-Mack Protocol Simulation with Noise and LMS Filter Application
% Node Movement Simulation, Noise Addition, LMS Filter, and Plotting

% Simulate node movement using a random walk
num_nodes = 10; % Number of nodes
num_steps = data_length; % Number of steps in the simulation equal to the data length for synchronization

% Initialize node positions randomly within a unit square [0,1]x[0,1]
node_positions = rand(num_nodes, 2);

% Simulate movement by adding small random changes at each step
movement_noise = 0.01; % Movement noise, i.e., how far nodes can move per step
node_movements = zeros(num_steps, num_nodes, 2); % To store node positions at each step

% Store initial positions
node_movements(1, :, :) = node_positions;

for step = 2:num_steps
    % Calculate random movement
    movement = movement_noise * randn(num_nodes, 2);
    
    % Update positions
    node_positions = node_positions + movement;
    
    % Store positions
    node_movements(step, :, :) = node_positions;
end

% Plot the Node Movement
figure;
subplot(4,1,1);
hold on;
colors = lines(num_nodes); % Get 'num_nodes' distinguishable colors
for i = 1:num_nodes
    % Plot movements for each node
    plot(squeeze(node_movements(:, i, 1)), squeeze(node_movements(:, i, 2)), '.', 'Color', colors(i,:));
end
title('Node Movements');
xlabel('X Coordinate');
ylabel('Y Coordinate');
hold off;

% Your code to generate data and filter follows...

% MX-Mack Protocol Data Generation (using random data for demonstration)
data_length = 1000; % Length of the signal
protocolData = randn(data_length, 1); % Random signal generation

% Adding noise to the protocol data
noise_variance = 0.5; % Variance of noise
noise = sqrt(noise_variance) * randn(data_length, 1); % Gaussian noise
noiseyData = protocolData + noise; % Signal with noise

% Applying an LMS adaptive filter to attempt to remove the noise
% Initialize LMS filter parameters
mu = 0.01; % Step size (learning rate)
filter_order = 32; % Order of the LMS filter, number of taps
lmsFilter = dsp.LMSFilter('Length', filter_order, 'StepSize', mu);

% Adaptive filtering
[filteredData,~,~] = step(lmsFilter, noiseyData, protocolData); % Using the original signal as the desired signal

% Plot the original, noisy, and filtered signals overlaid on the movement plot screen
subplot(4,1,2);
plot(protocolData);
title('Original MX-Mack Protocol Data');

subplot(4,1,3);
plot(noiseyData);
title('Noise Added Data');

subplot(4,1,4);
plot(filteredData);
title('Filtered Data with LMS');

% Synchronize subplots
linkaxes([subplot(4,1,1), subplot(4,1,2), subplot(4,1,3), subplot(4,1,4)],'x');

% Calculate the Mean-Square Error (MSE) - for performance analysis
mseValue = immse(protocolData, filteredData);

fprintf('The Mean Square Error of the filtered signal is: %f\n', mseValue);