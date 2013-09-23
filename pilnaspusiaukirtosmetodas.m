function saknys = pilnaspusiaukirtosmetodas(func,a,b,dx,filter,tol)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
saknusk = 0;
while 1
    [x1,x2] = skaidosmetodas(func,a,b,dx);
    if isnan(x1)
        break
    else
        a = x2;
        saknis = pusiaukirtosmetodas(func,x1,x2,0,tol);
        if ~isnan(saknis)
            saknusk = saknusk + 1;
            saknys(saknusk) = saknis;
        end
    end
end