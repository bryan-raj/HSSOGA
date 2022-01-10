%HSSOGA source code

                              %-------------------------------------------%
                              %         Evaluate the population           %           
                              %-------------------------------------------%                                 %--%
 %%% Variables %%%

%current_position:  Position of sperms
%velocity:          Velocity
%dim:               Dimension of test functions
%n:                 Number of sperms
%low:               The lower bound of the search space
%up:                The higher bound of the search space

% -------------------To be removed---------------
%G0                 Gravitational constant
%force:             The gravitational force 
%acceleration:      Acceleration
%mass:              Mass 
% -----------------------------------------------

% pc =              Crossover Percentage
% nc =              Number of Offsprings (also Parents)
% gamma =           Extra Range Factor for Crossover
% pm =              Mutation Percentage
% nm =              Number of Mutants
% mu =              Mutation Rate



function [sgBestScore,sgBest,GlobalBestCost]=TestHSSOGA(Benchmark_Function_ID,n,iteration)

[low,up,dim]=benchmark_functions_details(Benchmark_Function_ID);%define the boundary and dimension of the benchmark function

MaxIt = iteration; 
nPop = n;
pc = 0.7;                   % Crossover Percentage
nc = 2*round(pc*n/2);       % Number of Offsprings (also Parents)
gamma = 0.4;                % Extra Range Factor for Crossover
pm = 0.3;                   % Mutation Percentage
nm = round(pm*n);           % Number of Mutants
mu = 0.1;                   % Mutation Rate

current_fitness =zeros(n,1);
sgBest=zeros(1,dim);
sgBestScore=inf;

for i=1:n
        sBestScore(i)=inf;
end
        sBest=zeros(n,dim);

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


%%main loop
iter = 0 ;                  % Iterations’ counter
while  ( iter < iteration )

iter = iter + 1;
iter;

for i = 1:n
    fitness=0;
    %///Bound the search Space///
    %Tp=current_position(i,:)>up;Tm=current_position(i,:)<low;current_position(i,:)=(current_position(i,:).*(~(Tp+Tm)))+up.*Tp+low.*Tm;                     
    
    Flag4up=current_position(i,:)>up';
    Flag4low=current_position(i,:)<low';
    current_position(i,:)=(current_position(i,:).*(~(Flag4up+Flag4low)))+up'.*Flag4up+low'.*Flag4low; 
    %////////////////////////////
    
                                 %-------------------------------------------%
                                 %         Evaluate the population           %           
                                 %-------------------------------------------%      
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
                                               %--------------------------%
                                               %  Crossover and Mutation  %
                                               %--------------------------%
                                               
    for it = 1:n
       P = exp(-8*sBest/worst);
       P = P/sum(P); 
       
        % Crossover
        for k = 1:nc/2
            i1 = RouletteWheelSelection(P);
            i2 = RouletteWheelSelection(P);
        end
    end
    
                                               %--------------------------%
                                               %   Velocity   UPDATE      %
                                               %--------------------------%
    
       
for i=1:n 
        for j=1:dim
            %Equation(9)
          
                 velocity(i,j)=rand()*(log10((7-14)*rand(1,1)+7))*velocity(i,j)+(log10((7-14)*rand(1,1)+7))* (log10((35.5-38.5)*rand(1,1)+35.5))*(swarm(i,3)-current_position(i,j))...
                +(log10((7-14)*rand(1,1)+7))* (log10((35.5-38.5)*rand(1,1)+35.5))*(sgBest(j)-current_position(i,j));
        end
end
                                               %--------------------------%
                                               %   Position   UPDATE     %
                                               %--------------------------%
                                                        
%Equation (10) 
current_position = current_position + velocity ;
 
end
end
end


