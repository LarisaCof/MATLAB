load minidigits.mat
format long g
xaxis = [];
yaxis = [];
yaxis2 = [];




ratio = [];
for k=0:0.1:10
    xaxis = [xaxis k];
    
    ccCounter = 0;
    cfCounter = 0;
    ffCounter = 0;
    fcCounter = 0;
    
    for j = 1:1:1000
        b = C'*testdata(:,j);
        x = A\b;
        nv(j) = norm(C*x-testdata(:,j)); %Calculations
        if(nv(j) < k)%Vi tror att det �r en tv�a!
            if testdatad(j) == 2
                ccCounter = ccCounter + 1;
            else
                cfCounter = cfCounter + 1;
            end
        else %Vi tror inte att det �r en tv�a
            if testdatad(j) == 2
                fcCounter = fcCounter + 1;
            else
                ffCounter = ffCounter + 1;
            end
            
        end
    end
    yaxis = [yaxis (ccCounter./101 .* ffCounter./899)];
    %yaxis2 = [yaxis2 (cfCounter./899 .* fcCounter./101)];
    %disp([ccCounter/101 (cfCounter/899) ffCounter/899 (fcCounter/101)]);
    
end
%x = 5.1 --> b�sta threshold
max(yaxis)
plot(xaxis, yaxis, 'b');
hold on;
%plot(xaxis, yaxis2, 'r');
hold off;
legend("Ratio");
title("Best estimation of k (ccCounter * ffCounter)");
ylabel("Score");
xlabel("Threshold value (k)");
