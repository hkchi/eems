

function opt = default_snps_params(sourcepath)


%% For MCMC sampling, set the total number of iterations as well as
%% the burn-in iterations (to discard at the start) and
%% the thinning step (to discard before saving an iteration)
opt = struct('numIter',{30000},...
	     'numBurn',{20000},...
	     'numThin',{199},...
	     'maxRate',{log10(300)},...
	     'minRate',{-log10(300)},...
	     'absDiff',{2},...
	     'effctS2',{0.1},...
	     'coordS2',{0.1},...
	     'log10S2',{0.01},...
	     'ratesC',{1},...
	     'ratesD',{1},...
	     's2locC',{1},...
	     's2locD',{1},...
	     'negBiR',{5},...
	     'negBiP',{1/2});