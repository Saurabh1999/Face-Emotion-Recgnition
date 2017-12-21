function [cropped] = detect_face(I)
FDetect = vision.CascadeObjectDetector;

BB = step(FDetect,I);
display(BB);
cropped = imcrop(I,BB);
I = imresize(I,[480,480]);

end