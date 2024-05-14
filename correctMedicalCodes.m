function dataRaw = correctMedcalCodes(filedataName,idx,N,type)

% filedataName- name of csv xls file
% N number of chars in the final code
% type =1 for corections to IC10, 0 otherwise

% example: dataTrain = correctMedcalCodes('training.csv',11,4,0)

   
    dataRaw=readtable(filedataName);

    %extract column
    diagCode=categorical(table2array(dataRaw(:,idx)));

    %convert IC9 to IC10
    if type==1 
        conversionArray=readtable(['IC10conversion', '.xls']);
        IC9=categorical(table2array(conversionArray(:,1)));
        IC10=categorical(table2array(conversionArray(:,2)));
        
        for i=1:size(conversionArray,1)
            vec= find(categorical(diagCode)==IC9(i));
            diagCode(vec)=IC10(i);
        end
    end

   %reduce codes to N chars
    % for i=1:numel(diagCode)
    %     aux=char(diagCode(i));
    %     if length(aux)>N
    %         aux=aux1(:N);
    %         thisName{1}=aux;
    %         diagCode(i)=categorical(thisName);
    %     end
    % end

    diagCode=num2cell(diagCode);
    aux= dataRaw.Properties.VariableNames{idx};
    a{1}=aux;
    diagCodeNew=table(diagCode,'VariableNames',a);
    
    dataRaw(:,idx)=diagCodeNew;
    writetable(dataRaw,['V2', filedataName]);

end