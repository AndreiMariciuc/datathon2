clc; clear all;

train = readtable('V2train.csv');
test = readtable('V2test.csv');

pozS = find(contains(train.Properties.VariableNames,'patient_state')); %preia indecele coloanei din tabela ce contine numele dorit
pozZ = find(contains(train.Properties.VariableNames,'patient_zip3'));  %pentru a generaliza si a nu cauta in fiecare caz indicii
pozR = find(contains(train.Properties.VariableNames,'Region'));	       %se poate folosi in orice caz daca este cunoscut numele coloanei	
pozD = find(contains(train.Properties.VariableNames,'Division'));


pozVec = [pozS, pozR, pozD];

train = correctAllColWithZip(pozZ, pozVec, train);
test = correctAllColWithZip(pozZ, pozVec, test);

verS = sum(ismissing(train.patient_state));	%trebuie sa fie 0
verR = sum(ismissing(train.region));
verD = sum(ismissing(train.division));

verSt = sum(ismissing(test.patient_state));	%verifica numarul de elemente missing din coloana
verRt = sum(ismissing(test.region));        %trebuie sa fie 0
verDt = sum(ismissing(test.division));


if verS==0 && verD == 0 && verR == 0
    writetable(train,'train_corr.csv');
end

if verSt==0 && verDt == 0 && verRt == 0
    writetable(test,'test_corr.csv');
end

