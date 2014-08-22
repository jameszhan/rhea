require 'rmagick'

p Magick::Image.read("/Users/James/Downloads/test.gif").count


Magick::Image.read("/Users/James/Downloads/test1.jpg").each do|img|
  puts img.methods.sort
  resize_to_fill = img.resize_to_fill(100, 100)
  resize_to_fill.write("test1_resize_to_fill.jpg")
  resize_to_fit = img.resize_to_fit(100, 100)
  resize_to_fit.write("test1_resize_to_fit.jpg")
  scale = img.scale(100, 100)
  scale.write("test1_scale.jpg")
end
Magick::Image.read("/Users/James/Downloads/test2.jpg").each do|img|
  resize_to_fill = img.resize_to_fill(100, 100)
  resize_to_fill.write("test2_resize_to_fill.jpg")
  resize_to_fit = img.resize_to_fit(100, 100)
  resize_to_fit.write("test2_resize_to_fit.jpg")
  scale = img.scale(100, 100)
  scale.write("test2_scale.jpg")
end

