function [X, Precision,n,ctr] = LUDecomposition(A,b)
n = size(A,1);
ctr  = 0;
for i=1:1:n
    H(i)=b(i); 
end
U = A;
for f=1:1:n
      L(f,f) = 1;
      ctr = ctr+1;
end
for i=1:1:n
  %get new pivot
  idx = i;
  max = abs(U(i,i));
  for j=i+1:1:n
     ctr = ctr+1;
     cur = abs(U(j,i));
     if cur > max 
         max = cur;
         idx = j;
     end
  end
  %swap (partial pivoting)
  if idx ~= i
      for k=i:1:n
        ctr = ctr+1;
        temp = U(i,k);
        U(i,k) = U(idx,k);
        U(idx,k) = temp;
      end 
      for k=1:1:i-1
        ctr = ctr+1;
        temp = L(i,k);
        L(i,k) = L(idx,k);
        L(idx,k) = temp;
      end
      temp = b(i);
      b(i) = b(idx);
      b(idx) = temp;
  end
  
  
  %Forward elimination
  
  for j=i+1:1:n
     factor = U(j,i)/U(i,i);
     L(j,i) = factor;
     U(j,i) = 0;
     for k=i+1:1:n
         ctr = ctr+1;
         U(j,k) = U(j,k)-factor*U(i,k);
     end 
  end
end

%SOLVE Lc = b and UX = c 

%Lc = b
for i=1:1:n
    c(i) = b(i);
    for j=1:1:i-1
        ctr = ctr+1;
        c(i) = c(i) - c(j)*L(i,j);
    end
    c(i) = c(i)/L(i,i);
end

%UX = c

for i=n:-1:1
    X(i) = c(i);
    for j=i+1:1:n
        ctr = ctr+1;
        X(i) = X(i) - X(j)*U(i,j);
    end
    X(i) = X(i)/U(i,i);
end
sum = 0;
Precision = 0;
for i=1:1:n
   sum = 0;
   for j=1:1:n
        sum = sum + A(i, j)*X(j);
   end
   if Precision < abs(sum - H(i))
        Precision = abs(sum - H(i));
   end
end
