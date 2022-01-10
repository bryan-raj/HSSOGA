% HSSOGA built by Bryan Raj



function [sgBestScore,sgBest,GlobalBestCost]=Test(Benchmark_Function_ID,n,iteration)

[low,up,dim]=benchmark_functions_details(Benchmark_Function_ID);%define the boundary and dimension of the benchmark function

%% Parameters listings:
%GA
%----------------
pc = 0.7;                 % Crossover Percentage
nc = 2*round(pc*n/2);     % Number of Offsprings (also Parnets)
gamma = 0.4;              % Extra Range Factor for Crossover
pm = 0.3;                 % Mutation Percentage
nm = round(pm*n);         % Number of Mutants
mu = 0.1;                 % Mutation Rate

%% Initialization
current_fitness =zeros(n,1);
sgBest=zeros(1,dim);
sgBestScore=inf;

swarm=zeros(n,3); % to swarm

sBestScore=inf(1,n);
sBest=zeros(n,dim);
sgbest=zeros(n,dim);



Boundary_no = size(up',2);

if Boundary_no==1
    current_position = rand(n,dim).*(up-low)+low; %initial positions in the problem's boundary
end

% If each variable has a different up and low
if Boundary_no>1
    for i=1:dim
        up_i=up(i,1);
        low_i=low(i,1);
       current_position(:,i)=rand(n,1).*(up_i-low_i)+low_i; %initial positions in the problem's boundary
    end
end

velocity = .3*randn(n,dim) ;

%% MAIN LOOP

iter = 0 ;                  % Iterations’ counter
while  ( iter < iteration )
    
    iter = iter + 1;
    iter;

    for i = 1:n                    

        Flag4up=current_position(i,:)>up';
        Flag4low=current_position(i,:)<low';
        current_position(i,:)=(current_position(i,:).*(~(Flag4up+Flag4low)))+up'.*Flag4up+low'.*Flag4low; 

        fitness=benchmark_functions(current_position(i,:),Benchmark_Function_ID,dim);
        current_fitness(i)=fitness;    

        if(sBestScore(i)>fitness)
            sBestScore(i)=fitness;
            sBest(i,:)=current_fitness(i,:);
        end
        if(sgBestScore>fitness)
            sgBestScore=fitness;
            sgBest=current_position(i,:);
        end

    end
    best=min(current_fitness);
    worst=max(current_fitness);

    GlobalBestCost(iter)=sgBestScore;
    GlobalBestCost(iter);
    best;

    for pp=1:n
        if current_fitness(pp)==best
            break;
        end
        
    end
    
    bestIndex=pp;
            
    for pp=1:dim
        best_fit_position(iter,1)=best;
        best_fit_position(iter,pp+1)=current_position(bestIndex,pp);   
    end
    
    %Selection
    P = exp(-beta*sBest/worst);
    P = P/sum(P);
        
    %Select Parents Indices
    for k = 1:nc/2
        i1 = RouletteWheelSelection(P);
        i2 = RouletteWheelSelection(P);
        % Select Parents
        p1 = pop(i1);
        p2 = pop(i2);
    end

end
end