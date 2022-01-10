%HSSOGA source code

clear all;
clc;

N = 30;                        % Size of the swarm " no of objects "
Max_Iteration  = 1000;              % Maximum number of "iterations"

Benchmark_Function_ID=17 %Benchmark function ID

[sgBestScore,sgBest,GlobalBestCost]= TestHSSOGA(Benchmark_Function_ID, N, Max_Iteration)

sgBest;
sgBestScore;
semilogy(GlobalBestCost,'-r');
title(['\fontsize{12}\bf Benchmark Function: F',num2str(Benchmark_Function_ID)]);
xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Fitness(Best-so-far)');
%legend('\fontsize{10}\bf HSSOGSA',1);