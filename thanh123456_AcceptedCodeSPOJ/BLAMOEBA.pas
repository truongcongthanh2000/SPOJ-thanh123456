const
     fin='';fon='';
     module=trunc(1e9)+7;
var
     test,n,m:int64;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewritE(output);
          readln(test);
     end;
procedure nhapdulieu;
     begin
          readln(m,n);
     end;
function mu(m,n:int64):int64;
     var
          tam:int64;
     begin
          if n=0 then exit(1);
          tam:=mu(m,n div 2);
          if n mod 2=0 then
               exit((tam*tam) mod module)
          else
               exit((((tam*tam) mod module)*m) mod module);
     end;
procedure xuli;
     var
          y,x,ts,ms:int64;
     begin
          y:=mu(m,n);
          ts:=y-1;
          ms:=m-1;
          ms:=mu(ms,module-2);
          x:=(ts*ms) mod module;
          writeln(x,' ',y);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    nhapdulieu;
                    xuli;
               end;
          close(input); closE(output);
     end;
begin
     nhap;
     xuat;
end.
