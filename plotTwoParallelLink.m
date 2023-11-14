% Function plotTwoParallelLink
% Parameters:
%   K_values - Vector of K values
%   N - Number of simulations

                                
%Initialize the variables
KValues = [1, 5, 15, 50, 100];%given values
pValues = linspace(0, 1, 100);% linspace is used to generate 100 equally spaced values between 0 and 1
N = 1000; %1000 iterations

for i = 1:5 %loop that plots all 5 values 
    K = KValues(i); % Current value of K to be plotted


% Initialize the values to zero fro all 5 values
simulated_result = zeros(1,5);


   % Perform simulations for each combination of K and p
    for j = 1:99 %for all the 100 values
        p = pValues(j); % Current value of p


   % Simulate the result by calling the runTwoSeriesLinkSim divide j by 100 to
   % get the right x axis values
    
    simulated_result(j) = runTwoParallelLinkSim(K, j./100, N);
        
    end


    % Plot simulated result as hollow circles
    semilogy(simulated_result, 'ro--', 'LineWidth', 1);
end

hold off;

%figure design
xlabel('Probability of Failure (p)');
ylabel('Average Transmissions');
title('Simulated Results for Two Parallel Link Network');
legend('Simulated Results');
set(gca, 'YScale', 'log'); % Logarithmic y-scale