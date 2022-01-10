% Ackley

function z = Ackley(x)

    dim = length(x);
    
    z=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
    
end

