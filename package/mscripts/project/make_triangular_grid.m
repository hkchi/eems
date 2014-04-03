

function [Vcoord,Vedges,Mij] = make_triangular_grid(datapath,xPop,yPop)
%% Construct three data structures that describe the triangular grid        %%
%% Vcoord: list of vertices (one vertex per row, with x- and y-coordinates) %%
%% Vedges: list of neighbors (one vertex per row, at most six neighbors)    %%
%% Mij: pairs of connected vertices (one edge per row)                      %%


dimns = dlmread(strcat(datapath,'.dimns'));
minxco = dimns(1,1);
maxxco = dimns(1,2);
minyco = dimns(2,1);
maxyco = dimns(2,2);

nPop   = xPop*yPop;        %% n_{alpha,alpha} %%
nPairs = nPop*(nPop-1)/2;  %% n_{alpha,beta}  %%
nEdges = (xPop-1)*yPop+(2*xPop-1)*(yPop-1);

%% A triangular grid extends half a triangle on the right %%
scalex = 1;
scaley = 1;
if ( (minxco<maxxco) && (xPop>1) ) 
  scalex = (maxxco-minxco)/(xPop-0.5);
end
if ( (minyco<maxyco) && (yPop>1) ) 
  scaley = (maxyco-minyco)/(yPop-1);
end

Vcoord = zeros(nPop,2);
Vedges = zeros(nPop,6);    %% 0 means that there is no neighbor in the  %%
Mij = zeros(2*nEdges,2);   %% corresponding position                    %%
e = 0;

for r = 1:yPop
for c = 1:xPop
  alpha = (r-1)*xPop+c;
  Vcoord(alpha,1) = minxco+scalex*(c-1+0.5*mod(r-1,2));
  Vcoord(alpha,2) = minyco+scaley*(r-1);
  for pos = 1:6
    beta = fixed_neighbor(r,c,pos,xPop,yPop);
    Vedges(alpha,pos) = beta;
    if (beta>0)
      e = e+1;
      Mij(e,1) = alpha;
      Mij(e,2) = beta;
    end
  end
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function beta = fixed_neighbor(r,c,pos,xPop,yPop)
%% In a triangular grid, a vertex has (at most) %%
%% six neighbors. This function returns the     %%
%% indices of the neighbors.                    %%

% It is simpler to suppose indices start from 0
r = r-1;
c = c-1;
alpha = r*xPop+c;
beta = -1;

if     ( (pos==1) && (mod(alpha,xPop)>0) )
  beta = alpha-1;
elseif ( (pos==2) && (r<(yPop-1) && mod(alpha  ,2*xPop)>0) )
  beta = xPop*(r+1)+c-mod(r+1,2);
elseif ( (pos==3) && (r<(yPop-1) && mod(alpha+1,2*xPop)>0) )
  beta = xPop*(r+1)+c+1-mod(r+1,2);
elseif ( (pos==4) && (mod(alpha+1,xPop)>0) )
  beta = alpha+1; 
elseif ( (pos==5) && (r>0 && mod(alpha+1,2*xPop)>0) )
  beta = xPop*(r-1)+c+1-mod(r+1,2);
elseif ( (pos==6) && (r>0 && mod(alpha  ,2*xPop)>0) )
  beta = xPop*(r-1)+c-  mod(r+1,2);
end

% In MATLAB indices start from 1
alpha = alpha+1;
beta = beta+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%