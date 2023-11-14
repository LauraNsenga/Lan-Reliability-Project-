%% Function runCustomCompoundNetworkSim()
% Used for compound network simulation
% Parameters
% K - the number of packets in the application message
% p1, p2, p3, p4 - the probabilities of failure for different links
% N - the number of simulations to run
% Function to run compound network simulation
% Returns: the average numeric result across the total simulations
function result = runCustomCompoundNetworkSim(K, p1, p2, p3, p4, N)
simResults = zeros(1, N);
for i = 1:N
    % Series Link 1
    txAttemptCount1 = runSingleLinkSim(K, p1, 1);
   
    % Parallel Links 2-3
    txAttemptCountLink2 = runTwoParallelLinkSim(K, p2, 1);
    txAttemptCountLink3 = runTwoParallelLinkSim(K, p3, 1);
   
    % Series Link 4
    txAttemptCount4 = runSingleLinkSim(K, p4, 1);
   
    % Sum all transmission counts
    simResults(i) = txAttemptCount1 + txAttemptCountLink2+ txAttemptCountLink3 + txAttemptCount4;
end
result = mean(simResults);
end