% Zakharov

function z = Schwefel(x)
    d = length(x);
    sum = 0;
    for i = 1:d
        xi = x(i);
        sum = sum + xi*sin(sqrt(abs(xi)));
    end

    z = 418.9829*d - sum;
end

