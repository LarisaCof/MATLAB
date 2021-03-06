clc
clear b;
format long;
maxIt = 50;
tolerance = 0.0000000000000001;
counterc = 1;

for j=-1:0.1:3
    disp(["--------------------",counterc,"--------------------"]);
    guess = j;
    a(1) = guess - f(guess)/fx(guess);
    clear error
    error(1) = abs(a(1) - guess);
    counter = 1;
    current = 0;
    disp([0, a(1),(a(1) - guess)])
    while (error(counter) >= tolerance) && (counter <= maxIt)
        i = counter;
        a(i+1) =  a(i) - (f(a(i))./fx(a(i)));
        disp([counter, a(i+1),(a(i+1) - a(i))])
        error(i+1) = abs(a(i+1) - a(i));
        current = a(i+1);
        counter = counter +1;
        
    end
    b(counterc) = current;
    counterc = counterc + 1;
    
end

%Svar till 1 d) !
%Vi ser p� nollorna och ser att vi f�r kvadratisk konvergens.


%Vi hittar �ven alla r�tter h�r, i skillnad fr�n 1 b).


disp(["Max: ", max(b),"Min: ", min(b)]);
%disp(b)


function y = f(x)
y = power(x,2)-3.*sin(3.*x+2)-1;
%y = x.^3 - 4.*x.^2 +1;
end

function yx = fx(x)
yx = 2.*x - 9.*cos(3.*x + 2);
%yx = 3*x^2 - 8*x;
end