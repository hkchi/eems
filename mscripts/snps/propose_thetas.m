

function [proposal,pi1_pi0] = propose_thetas(Sstruct,kernel,params,schedule)

%%%%%%%%%%
type = 1;%
%%%%%%%%%%

thetai = schedule.paramtoupdate{type};
proposal.params = params;
proposal.type = type;
proposal.subtype = thetai;

n = Sstruct.nIndiv;
df = params.df;

if (thetai==1)
  trDinvQxD = params.trDinvQxD;
  c = params.s2locC + df*(n-1);
  d = params.s2locD + df*trDinvQxD;
  s2loc = rinvgam(c/2,d/2);
  proposal.params.s2loc = s2loc;
  % This guarantees that the proposal is always accepted
  % i.e., a Gibbs update
  pi1_pi0 = Inf;
elseif (thetai==2)
  df = draw_df(params.dfmin,params.dfmax,params.df,params.dfS2);
  if (df>params.dfmin && df<params.dfmax)
    % This corresponds to pi(df)\propto(1/df)
    pi1_pi0 = log(params.df)-log(df);
  else
    pi1_pi0 = -Inf;
  end
  proposal.params.df = df;
end