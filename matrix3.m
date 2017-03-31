clear
clc

G.AdjMatrix = [
    0 0 1 0 0;
    0 0 0 1 0;
    1 0 0 1 1;
    0 1 1 0 0;
    0 0 1 0 0;
];

H.AdjMatrix = [
    0 1 0 0;
    1 0 0 1;
    0 0 0 1;
    0 1 1 0;
];
nizG = sum(G.AdjMatrix);
nizH = sum(H.AdjMatrix);

maxG = max(nizG);
maxH = max(nizH);

if maxH> maxG
    return;
end
b=0;

kombinacije = pick(1:length(G.AdjMatrix), length(H.AdjMatrix),'o');
[brV, brK] = size(kombinacije);
for i = 1: brV
    for j = 1 : brK
        if(nizG(kombinacije(i,j))>=nizH(j))
            b=b+1;
        end
    end
    if (b==brK) && (all(all((G.AdjMatrix(kombinacije(i, :),kombinacije(i, :)) == H.AdjMatrix)))==1)
        disp('Izomorfizam'); 
    end
    b=0;
end

        
                    