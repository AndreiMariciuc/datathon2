function dataTable = correctColWithZip(idxZip, idxCol, dataTable) 
%Params: idxZip - indicele coloanei zip3, 
%        idxCol - indicele coloanei de modificat, 
%	 dataTable - tabela cu datele necesare

     elemCol = dataTable{:, idxCol};	
     elemZip = dataTable{:, idxZip};


    while sum(ismissing(elemCol))~=0
        poz = ismissing(elemCol); %vector logic cu semnificatia: 1 - valoare lipsa, 0 - ok
        index = find(poz,1);	%prima pozitie in care gaseste 1 in vect de mai sus
        

% pentru cazul in care vCol este 0, adica pentru acel cod zip3 toate campurile din care putem extrage date sunt lipsa
        if sum(elemZip == elemZip(index) & elemCol ~= "") ~=0
            vCol = elemCol((elemZip == elemZip(index) & elemCol ~= ""));
        else
            vCol = {'-'};
        end
	%		^vector logic cu pozitiile in care se afla codZip si elemCol nu are valoare lipsa
	% in vCol vor fi asadar valorile de pe pozitiile indicate in vect logic si teoretic ar trebui ca toate sa fie aceleasi

        elem = vCol(1); %luam un element si il inseram pe pozitia corespunzatoare in coloana de modificat
        elemCol(index) = elem;
    end
    dataTable{:,idxCol} = elemCol;	
end