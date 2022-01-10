% Griewank

function z = Griewank(x)
    dim = length(x);
    z=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

