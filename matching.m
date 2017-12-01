clc;clear;close all;
[templates, tempNum] = pic_sorting('template.jpg'); 

[unknowns, unknownNum] = pic_sorting('unknown.jpg'); 

for k = 1 :tempNum
    for i = 1 : unknownNum
        
        normx_corrmap{k,i}=normxcorr2(unknowns{i}(:,:,1),templates{k}(:,:,1));
        maxptx(k,i) = max(normx_corrmap{k,i}(:));
    end
    
end

[prob, I] = max(maxptx);

I = I - 1;

disp('Your number be: ');
disp(I);