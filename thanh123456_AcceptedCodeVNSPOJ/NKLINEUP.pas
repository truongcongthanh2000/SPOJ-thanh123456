const
   fin='';fon='';
type mang=array [1..trunc(1e7)] of longint;
var
   n,m:longint;
   a,t1,t2:mang;
procedure nhap;
   var
      i:longint;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   for i:=1 to n do readln(a[i]);
   end;
function min(a,b:longint):longint;
   begin
   if a<b then exit(a)
   else exit(b);
   end;
function max(a,b:longint):longint;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
procedure taocay(i,l,r,d:longint;var t:mang);
   var
      mid:longint;
   begin
   if l=r then
      begin
      t[i]:=a[l];
      exit;
      end;
   mid:=(l+r) div 2;
   taocay(i*2,l,mid,d,t);
   taocay(i*2+1,mid+1,r,d,t);
   if d=1 then t[i]:=min(t[i*2],t[i*2+1])
   else t[i]:=max(t[i*2],t[i*2+1]);
   end;
function tinh(i,l,r,u,v,d:longint; var t:mang):longint;
   var
      left,right,mid:longint;
   begin
   if (r<u) or (l>v) then
      begin
      if d=1 then exit(maxlongint)
      else exit(-maxlongint);
      end
   else
      if (l>=u) and (r<=v) then exit(t[i])
      else
         begin
         mid:=(l+r) div 2;
         left:=tinh(i*2,l,mid,u,v,d,t);
         right:=tinh(i*2+1,mid+1,r,u,v,d,t);
         if d=1 then exit(min(left,right))
         else exit(max(left,right));
         end;
   end;
procedure xuli;
   var
      i,u,v:longint;
   begin
   for i:=1 to m do
      begin
      readln(u,v);
      writeln(tinh(1,1,n,u,v,2,t2)-tinh(1,1,n,u,v,1,t1));
      end;
   close(input);
   close(output);
   end;
begin
nhap;
taocay(1,1,n,2,t2); taocay(1,1,n,1,t1);
xuli;
end.

