const
     fin='';fon='';
var
     k,h:int64;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(k,h);
     end;
function ptich(k:int64):string;
     var
          ketqua,tmp:string;
     begin
          ketqua:='';
          while k>0 do
               begin
                    str(k mod 2,tmp);
                    ketqua:=tmp+ketqua;
                    k:=k div 2;
               end;
          exit(ketqua);
     end;
procedure xuat;
     begin
          writeln(ptich(k));
     close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.
