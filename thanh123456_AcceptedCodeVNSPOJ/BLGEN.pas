const
   fin='';fon='';
   maxn=trunc(2e6)+trunc(1e5)+trunc(6e4);
var
   i,j,k,m,n:longint;
   snt,a,b:array [1..maxn] of qword;
   p:array [1..maxn] of boolean;
   f:array [0..1000,0..1000] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   end;
procedure DocDuLieu;
   begin
   while not(seekeoln(input)) do
      begin
      inc(n);
      read(a[n]);
      end;
   readln;
   while not(seekeoln(input)) do
      begin
      inc(m);
      read(b[m]);
      end;
   end;
procedure Khoitao;
   begin
   for i:=1 to maxn do p[i]:=true;
   p[1]:=false;
   end;
procedure SangVaKhoiTaoMangNguyenTo;
   begin
   Khoitao;
   for i:=2 to trunc(sqrt(maxn)) do
      begin
      if p[i]=true then
         begin
         j:=i*i;
         while j<=maxn do
            begin
            p[j]:=false;
            j:=j+i;
            end;
         end;
      end;
   k:=0;
   for i:=1 to maxn do
      begin
      if p[i]=true then
         begin
         inc(k);
         snt[k]:=i;
         end;
      end;
   //writeln(snt[k]);
   for i:=1 to k do snt[i]:=snt[i]*snt[i]*snt[i];
   end;
function tknp(x:qword):longint;
   var
      l,r,m:longint;
   begin
   l:=1;
   r:=k;
   repeat
      m:=(l+r) div 2;
      if snt[m]=x then exit(m)
      else
         begin
         if snt[m]<x then l:=m+1
         else r:=m-1;
         end;
   until l>r;
   exit(-1);
   end;
function ktcp(x:qword):boolean;
   begin
   if trunc(sqrt(x))=sqrt(x) then exit(true)
   else exit(false);
   end;
function kt(x:qword):boolean;
   begin
   if ktcp(x)=true then exit(true);
   if tknp(x)<>-1 then exit(true)
   else exit(false);
   end;
function max(a,b:longint):longint;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
procedure QHD;
   begin
   for i:=1 to n do
      begin
      for j:=1 to m do
         begin
         if (a[i]=b[j]) and (kt(a[i])=true) then
            f[i,j]:=f[i-1,j-1]+1
         else
            f[i,j]:=max(f[i-1,j],f[i,j-1]);
         end;
      end;
   writeln(f[n,m]);
   close(inpuT);
   close(output);
   end;
begin
nhap;
DocDuLieu;
SangVaKhoiTaoMangNguyenTo;
QHD;
end.

