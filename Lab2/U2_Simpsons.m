%OBS!

%Kör U2Log för att få komplett svar för hela fråga 2





format long
syms x;
clear resSimp errorSimp hs;
x = -2:0.1:2;
a = -1:0.1:1;
f = @(x) sqrt(x+2);
I = integral(f, -1, 1);

limits = [-1 1]; 
number = 10;
hs = [];

for a=0:1:number
    h = 1 ./ power(2,a);
    hs(a+1) = h; %Lista av alla h
    Ih = 0;
    itter = 0;
    even = 0; 
    odd = 0;
    for i=limits(1):h:limits(2)
        
        if(i == limits(1))
            Ih = Ih + f(i);
        end
        
        if(i == limits(2))
            Ih = Ih + f(i);
        end
        
        if(i > limits(1) && i < limits(2))
            if(mod(itter,2)==0) 
                even = even + f(i);
            else
                odd = odd + f(i);
            end
        end
        itter = itter + 1;
    end
    itter;
    Ih = (h./3) .* (Ih + 4 .* odd + 2 .* even);
    resSimp(a+1) = Ih;
    errorSimp(a+1) = abs(Ih-I);

end

for i=2:1:size(errorSimp')
   errorSimpFel(i-1)=errorSimp(i-1)/errorSimp(i);
   disp(errorSimpFel(i-1));
end


subplot(2,1,2);
loglog(hs, errorSimp, 'r*');
legend("SamTrap", "Simpson");

