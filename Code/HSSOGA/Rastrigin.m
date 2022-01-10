% Rastrigin 

function z=Rastrigin(x)
    dim =length(x);
    z=sum(x.^2-10*cos(2*pi.*x))+10*dim;

end