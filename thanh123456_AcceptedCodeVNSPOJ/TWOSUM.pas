const
   fin='';fon='';
   maxn=trunc(5e3);
var
   i,n,j:longint;
   t:array [0..maxn] of longint;
   a:array [1..maxn] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewritE(output);
   readln(n);
   for i:=1 to n do
      begin
      readln(a[i]);
      t[i]:=t[i-1]+a[i];
      end;
   end;
function nhiphan(i,j:longint;s:int64):longint;
   var
      l,r,m:longint;
   begin
   l:=i;
   r:=j;
   repeat
      m:=(l+r) div 2;
      if t[m]-t[i-1]=s then exit(m)
      else
         begin
         if t[m]-t[i-1]<s then l:=m+1
         else r:=m-1;
         end;
   until l>r;
   exit(-1);
   end;
function kt(i,j:longint):boolean;
   begin
   if nhiphan(i,j,(t[j]-t[i-1]) div 2)<>-1 then exit(true)
   else exit(false);
   end;
procedure xuli;
   begin
   for i:=n downto 2 do
      begin
      for j:=1 to n-i+1 do
         begin
         if (t[j+i-1]-t[j-1]) mod 2=0 then
            begin
            if kt(j,j+i-1)=true then
               begin
               writeln(i);
               exit;
               end;
            end;
         end;
      end;
   writeln(0);
   close(input);
   close(output);
   end;
begin
nhap;
xuli;
end.

