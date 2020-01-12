const
   fin='';fon='';
var
   f:array [0..2001,0..2001] of longint;
   s1,s,kq,kq1:ansistring;
   i,n,j,csmax,x,y:longint;
function max(a,b:longint):longint;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(s);
   n:=length(s);
   end;
function max(a,b:string):string;
   begin
   if length(a)>length(b) then exit(a)
   else exit(b);
   end;
procedure xuli;
   begin
   //for i:=1 to n do s1[i]:=s[n-i+1];
   {for i:=0 to n do begin f[0,i]:=''; f[i,0]:=''; end;

   for i:=1 to n do
      begin
      for j:=1 to n do
         begin
         if s[i]=s1[j] then f[i,j]:=f[i-1,j-1]+s1[j]
         else f[i,j]:=max(f[i-1,j],f[i,j-1]);
         end;
      end;
   writeln(f[n,n]); }
       x:=0; y:=1;
    {FillChar(F[x],SizeOf(F[x]),0);
    for i:=1 to n do
      begin
        for j:=1 to n do
          if (s[i]=s1[j]) then F[y,j]:=F[x,j-1]+s1[j]
          else
            F[y,j]:=Max(F[x,j],F[y,j-1]);
        x:=1-x; y:=1-y;
      end;
    writeln(f[x,n]);}
   fillchar(f,sizeof(f),0);
   for i:=1 to n do f[i,i]:=1;
   for i:=n-1 downto 1 do
      begin
      for j:=i+1 to n do
         begin
         if s[i]=s[j] then f[i,j]:=f[i+1,j-1]+2
         else f[i,j]:=max(f[i+1,j],f[i,j-1]);
         end;
      end;
   i:=1; j:=n; kq1:='';
   while (i<>j) and (i<=n) and (j>=1) do
      begin
      if (s[i]=s[j]) and (f[i,j]=f[i+1,j-1]+2) then begin kq1:=kq1+s[i]; inc(i); dec(j); end
      else
         begin
         if (f[i,j]=f[i+1,j]) and (s[i]<>s[j]) then inc(i)
         else dec(j);
         end;
      end;
   kq:='';
   if f[1,n] mod 2=0 then
      begin
      kq:=kq1;
      for i:=length(kq1) downto 1 do
         kq:=kq+kq1[i];
      end
   else
      begin
      kq:=kq+kq1+s[j];
      for i:=length(kq1) downto 1 do
         kq:=kq+kq1[i];
      end;
   writeln(kq);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.

