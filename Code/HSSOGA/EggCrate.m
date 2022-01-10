%EggCrate

function z = EggCrate(x)
    z = x(1)^2 + x(2)^2 + 25*(sin(x(1).^2) + cos(x(2).^2));

end

