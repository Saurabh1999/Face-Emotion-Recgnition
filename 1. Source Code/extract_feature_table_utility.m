function [all_feature] = extract_feature_table_utility(value)
path = 'dataset';
emotions_dir = dir(path);
len_emotions_dir = length(emotions_dir);
all_feature = [];
count = 0;
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
            current_path = strcat(ppath,'\',current_dir_2(k).name);
            disp(strcat('extracting feature for em = ',sprintf('%d',value)))
            disp(current_path)
            disp(count)
            
            I = imread(current_path);
            
            current_feature = extract_feature_vector(I,1);
            emotion = emotions_dir(i).name;
            x = 0;
            if(strcmp(emotion,'anger') && value == 1)
                x = 1;
            elseif(strcmp(emotion,'disgust') && value == 2)
                x = 1;
            elseif(strcmp(emotion,'fear') && value == 3)
                x = 1;
            elseif(strcmp(emotion,'happiness') && value == 4)
                x = 1;
            elseif(strcmp(emotion,'neutral') && value == 5)
                x = 1;
            elseif(strcmp(emotion,'sad') && value == 6)
                x = 1;
            elseif(strcmp(emotion,'surprise') && value == 7)
                x = 1;
            end
            
            current_feature = [current_feature x];
            all_feature = [all_feature;current_feature];
            
           
            
        end
        
    end
   
end
save(strcat('all_feature_',sprintf('%d',value),'.mat'),'all_feature');
end

