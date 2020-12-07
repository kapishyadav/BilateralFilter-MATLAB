function newImg = BilateralFilter(img)
for i = 2 : size(img, 1) - 1
  for j = 2 : size(img, 2) - 1
      for k = 1:3
        k1 = i - 1; 
        k2 = i + 1;
        l1 = j - 1; 
        l2 = j + 1;
        sigmad = 2; 
        sigmar = 60;
        s1 = exp(-(((i - k1)^2 + (j - l1)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k1,l1,k)^2)/(2 * sigmar^2)));
        s2 = exp(-(((i - k1)^2 + (j - j)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k1,j,k)^2)/(2 * sigmar^2)));
        s3 = exp(-(((i - k1)^2 + (j - l2)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k1,l2,k)^2)/(2 * sigmar^2)));
        s4 = exp(-(((i - i)^2 + (j - l1)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(i,l1,k)^2)/(2 * sigmar^2)));
        s5 = exp(-(((i - i)^2 + (j - l2)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(i,l2,k)^2)/(2 * sigmar^2)));
        s6 = exp(-(((i - k2)^2 + (j - l1)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k2,l1,k)^2)/(2 * sigmar^2)));
        s7 = exp(-(((i - k2)^2 + (j - j)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k2,j,k)^2)/(2 * sigmar^2)));
        s8 = exp(-(((i - k2)^2 + (j - l2)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k2,l2,k)^2)/(2 * sigmar^2)));
        Is1 = img(k1,l1,k) * exp(-(((i - k1)^2 + (j - l1)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k1,l1,k)^2)/(2 * sigmar^2)));
        Is2 = img(k1,j,k) * exp(-(((i - k1)^2 + (j - j)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k1,j,k)^2)/(2 * sigmar^2)));
        Is3 = img(k1,l2,k) * exp(-(((i - k1)^2 + (j - l2)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k1,l2,k)^2)/(2 * sigmar^2)));
        Is4 = img(i,l1,k) * exp(-(((i - i)^2 + (j - l1)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(i,l1,k)^2)/(2 * sigmar^2)));
        Is5 = img(i,l2,k) * exp(-(((i - i)^2 + (j - l2)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(i,l2,k)^2)/(2 * sigmar^2)));
        Is6 = img(k2,l1,k) * exp(-(((i - k2)^2 + (j - l1)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k2,l1,k)^2)/(2 * sigmar^2)));
        Is7 = img(k2,j,k) * exp(-(((i - k2)^2 + (j - j)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k2,j,k)^2)/(2 * sigmar^2)));
        Is8 = img(k2,l2,k) * exp(-(((i - k2)^2 + (j - l2)^2)/(2 * sigmad^2)) - ((img(i,j,k)^2 - img(k2,l2,k)^2)/(2 * sigmar^2)));
        
        SumIs = Is1 + Is2 + Is3 + Is4 + Is5 + Is6 + Is7 + Is8;
        Sums = s1 + s2 + s3 + s4 + s5 + s6 + s7 + s8;
        
        newImg(i,j,k) = SumIs/Sums;
        
        end
   end
end
end

