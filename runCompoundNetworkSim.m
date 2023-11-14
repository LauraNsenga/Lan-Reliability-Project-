%% Function  runCompoundNetworkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
% Function to run two link simulation
% Returns: the average numeric result across the total simulations

function result = runCompoundNetworkSim(K,p,N)

simResults = zeros(1,N);

for i=1:N

%once succesful accross prallel link figure it out for a single link 
txAttemptCount4 = runSingleLinkSim(K,p,1);

% Series Link 1
txAttemptCount1 = runSingleLinkSim(K,p,1);

% Parallel Links 2-3 
txAttemptCountLink2and3 = runTwoParallelLinkSim(K,p,1); 



% Sum all transmission counts only after success accross second link 
simResults(i) = txAttemptCount1  + txAttemptCountLink2and3 +txAttemptCount4; 
end

result = mean(simResults);

end