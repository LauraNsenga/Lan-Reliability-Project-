%% Function runTwoParallelLinkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runTwoParallelLinkSim(K,p,N)
simResults = zeros(1,N);

for i=1:N

% Initialize counters to zero 
txAttemptCount = 0;  
pktSuccessCount = 0;

% Transmit all K packets
while pktSuccessCount < K

    % Generate random numbers for both links
    r1 = rand;  
    r2 = rand;
    
    % Increment transmission attempt counter
    txAttemptCount = txAttemptCount + 1;  
    
    % If either link succeeds, increment success counter
    if r1 > p || r2 > p
        pktSuccessCount = pktSuccessCount + 1;
    end
    
end

% Store total transmission attempts for this simulation
simResults(i) = txAttemptCount;

end

% Take average across all simulations
result = mean(simResults);

end