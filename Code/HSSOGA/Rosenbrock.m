% Rosenbrock

function z=Rosenbrock(x)
    dim =length(x);
    z = sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);

end