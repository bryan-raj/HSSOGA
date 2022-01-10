function z = Michalewicz(x)
    dim = length(x);
    sum = 0;
    for i = 1:dim
        xi = x(i);
        new = sin(xi) * (sin(i*xi^2/pi))^(2*10);
        sum  = sum + new;
    end

    z = -sum;
end
