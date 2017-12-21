trainedClassifier = load('trained_classifier.mat');
trainedClassifierVector = trainedClassifier.trainedClassifierVector;
path = 'dataset';
emotions_dir = dir(path);
len_emotions_dir = length(emotions_dir);
correct = 0;
count = 0;
predict_vector = [];
orig_vector = [];
for i = 3:len_emotions_dir;
    current_path = strcat(path,'\',emotions_dir(i).name);
    current_dir_1 = dir(current_path);
    prepath = current_path;
    len_current_dir_1 = length(current_dir_1);
    
    
    for j = 3:len_current_dir_1;
        
        current_path = strcat(prepath,'\',current_dir_1(j).name);
        
        current_dir_2 = dir(strcat(current_path,'\*.jpg'));
        len_current_dir_2 = length(current_dir_2);
        ppath = current_path;
        for k = 1:len_current_dir_2;
            count = count + 1;
            disp('Running for image :')
            disp(count)

            current_path = strcat(ppath,'\',current_dir_2(k).name);
        
            disp(current_path)
            disp(count)
            
            I = imread(current_path);
            
            detected_emotion = predictor(I,trainedClassifierVector);
            emotion = emotions_dir(i).name;
            de = cellstr(detected_emotion);
            em = cellstr(emotion);
            predict_vector = [predict_vector getEmotionNumber(detected_emotion)];
            orig_vector = [orig_vector getEmotionNumber(emotion)];
            
        
            if(strcmp(detected_emotion,emotion))
                correct = correct + 1;
                disp('correct till now')
                disp(correct)
            end
            
        
            
           
            
        end
        
    end
   
end
targets = zeros(7,232);
outputs = zeros(7,232);
targetsIdx = sub2ind(size(targe ts),orig_vector , 1:232);
outputsIdx = sub2ind(size(outputs), predict_vector, 1:232);
targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;

plotconfusion(targets,outputs);

h = gca;
h.XTickLabel = {'Anger','Disgust','Fear','Happy','Neutral','Sad','Surprise',''};
h.YTickLabel = {'Anger','Disgust','Fear','Happy','Neutral','Sad','Surprise',''};
h.YTickLabelRotation = 90;