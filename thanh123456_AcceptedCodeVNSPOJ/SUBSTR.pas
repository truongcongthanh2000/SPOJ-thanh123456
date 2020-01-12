const
   fin='';fon='';
var
   s1,s2:ansistring;
   z:array [0..trunc(2e6)+1] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(s1);
   readln(s2);
   end;
function min(a,b:longint):longint;
   begin
   if a<b then exit(a)
   else exit(b);
   end;
procedure Ham_z(s:ansistring);
   var
      i,l,r,n:longint;
   begin
   fillchar(z,sizeof(z),0);///z[1]:=0;
   l:=1; r:=1;
   n:=length(s);
   for i:=2 to n do
      begin
      if i<=r then z[i]:=min(r-i+1,z[i-l+1]);
      while (i+z[i]<=n) and (s[z[i]+1]=s[i+z[i]]) do inc(z[i]);
      if i+z[i]-1>r then
         begin
         l:=i;
         r:=i+z[i]-1;
         end;
      end;
   end;
procedure xuatDayVitri(a,b:ansistring);
   var
      i,dem,m,n:longint;
      s:ansistring;
   begin
   dem:=0;
   S:=b+'*'+a;
   Ham_z(s);
   m:=length(b); n:=length(a);
   for i:=m+2 to m+n+1 do
      begin
      if z[i]=m then write(i-m-1,' ');
      end;
   end;
begin
nhap;
xuatDayVitri(s1,s2);
close(input);
close(output);
end.





