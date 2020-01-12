const
     fin='';fon='';
     maxn=trunc(1e5);
type
     mang=array [0..maxn] of int64;
var
     test,n,top:longint;
     k:int64;
     a,stack,sl,b,c:mang;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure nhapdulieu;
     var
          i:longint;
     begin
          readln(n);
          for i:=1 to n do read(a[i]);
          readln(k);
     end;
procedure PTich(k:int64);
     var
          i,dem:longint;
          tam:int64;
     begin
          top:=0;
          i:=2;
          tam:=k;
          while (k>1) and (i<=trunc(sqrt(tam))) do
               begin
                    if k mod i=0 then
                         begin
                              dem:=0;
                              while k mod i=0 do
                                   begin
                                        inc(dem);
                                        k:=k div i;
                                   end;
                              inc(top);
                              stack[top]:=i;
                              sl[top]:=dem;
                         end;
                    inc(i);
               end;
          if k>=1 then
               begin
                    inc(top);
                    stack[top]:=k;
                    sl[top]:=1;
               end;
     end;
function UCLN(a,b:int64):int64;
     begin
          if b=0 then exit(a)
          else exit(UCLN(b,a mod b));
     end;
function BCNN(a,b:int64):int64;
     begin
          if high(int64) div b < a then exit(k+1);
          if high(int64) div a < b then exit(k+1);
          exit(a*b div UCLN(a,b));
     end;
function mu(a,b:int64):int64;
     var
          tam:int64;
     begin
          if b=1 then exit(a);
          tam:=mu(a,b div 2);
          if b mod 2=0 then
               exit(tam*tam)
          else exit(tam*tam*a);
     end;
procedure xuat;
     var
          i:longint;
     begin
          writeln(top);
          for i:=1 to top do write(stack[i],' ');
          writeln;
          for i:=1 to top do write(sl[i],' ');
          writeln;
          writeln(BCNN(45,75));
     end;
procedure xuli;
     var
          i,j:longint;
          tam,len,res:int64;
     begin
          for i:=1 to top do
               begin
                    tam:=mu(stack[i],sl[i]);
                    len:=0;
                    for j:=1 to n do
                         begin
                              if a[j] mod tam=0 then
                                   begin
                                        inc(len);
                                        b[len]:=a[j];
                                   end;
                         end;
                    if len=0 then
                         begin
                              writeln('NO');
                              exit;
                         end;
                    tam:=b[1];
                    for j:=2 to len do tam:=UCLN(tam,b[j]);
                    c[i]:=tam;
               end;
          res:=c[1];
          for i:=2 to top do res:=BCNN(res,c[i]);
          if res=k then writeln('YES')
          else writeln('NO');
     end;
procedure solve;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    nhapdulieu;
                    PTich(k);
                    //xuat;
                    xuli;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     solve;
end.

