function saknis = pusiaukirtosmetodas(func,x1,x2,filter,tol)
% Pusiaukirtos metodu surandamas funkcijos f(x) nulis intervale (x1,x2).
% IVEDIMO PARAMETRAI:
% filter = singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
% tol = paklaida (pagal nutylejima 0.001).
%
if nargin < 5; tol = 0.001; end % nargin nustato kiek ivesta duomenu
if nargin < 4; filter = 0; end % naudojama jai vartotojas nesurase reikamu duomenu
%
f1 = func(x1);
if f1 == 0.0; saknis = x1; return; end % tikrina ar f1 = 0
f2 = func(x2);
if f2 == 0.0; saknis = x2; return; end % tikrina ar f2 = 0
if f1*f2 > 0;
error('Nurodytame intervale (x1,x2) nera funkcijos nulio') % error nutraukia fukcija ir pateikia paaiskinima
end
%
n = ceil(log2(abs(x2 - x1)/tol)); % ceil apvalina skaicius
for i = 1:n
    x3 = 0.5*(x1 + x2);
    f3 = func(x3);
    if (filter == 1) && (abs(f3) > abs(f1)) && (abs(f3) > abs(f2))
        saknis = NaN; return % NaN ne numeris
    end
    if f3 == 0.0
        saknis = x3; return
    end
    if f2*f3 < 0.0
        x1 = x3; f1 = f3;
    else
        x2 = x3; f2 = f3;
    end
    saknis = (x1 + x2)/2;
end