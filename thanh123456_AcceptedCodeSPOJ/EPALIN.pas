const
   fin='';fon='';
var
   t,s1,s2:ansistring;
   mp:array [0..trunc(1e7)] of longint;
procedure nhap;
   begin
   assign(input,fin);reset(input);
   assign(output,fon);rewrite(output);
   end;
procedure docdulieu;
   var
      i:longint;
   begin
   readln(s1);
   s2:='';
   for i:=length(s1) downto 1 do s2:=s2+s1[i];
   t:=s2+'*'+s1;
   end;
procedure init_kmp;
   var
      i,j:longint;
   begin
   j:=0; i:=1;
   while i<=length(t) do
      begin
      while (j>0) and (t[i]<>t[j]) do J:=mp[j];
      inc(i); inc(j);
      mp[i]:=j;
      end;
   end;
procedure xuat;
   var
      dai:longint;
   begin
   dai:=mp[length(t)];
   writeln(copy(s1,1,length(s1)-dai),copy(s2,1,dai),copy(s2,dai+1,length(s2)-dai));
   end;
procedure xuli;
   begin
   while not(eof(input)) do
      begin
      docdulieu;
      init_kmp;
      xuat;
      end;
   close(input); close(output);
   end;
begin
nhap;
xuli;
end.


