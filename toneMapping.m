function tonedImage = toneMapping(radianceMap , gamma)

    [height, width, ~] = size(radianceMap);
    tonedImage = zeros(height,width,"uint8");
    
    for i = 1:height
        for j = 1:width
            tonedImage(i,j) = 255 * (radianceMap(i,j)/double(255))^gamma ;
        end
    end
    
end