function [b g r] = divide(image)

[m,n] = size(image);

b = image(1:(m/3), :);

g = image((m/3)+1:2*(m/3), :);

r = image((2*m/3)+1:m, :);

#figure,imshow(b);

#figure,imshow(g);

#figure,imshow(r);

endfunction  