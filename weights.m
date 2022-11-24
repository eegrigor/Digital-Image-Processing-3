function w = weights(Z,weightingFcn,exposureTime)
    Zmin = 0.01;
    Zmax = 0.99;
    z = double(Z)/double(255);
    if weightingFcn == "uniform"

            if z <= Zmax && z >= Zmin 
                w = 1;
            else
                w = 0;
            end
    elseif  weightingFcn == "tent"

            if z <= Zmax && z >= Zmin 
                w = min(z,1-z);
            else
                w = 0;
            end
    elseif weightingFcn == "Gaussian"
            if z <= Zmax && z >= Zmin 
                w = exp(-4*(((z - 0.5)^2)/0.5^2));
            else
                w = 0;
            end
    elseif weightingFcn == "photon"
            if z <= Zmax && z >= Zmin 
                w = exposureTime;
            else
                w = 0;
            end
    end
end