G.AdjMatrix = [
    0 1 1 0 1;
    1 0 0 1 0;
    1 0 0 0 0;
    0 1 0 0 0;
    1 0 0 0 0;
];

H.AdjMatrix = [
    0 1 1;
    1 0 0;
    1 0 0;
];
br = 0;
nizG = [];
for i=1:length(G.AdjMatrix)
    for j= 1: length(G.AdjMatrix)
        if G.AdjMatrix(i, j) == 1
            br = br+1;
        end
    end
    nizG = [nizG br];
    br = 0;
    
end

nizH = [];
for i=1:length(H.AdjMatrix)
    for j= 1: length(H.AdjMatrix)
        if H.AdjMatrix(i, j) == 1
            br = br+1;
        end
    end
    nizH = [nizH br];
    br = 0;
    
end

maxG = max(nizG);
maxH = max(nizH);

if maxH> maxG
    return;
end
b=0;

kombinacije = combntns(1:length(G.AdjMatrix), length(H.AdjMatrix));
[brV, brK] = size(kombinacije);
for i = 1: brV
    for j = 1 : brK
        if(nizG(kombinacije(i,j))>=nizH(j))
            b=b+1;
        end
    end
    if(b==brK) disp('Izomorfizam'); break; end
    b=0;
end

        
                    