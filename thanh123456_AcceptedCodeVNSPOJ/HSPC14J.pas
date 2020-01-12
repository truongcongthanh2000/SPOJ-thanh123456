const
   fin='';fon='';
var
   n,k:longint;
   p:array [1..100000] of boolean;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   end;
procedure init;
   var
      i:longint;
   begin
   for i:=1 to n do p[i]:=true;
   p[1]:=false;
   end;
procedure sang;
   var
      i,dem,j:longint;
   begin
   i:=2;
   dem:=0;
   while i<=n do
      begin
      if p[i]=true then
         begin
         inc(dem);
         if dem=k then
            begin
            writeln(i);
            exit;
            end;
         j:=i*i;
         while j<=n do
            begin
            if p[j]=true then inc(dem);
            if dem=k then
               begin
               writeln(j);
               exit;
               end;
            p[j]:=false;
            j:=j+i;
            end;
         end;
      inc(i);
      end;
   end;
procedure xuat;
   begin
   while not(eof(input)) do
      begin
      readln(n,k);
      init;
      sang;
      end;
   close(input);
   close(output);
   end;
begin
nhap;
xuat;
end.
