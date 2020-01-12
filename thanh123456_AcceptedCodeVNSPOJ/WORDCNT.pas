uses math;
const
     fin='';fon='';
var
     test,top:longint;
     a,stack:array [0..100000] of longint;
     s:ansistring;
procedure nhap;
     var
          i:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure nhapdulieu;
     var
          i:longint;
     begin
          top:=0;
          readln(s);
          s:=' '+s;
          s:=s+' ';
          for i:=1 to length(s) do
               if s[i]=' ' then
                    begin
                         inc(top);
                         stack[top]:=i;
                    end;
          for i:=1 to top-1 do
               a[i]:=stack[i+1]-stack[i]-1;
     end;
procedure solve;
     var
          l,r,res,dem:longint;
     begin
          if s='  ' then
               begin
                    writeln(0);
                    exit;
               end;
          res:=0;
          l:=1;
          while l<=top-1 do
               begin
                    r:=l;
                    if a[l]=0 then
                         begin
                              inc(l);
                              continue;
                         end;
                    dem:=0;
                    while (r<=top-1) and (a[l]=a[r]) or (a[r]=0) do
                         begin
                              if a[r]<>0 then inc(dem);
                              inc(r);
                         end;
                    res:=max(res,dem);
                    l:=r;
               end;
          writeln(res);
     end;
procedure xuat;
     var
          i:longint;
     begin
          for i:=1 to test do
               begin
                    nhapdulieu;
                    solve;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.
