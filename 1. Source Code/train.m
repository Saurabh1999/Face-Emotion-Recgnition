function [trainedClassifierVector] = train()
trainedClassifierVector = [];
for emotion = 1:7;
    disp('training for emotion : ' + emotion)
    feature_table = extract_feature_table_utility(emotion);
    if(emotion == 1)
        [trainedClassifierForAnger,acc] = trainClassifierForAnger(feature_table);
        trainedClassifierVector = [trainedClassifierVector;trainedClassifierForAnger];
    end
    if(emotion == 2)
        [trainedClassifierForDisgust,acc] = trainClassifierForDisgust(feature_table);
        trainedClassifierVector = [trainedClassifierVector;trainedClassifierForDisgust];
    end
    if(emotion == 3)
        [trainedClassifierForFear,acc] = trainClassifierForFear(feature_table);
        trainedClassifierVector = [trainedClassifierVector;trainedClassifierForFear];
    end
    if(emotion == 5)
        [trainedClassifierForNeutral,acc] = trainClassifierForNeutral(feature_table);
        trainedClassifierVector = [trainedClassifierVector;trainedClassifierForNeutral];
    end
    if(emotion == 4)
        [trainedClassifierForHappy,acc] = trainClassifierForHappy(feature_table);
        trainedClassifierVector = [trainedClassifierVector;trainedClassifierForHappy];
    end
    if(emotion == 6)
        [trainedClassifierForSad,acc] = trainClassifierForSad(feature_table);
        trainedClassifierVector = [trainedClassifierVector;trainedClassifierForSad];
    end
    if(emotion == 7)
        [trainedClassifierForSurprise,acc] = trainClassifierForSurprise(feature_table);
        trainedClassifierVector = [trainedClassifierVector;trainedClassifierForSurprise];
    end
end
