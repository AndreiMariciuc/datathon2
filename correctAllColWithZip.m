function dataTable = correctAllColWithZip(idxZip, vecCol,dataTable)
%Parametrii: idxZip - indicele coloanei Zip3
%            vecCol - vector cu indicele la fiecare coloana pe care o putem
%            modifica cu ajutorul la Zip3
%            dataTable - tabloul de unde ne luam informatiile

    idxCol=1;
    while idxCol<=length(vecCol)
        dataTable=correctColWithZip(idxZip,vecCol(idxCol),dataTable);
        idxCol=idxCol+1;
    end
    
end
