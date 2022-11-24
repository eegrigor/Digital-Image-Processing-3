function responseCurve = estimateResponseCurve(imgStack , exposureTimes , smoothingLamda , weightingFcn)
n = 256;
Zmax = 255;
Zmin = 0;
    image = imgStack(1);
    %get sizes of the images 
    [height, width, ~] = size(cell2mat(image));
    ldrnumber = size(exposureTimes,2);
A = zeros(height*width*ldrnumber+n+1,n+height*width);
b = zeros(size(A,1),1);
x = 1;
y = 1;
%% Include the data−fitting equations
k = 1;
for i=1:height*width
    for j=1:ldrnumber
        [x,y] = ind2sub([height,width],i);
        wij = weights(imgStack{1,j}(x,y)+1,weightingFcn,exposureTimes(j));
        A(k,imgStack{1,j}(x,y)+1) = wij; A(k,n+i) = -wij; b(k,1) = wij *exposureTimes(j);
        k=k+1;
    end
end
%% Fix the curve by setting its middle value to 0
A(k,129) = 1;
k=k+1;
%% Include the smoothness equations
for i=1:n-2
 A(k,i)=smoothingLamda*weights(i+1,weightingFcn,0); A(k,i+1)=-2*smoothingLamda*weights(i+1,weightingFcn,0); A(k,i+2)=smoothingLamda*weights(i+1,weightingFcn,0);
 k=k+1;
end
%% Solve the system using SVD
x = A\b;
responseCurve = x(1:n);
%lE = x(n+1:size(x,1));
end