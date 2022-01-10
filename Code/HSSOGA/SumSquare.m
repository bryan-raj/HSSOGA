%SumSquare

function z = SumSquare(x)
    dim = length(x);
    sum = 0;
    for i = 1:dim
        sum = sum + (i*(x(i))^2);
    end
    z = sum;
end

