%% Function runTwoSeriesLinkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
% Function to run two link simulation
% Returns: the average numeric result across the total simulations

function result = runTwoSeriesLinkSim(K,p,N)

simResults = ones(1,N);%a place to store the result of each simulation

for i=1:N
    %for link 1
txAttemptCount1 = 0; % transmission count
pktSuccessCount1 = 0; % number of packets that have made it across

 % Simulate the transmission over the first link
 while pktSuccessCount1 < K
 r1 = rand; % generate a random number to determine if the packet is successful (r > p)
 txAttemptCount1 = txAttemptCount1 + 1; % count 1st attempt

 % while packet transmissions are not successful (r < p)
 while r1 < p
 r1 = rand; % transmit again, generate new success check value r
txAttemptCount1 = txAttemptCount1 + 1; % count additional attempt
end

pktSuccessCount1 = pktSuccessCount1 + 1; % increase success count after success (r > p)
end


% counters for the second link
txAttemptCount2 = 0;% transmission count for link 2 
pktSuccessCount2 = 0;% number of packets that have made it across

% Simulate the transmission over the second link
 while pktSuccessCount2 < K
 r2 = rand; % generate a random number to determine if the packet is successful (r > p)
 txAttemptCount2 = txAttemptCount2 + 1; % count 1st attempt

% while packet transmissions are not successful (r < p)
while r2 < p
r2 = rand; % transmit again, generate new success check value r
txAttemptCount2 = txAttemptCount2 + 1; % count additional attempt
end

pktSuccessCount2 = pktSuccessCount2 + 1; % increase success count after success (r > p)
end

% Combine the transmission attempts for both links 1 and 2 
simResults(i) = txAttemptCount1 + txAttemptCount2;
 end

 % Return the mean (average) of all the recorded simulation results
result = mean(simResults);
end
