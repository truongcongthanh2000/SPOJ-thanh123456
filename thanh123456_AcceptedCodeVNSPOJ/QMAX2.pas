const
   fin='';fon='';
var
   n,m:longint;
   t,a,f:array [1..trunc(1e6)] of int64;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   readln(n,m);
   end;
function max(a,b:int64):int64;
   begin
   if a>b then exit(a)
   else exit(b);
   end;
function tinh(i,l,r,u,v:longint):int64;
   var
      mid:longint;
      left,right:int64;
   begin
   inc(t[i],f[i]);
   inc(f[i*2],f[i]); inc(f[i*2+1],f[i]); f[i]:=0;
   if (l>v) or (r<u) then exit(0)
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
procedure upDate(i,l,r,u,v,x:longint);
   var
      mid:longint;
   begin
   inc(t[i],f[i]);
   inc(f[i*2],f[i]); inc(f[i*2+1],f[i]); f[i]:=0;
   if (l>v) or (r<u) then exit;
   if (l>=u) and (r<=v) then
      begin
      inc(t[i],x);
      inc(f[i*2],x);
      inc(f[i*2+1],x);
      exit;
      end;
   mid:=(l+r) div 2;
   upDate(i*2,l,mid,u,v,x);
   upDate(i*2+1,mid+1,r,u,v,x);
   t[i]:=max(t[i*2],t[i*2+1]);
   end;
procedure xuat;
   var
      i,u,v,c,x:longint;
   begin
   for i:=1 to m do
      begin
      read(c,u,v);
      if c=0 then
         begin
         readln(x);
         upDate(1,1,n,u,v,x);
         end
      else
         begin
         readln;
         writeln(Tinh(1,1,n,u,v));
         end;
      end;
   close(input);
   close(output);
   end;
begin
nhap;
xuat;
end.
