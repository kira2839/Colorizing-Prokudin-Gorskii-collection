function [point] = im_align1(b,g,t)

a = size(g);

x = floor(a(1)/2);

y = a(2)/2;


increment = 0;


template = b(x-floor(t/2):x+floor(t/2), y-floor(t/2):y+floor(t/2));

interm = double(template) - double(g(x-floor(t/2):x+floor(t/2), y-floor(t/2):y+floor(t/2)));

minimum = sum(interm(:).^2);

%b(x-1:x+1, y-1:y+1)
%g(x-1:x+1, y-16:y-14)

for count = 0:30

   for row = 0:30
      c = g(floor(row+x-15-floor(t/2)):floor(row+x-15+floor(t/2)), floor(count+y-15-floor(t/2)):floor(count+y-15+floor(t/2)));

      diff = double(template) - double(c);
      ssd  = sum(diff(:).^2);
  
  
  
       if (ssd <= minimum)
        minimum = ssd;
        point = [row+x-15,count+y-15];
       endif
   endfor
endfor
printf("The point in second image with max match is")
disp(point)

endfunction