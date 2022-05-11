function q = Dx(a,b,c)
  
D = ( (c.^2-a.^2)./(2*c.*a) )*log( (sqrt(b.^2 + c.^2 + a.^2 ) - b )./( sqrt(b.^2 + c.^2 + a.^2 ) + b ) ) +...
      ( (b.^2-a.^2)./(2*b.*a) )*log( (sqrt(b.^2 + c.^2 + a.^2 ) - c )./( sqrt(b.^2 + c.^2 + a.^2 ) + c ) )  +...
       (c./(2*a)).*log( (sqrt(b.^2 + c.^2) + b )./(sqrt(b.^2 + c.^2) - b) ) +...
        (b./(2*a)).*log( (sqrt(b.^2 + c.^2) + c)./(sqrt(b.^2 + c.^2) - c) ) +...
        (a./(2*b)).*log( (sqrt(c.^2 + a.^2) - c)./(sqrt(c.^2 + a.^2) + c) ) +...
        (a./(2*c)).*log( (sqrt(b.^2 + a.^2) - b)./(sqrt(b.^2 + a.^2) + b) ) +...
        2*atan( b.*c ./ (a.*sqrt(b.^2 + c.^2 + a.^2)) )  + (b.^3 + c.^3 - 2*a.^3)./(3*b.*c.*a) +...
        %agora os tres ultimos termos faltantes que o Vagson encontrou em 02-05-2022:
        ( (b.^2 + c.^2 - 2*a.^2 )./(3*b.*c.*a) ).*sqrt(b.^2 + c.^2 + a.^2) +...
        (a./(b.*c)).*(sqrt(b.^2 + a.^2) + sqrt(c.^2 + a.^2)) -...
        ( (b.^2 + c.^2)^1.5 + (c.^2 + a.^2)^1.5 + (a.^2 + b.^2)^1.5 )/(3*b.*c.*a) ;

        
        
  q = D/pi;

  end