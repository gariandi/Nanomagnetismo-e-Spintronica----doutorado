function q = plotaEnergiaV4(Raio,delta,Ms,dz,dr,A,theta0,dfi,K)
 %10-05-2022
 % COM ANISOTROPIA EM R, valor típico: K~10 erg/cm3
 
  k = 1./Raio ;
  
  a = pi*delta/2
  b = dz/2
  c = dr/2
  %Nr = Dy(a,b,c)
  %Nz = Dz(a,b,c) % Nr, Nz = fatores desmagnetizantes (apendice B da dissertação Guilherme pg 72) 
  %trocando Nr com Nz:
  Nr = Dz(a,b,c)
  Nz = Dy(a,b,c) % Nr, Nz = fatores desmagnetizantes (apendice B da dissertação Guilherme pg 72) 
  
  Ntheta = Dx(a,b,c)
  
  L = pi*Raio;
  q = Raio*theta0;
  
  a = @(L,q,delta) atan(exp((L-q)./delta)) - atan(exp(-q./delta)) ;
  
  f = @(x) atan(exp(x)).^2 ;
  I = @(x) integral(f,-x/delta,(L-x)/delta) ;
 
  E = @(fi) 2*pi*(Ms^2)*delta*(Nr*sin(fi).^2 + Nz*cos(fi).^2) - 2*A*delta*a(L,q,delta)*( (2/(Raio*delta))*sin(fi) - (1/Raio^2 + 1/delta^2)*sin(fi).^2 - (1/delta^2)*cos(fi).^2 ) + K*(L - 4*delta*I(q)*sin(fi).^2);
  
  fi = 0:dfi:(2*pi);

  plot(fi,E(fi)); grid on;
  
  xlabel('fi (rad)'); ylabel('Energia por área da secção transversal(erg/cm^2)'); title('Energia dipolar + troca + anisotropia em r');

  q = E(fi);

end  
