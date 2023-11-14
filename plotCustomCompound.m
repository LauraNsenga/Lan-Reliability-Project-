% plotCustomCompoundNetwork
% Parameters:
%   K_values - Vector of K values
%   N - Number of simulations

% Initialize the variables outside the loop
KValues = [1, 5, 15, 50, 100]; % Given values
pValues = linspace(0, 1, 100); % Generate 100 equally spaced values between 0 and 1
N = 1000; % 1000 iterations

% p values
p1 = 0.1; p2 = 0.6; p3 = 0.01;

% Initialize the arrays to store results
% Use 100 here to match the number of pValues
simulated_result = zeros(1, 100);

for i = 1:5 % Loop that plots all 5 values
    K = KValues(i); % Current value of K to be plotted

    % Perform simulations for each combination of K and p
    for j = 1:100 % For all the 100 values
        p = pValues(j); % Current value of p

    

        % Simulate the result by calling the runCustomCompoundNetworkSim divide j by 100 to
        % get the right x-axis values
        simulated_result(j) = runCustomCompoundNetworkSim(K, p1, p2, p3, j / 100, N);

    end

   
    % Plot simulated result as hollow circles
    semilogy(simulated_result, 'go--', 'LineWidth', 1);
end

hold off;

% Figure design
xlabel('Probability of Failure (p)');
ylabel('Average Transmissions');
title('Simulated Results for Custom Compound Network');
legend('Calculated Results', 'Simulated Results');
set(gca, 'YScale', 'log'); % Logarithmic y-scale