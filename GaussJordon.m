function [X, Precision,n,ctr] = GaussJordon(A,b)
n = size(A,1);
ctr  = 0;
for i=1:1:n
  %get new pivot
  idx = i;
  max = abs(A(i,i));
  for j=i+1:1:n
     ctr = ctr+1;
     cur = abs(A(j,i));
     if cur > max 
         max = cur;
         idx = j;
     end
  end
  %swap (partial pivoting)
  if idx ~= i
      for k=i:1:n
        ctr = ctr+1;
        temp = A(i,k);
        A(i,k) = A(idx,k);
        A(idx,k) = temp;
      end 
      temp = b(i);
      b(i) = b(idx);
      b(idx) = temp;
  end
  
  %Forward elimination
  for j=1:1:n
     if j ~= i
         factor = A(j,i)/A(i,i);
         A(j,i) = 0;
         for k=i+1:1:n
             ctr = ctr+1;
             A(j,k) = A(j,k)-factor*A(i,k);
         end 
         b(j) = b(j) - factor*b(i);
     end
  end
end
%Back Substitution
for i=n:-1:1
    X(i) = b(i)/A(i,i);
    ctr = ctr+1;
end
sum = 0;
Precision = 0;
for i=1:1:n
   sum = 0;
   for j=1:1:n
        sum = sum + A(i, j)*X(j);
   end
   if Precision < abs(sum - b(i))
        Precision = abs(sum - b(i));
   end
end