const
   fin='';fon='';
var
   n,m:longint;
   a,t:array [1..trunc(1e6)] of int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   end;
procedure taomang;
   var
      i,u,v,x:longint;
   begin
   for i:=1 to m do
      begin
      readln(u,v,x);
      inc(a[u],x);
      dec(a[v+1],x);
      end;
   for i:=1 to n do a[i]:=a[i-1]+a[i];
   end;
function max(a,b:int64):int64;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
procedure taocay(i,l,r:longint);
   var
      mid:longint;
   begin
   if l=r then
      begin
      t[i]:=a[l];
      exit;
      end;
   mid:=(l+r) div 2;
   taocay(i*2,l,mid);
   taocay(i*2+1,mid+1,r);
   t[i]:=max(t[i*2],t[i*2+1]);
   end;
function tinh(i,l,r,u,v:longint):int64;
   var
      left,right:int64;
      mid:longint;
   begin
   if (r<u) or (l>v) then exit(0)
      else
         if (l>=u) and (r<=v) then exit(t[i])
            else
               begin
               mid:=(l+r) div 2;
               left:=tinh(i*2,l,mid,u,v);
               right:=tinh(i*2+1,mid+1,r,u,v);
               exit(max(left,right));
               end;
   end;
procedure xuat;
   var
      i,q,u,v:longint;
   begin
   readln(q);
   for i:=1 to q do
      begin
      readln(u,v);
      writeln(tinh(1,1,n,u,v));
      end;
   close(input);
   close(output);
   end;
begin
nhap;
taomang;
taocay(1,1,n);
xuat;
end.

