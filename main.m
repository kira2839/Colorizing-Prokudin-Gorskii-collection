
x = {"image1.jpg", "image2.jpg", "image3.jpg","image4.jpg","image5.jpg", "image6.jpg"};

y = {"image1color.jpg", "image2color.jpg", "image3color.jpg","image4color.jpg","image5color.jpg", "image6color.jpg"};

for a = 1:6

img = image_read(x{a});

[b g r] = divide(img);

#b(171, 200);

truecolor_image = cat(3, r, g, b);

imwrite(truecolor_image, y{a});


#figure, imshow(truecolor_image)


#figure, imshow(g)
#figure, imshow(r)



endfor
z = {"image1-ssd.jpg", "image2-ssd.jpg", "image3-ssd.jpg","image4-ssd.jpg","image5-ssd.jpg", "image6-ssd.jpg"};

u = {"image1-ncc.jpg", "image2-ncc.jpg", "image3-ncc.jpg","image4-ncc.jpg","image5-ncc.jpg", "image6-ncc.jpg"};


for a = 1:6
  
  img = image_read(x{a});
  
  [b g r] = divide(img);
  

point1 = im_align1(b,g,251);
point2 = im_align1(b,r,251);


disp_g =  [171 200] - point1

disp_r =  [171 200] - point2

 g_shift = circshift(g,floor(disp_g));
 r_shift = circshift(r,floor(disp_r));
 
 #figure, imshow(g_shift)
 #figure, imshow(r_shift)
 
align_image_ssd = cat(3,r_shift, g_shift,b);

imwrite (align_image_ssd, z{a});

figure, imshow(align_image_ssd)

endfor

for a = 1:6
  
  img = image_read(x{a});
  
  [b g r] = divide(img);
  

point1 = im_align2(b,g,185);
point2 = im_align2(b,r,185);


disp_g =  [171 200] - point1

disp_r =  [171 200] - point2

 g_shift = circshift(g,floor(disp_g));
 r_shift = circshift(r,floor(disp_r));
 
 #figure, imshow(g_shift)
 #figure, imshow(r_shift)
 
align_image_ssd = cat(3,r_shift, g_shift,b);

imwrite(align_image_ssd, u{a});

figure, imshow(align_image_ssd)

endfor

