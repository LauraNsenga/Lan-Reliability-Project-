% Function plotResults
% Parameters:
%   K_values - Vector of K values
%   N - Number of simulations

                                
%Initialize the variables
KValues = [1, 5, 15, 50, 100];%given values
pValues = linspace(0, 1, 100);% linspace is used to generate 100 equally spaced values between 0 and 1
N = 1000;

for i = 1:5 %loop that plots all 5 values 
    K = KValues(i); % Current value of K to be plotted


% Initialize the values to zero
calculated_Results = zeros(1,5);
simulated_result = zeros(1,5);


   % Perform simulations for each combination of K and p
    for j = 1:99
        p = pValues(j); % Current value of p

   % Calculate the expected result for comparison
    calculated_Results(j) = K / (1 - p); %equation from slides

   % Simulate the result by calling the runSingleLinkSim divide j by 100 to
   % get the right x axis values
    
    simulated_result(j) = runSingleLinkSim(K, j./100, N);
        
    end

    % Plot the results for each K value
    semilogy(calculated_Results, 'r-', 'LineWidth', 2); % Plot calculated result as a solid line
    hold on;

    % Plot simulated result as hollow circles
    semilogy(simulated_result, 'go--', 'LineWidth', 1);
end

hold off;

%figure design
xlabel('Probability of Failure (p)');
ylabel('Average Transmissions');
title('Calculated and Simulated Results for Single Link Network');
legend('Calculated Results', 'Simulated Results');
set(gca, 'YScale', 'log'); % Logarithmic y-scale