clear;clc

function green = G2(x,xo,L)

  a = 0.5*(exp(-xo+2*L)-exp(L+xo))  /(1-exp(2*L));
  b = 0.5*(exp(xo)-exp(-xo+L))      /(1-exp(2*L));
  c = 0.5*(exp(-xo)-exp(xo+L))      /(1-exp(2*L));
  d = 0.5*(exp(xo+2*L)-exp(-xo+L))  /(1-exp(2*L));
  
  N = length(x);
  if N == 1
      if x<=xo
        green = a*exp(x) + b*exp(-x);
      end
      if x>xo
        green = c*exp(x) + d*exp(-x);
      end
  end
  
  if N > 1
      green = zeros(1,N);
      for n=1:N
          if x(n)<=xo
            green(n) = a*exp(x(n)) + b*exp(-x(n));
          end
          if x(n)>xo
            green(n) = c*exp(x(n)) + d*exp(-x(n));
          end
      end
  end
  
end


L = 2;
N = 100;
d = L/N;
x = -L/2:d:(L/2-d);
xo = 0;  % probar diferentes valores: 0, 0.5, 0.9, -0.9 ...

plot(x,G2(x,xo,L)+0.01,'b')
hold off
