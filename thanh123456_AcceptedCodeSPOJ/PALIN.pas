const
     fin='';fon='';
var
     a:ansistring;
     n,test:longint;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
          {readln(a);
          n:=length(a); }
     end;
procedure solve;
     var
          i,kt,tam,x,t:longint;
          code:integer;
     begin
          kt:=0;
          for i:=1 to n do
               if a[i]<>'9' then
                    begin
                         kt:=1;
                         break;
                    end;
          if kt=0 then
               begin
                    a:='1';
                    for i:=2 to n do a:=a+'0';
                    a:=a+'1';
                    exit;
               end;
          kt:=0;
          for i:=1 to n div 2 do
               begin
                    if a[i]<a[n-i+1] then
                         kt:=-1
                    else
                    if a[i]>a[n-i+1] then
                         kt:=1;
                    a[n-i+1]:=a[i];
               end;
          if (kt=-1) or (kt=0) then
               begin
                    t:=0;
                    if n mod 2 =0 then tam:=n div 2
                    else tam:=n div 2+1;
                    while a[tam-t]='9' do
                         begin
                              a[tam-t]:='0';
                              a[n-(tam-t)+1]:='0';
                              inc(t);
                         end;
                    a[tam-t]:=chr(ord(a[tam-t])+1);
                    a[n-(tam-t)+1]:=a[tam-t];
               end;
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    readln(a);
                    n:=length(a);
                    solve;
                    writeln(a);
               end;
     close(input); close(output);
     end;
begin
     nhap;
     //solve;
     xuat;
end.

