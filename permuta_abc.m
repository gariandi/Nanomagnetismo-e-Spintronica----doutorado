function q = permuta_abc(nome_arq)
  %10-05-2022
  %faz permutação cíclica de a, b e c na função dada por nome_arq (usualmente nome_arq = 'Dz.m')
  
  texto = fileread(nome_arq);
  
  %ifunc = strfind(texto,'function');
  %ifech = strfind(texto,')');
  %ifech = ifech(1);
  
  comeco = texto(1:8);
  
  texto = texto(9:end);
  
  ia = strfind(texto,'a');
  ib = strfind(texto,'b');
  ic = strfind(texto,'c');
  
  texto(ia) = 'b';
  texto(ib) = 'c';
  texto(ic) = 'a';

  ix = strfind(comeco,'x');
  iy = strfind(comeco,'y');
  iz = strfind(comeco,'z');
  
  comeco(ix) = 'y';
  comeco(iy) = 'z';
  comeco(iz) = 'x';
  
  saida = [comeco,texto];
  
  q = texto;
  
  end