function [Image] = get_emotion_image(emotion)

if(strcmp(emotion,'anger'))
    Image = imread('emojis\anger.jpg');
elseif(strcmp(emotion,'disgust'))
   Image = imread('emojis\disgust.jpg');
elseif(strcmp(emotion,'fear'))
   Image = imread('emojis\fear.jpg');
elseif(strcmp(emotion,'happiness'))
    Image = imread('emojis\happiness.jpg');
elseif(strcmp(emotion,'neutral'))
    Image = imread('emojis\neutral.jpg');
elseif(strcmp(emotion,'sadness'))
    Image = imread('emojis\sadness.jpg');
elseif(strcmp(emotion,'surprise'))
    Image = imread('emojis\surprise.jpg');
end