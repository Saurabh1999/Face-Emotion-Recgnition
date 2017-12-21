function emotion  = predictor(image,trained)
feature = extract_feature_vector(image,1);
mark = [];
l = [];
for i = 1:7;
[label,score] = predict(trained(i).ClassificationSVM,feature);
l = [l;label];
mark = [mark;score];
end
[result,resultind] = max(mark(:,2));
display(mark)
display(l)
if(resultind == 1)
    emotion = 'anger';
elseif(resultind == 2)
    emotion = 'disgust';
elseif(resultind == 3)
    emotion = 'fear';
elseif(resultind == 4)
    emotion = 'happiness';
elseif(resultind == 5)
    emotion = 'neutral';
elseif(resultind == 6)
    emotion = 'sadness';
else
    emotion = 'surprise';
end
disp(emotion)
disp(resultind)
end
