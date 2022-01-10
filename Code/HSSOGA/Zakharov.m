% Zakharov

function z = Zakharov(x)
    dim = length(x);
    z = sum (x.^2)+ (sum(0.5*[1:dim].*x))^2 + (sum(0.5*[1:dim].*x))^4 ;
end

