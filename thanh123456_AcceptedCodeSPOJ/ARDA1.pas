const
   fin='';fon='';
   module=trunc(1e9)+7;
type mang=array [0..trunc(1e7)] of int64;
var
   pow,kq:mang;
   hash:array [0..2001,0..2001] of int64;
   n,m,n2,m2:longint;
procedure nhap;
   var
      i:longint;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   pow[0]:=1;
   for i:=1 to trunc(1e5) do pow[i]:=pow[i-1]*26 mod module;
   end;
function layHash(s:ansistring):int64;
   var
      i:longint;
      res:int64;
   begin
   res:=0;
   for i:=1 to length(s) do res:=(res*26+(ord(s[i])-97)) mod module;
   exit(res);
   end;
procedure taomang_part1;
   var
      i:longint;
      s:ansistring;
   begin
   for i:=1 to n do
      begin
      readln(s);
      kq[i]:=layHash(s);
      end;
   end;
procedure taomang_part2;
   var
      i,j:longint;
      s:ansistring;
   begin
   readln(n2,m2);
   for i:=1 to n2 do
      begin
      readln(s);
      for j:=1 to m2 do hash[i,j]:=(hash[i,j-1]*26+(ord(s[j])-97)) mod module;
      end;
   end;
function getHash(i,j,k:longint):int64;
   begin
   exit((hash[k,j]-(hash[k,i-1]*pow[j-i+1]) mod module+module) mod module);
   end;
function check(x,y:longint):boolean;
   var
      i,j:longint;
   begin
   j:=y+m-1;
   for i:=x to x+n-1 do
      begin
      if getHash(y,j,i)<>kq[i-(x-1)] then exit(false);
      end;
   exit(true);
   end;
procedure xuat;
   var
      i,j:longint;
      kt:boolean;
   begin
   kt:=false;
   for i:=1 to n2-n+1 do
      for j:=1 to m2-m+1 do
         if check(i,j)=true then
            begin
            writeln('(',i,',',j,')');
            kt:=true;
            end;
   if kt=false then writeln('NO MATCH FOUND...');
   close(input); close(output);
   end;
begin
nhap;
taomang_part1;
taomang_part2;
xuat;
end.

