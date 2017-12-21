function [em_no] = getEmotionNumber(emotion)
em_no = -1;
if(strcmp(emotion,'anger'))
    em_no = 1;
elseif(strcmp(emotion,'disgust'))
    em_no = 2;
elseif(strcmp(emotion,'fear'))
    em_no = 3;
elseif(strcmp(emotion,'happiness'))
    em_no = 4;
elseif(strcmp(emotion,'neutral'))
    em_no = 5;
elseif(strcmp(emotion,'sadness'))
    em_no = 6;
elseif(strcmp(emotion,'surprise'))
    em_no = 7;
end
end