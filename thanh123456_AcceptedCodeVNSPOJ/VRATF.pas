const
     fin='';fon='';
var
     n,k:int64;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n,k);
     end;  
function Get(n:int64):int64;
     begin
          if ((n+k) mod 2=1) or (n<=k) then
               exit(1);
          exit(Get((n+k) div 2)+Get(n-((n+k) div 2)));
     end;
procedure xuat;
     begin
          writeln(Get(n));
     close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.
