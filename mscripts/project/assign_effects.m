

function [Voronoi,params] = assign_effects(Sstruct,Vcoord,habitat,opt)


p = Sstruct.nSites;
n = Sstruct.nIndiv;

if ~isfield(opt,'dfS2')
  dfS2 = sqrt(p);
else
  dfS2 = opt.dfS2;
end

%% Sample the initial number of tiles from zero-truncated negative
%% binomial distribution with high variance and mode away from zero
%% This ensures that independent runs will start with different 
%% Voronoi configurations (If always start with one or two tiles, 
%% then the initial configurations would be very similar)
%T = rnegbin(1,opt.negBiR,opt.negBiP);
T = rnegbin(1,10,2/3);
%% Draw the Voronoi centers Scoord uniformly within the habitat
Scoord = runif_habitat(T,habitat);
%% Assign migration rates to the Voronoi tiles
rateS2 = rinvgam(opt.ratesC/2,opt.ratesD/2);
rateMu = opt.minRate+(opt.maxRate-opt.minRate)*rand(1);
% On the log scale, the tile rates are rateMu + Effcts
Effcts = init_effects(T,opt.absDiff,rateS2);
% The deviation of move proposals is scaled by the habitat range
coordS2 = opt.coordS2*[max(Vcoord(:,1))-min(Vcoord(:,1)),...
		       max(Vcoord(:,2))-min(Vcoord(:,2))];
Voronoi = struct('ntiles',{T},...
                 'Vcoord',{Vcoord},...
                 'Scoord',{Scoord},...
                 'Effcts',{Effcts},...
		 'habitat',{habitat});
params = struct('ratesC',{opt.ratesC},...
		'ratesD',{opt.ratesD},...
                's2locC',{opt.s2locC},...
		's2locD',{opt.s2locD},...
                'negBiR',{opt.negBiR},...
		'negBiP',{opt.negBiP},...
		'effctS2',{opt.effctS2},...
		'log10S2',{opt.log10S2},...
		'minRate',{opt.minRate},...
		'maxRate',{opt.maxRate},...
		'absDiff',{opt.absDiff},...
		'SmallWorld_s',{0.3},...
		'coordS2',{coordS2},...
		'rateMu',{rateMu},...
		'rateS2',{rateS2},...
		'dfS2',{dfS2});

if Sstruct.microsat
  params.df = p;
  params.dflob = p - 1;
  params.dfmin = p - 1;
  params.dfmax = p + 1;
  params.dfupb = p + 1;
else
  params.df = n;
  params.dflob = n - 1;
  params.dfmin = n - 1;
  params.dfmax = n + 1;
  params.dfupb = p;
end