function radianceMap = mergeLDRStack(imgStack , exposureTimes , weightingFcn)
    
    image = imgStack(1);
    %get sizes of the images 
    [height, width, ~] = size(cell2mat(image));
    Zmin = 0.01;
    Zmax = 0.99;
    ldrnumber = size(exposureTimes,2);
    
    radianceMap = zeros(height , width);
    
    if weightingFcn == "uniform"
        for i = 1:height
            for j = 1:width
                w = 0;
                for k = 1:ldrnumber
                    z = double(imgStack{1,k}(i,j))/double(255);
                    if z <= Zmax && z >= Zmin
                        %because f(x) = x 
                        radianceMap(i,j) = radianceMap(i,j) + (imgStack{1,k}(i,j) - log(exposureTimes(k)));
                        w = w + 1;
                    end
                end
                radianceMap(i,j) = radianceMap(i,j)/w;
            end
        end
    end
    
    if weightingFcn == "tent"
        for i = 1:height
            for j = 1:width
                w = 0;
                for k = 1:ldrnumber
                    z = double(imgStack{1,k}(i,j))/double(255);
                    if z <= Zmax && z >= Zmin
                        %because f(x) = x 
                        radianceMap(i,j) = radianceMap(i,j) + min(z,1-z)*(imgStack{1,k}(i,j) - log(exposureTimes(k)));
                        w = w + min(z,1-z);
                    end
                end
                radianceMap(i,j) = radianceMap(i,j)/w;
            end
        end
    end

    if weightingFcn == "Gaussian"
        for i = 1:height
            for j = 1:width
                w = 0;
                for k = 1:ldrnumber
                    z = double(imgStack{1,k}(i,j))/double(255);
                    if z <= Zmax && z >= Zmin
                        %because f(x) = x 
                        radianceMap(i,j) = radianceMap(i,j) + exp(-4*(((z - 0.5)^2)/0.5^2))*(imgStack{1,k}(i,j) - log(exposureTimes(k)));
                        w = w + exp(-4*(((z - 0.5)^2)/0.5^2));
                    end
                end
                radianceMap(i,j) = radianceMap(i,j)/w;
            end
        end
    end
    
    if weightingFcn == "photon"
        for i = 1:height
            for j = 1:width
                w = 0;
                for k = 1:ldrnumber
                    z = double(imgStack{1,k}(i,j))/double(255);
                    if z <= Zmax && z >= Zmin
                        %because f(x) = x 
                        radianceMap(i,j) = radianceMap(i,j) + exposureTimes(k)*(imgStack{1,k}(i,j) - log(exposureTimes(k)));
                        w = w + exposureTimes(k);
                    end
                end
                radianceMap(i,j) = radianceMap(i,j)/w;
            end
        end
    end
    

end