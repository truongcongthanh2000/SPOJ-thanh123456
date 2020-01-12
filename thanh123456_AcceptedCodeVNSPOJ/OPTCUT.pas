var
   f,d:array [0..2000,0..2000] of longint;
   a,t:array [0..2000] of longint;
   i,n,j,k,s:longint;
procedure nhap;
   begin
   readln(n);
   for i:=1 to n do
      begin
      read(a[i]);
      t[i]:=t[i-1]+a[i];
      d[i,i]:=i;
      end;
   end;
function min(a,b:longint):longint;
   begin
   if a<=b then exit(a)
   else exit(b);
   end;
procedure solve;
   begin
   for i:=0 to n do f[i,i]:=0;
   for i:=n-1 downto 1 do
      begin
      for j:=i+1 to n do
         begin
         f[i,j]:=1000000000;
         for k:=d[i,j-1] to d[i+1,j] do
            begin
            if k<j then
               begin
               s:=t[j]-t[i-1]+f[i,k]+f[k+1,j];
               if f[i,j]>s then
                  begin
                  f[i,j]:=s;
                  d[i,j]:=k;
                  end;
               end;
            end;
         end;
      end;
   writeln(f[1,n]);
   end;
begin
nhap;
solve;
end.