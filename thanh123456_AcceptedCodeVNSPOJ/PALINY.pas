uses math;
const
     fin='';fon='';
var
     z:array [0..trunc(1e6)] of longint;
     s1:ansistring;
     s:array [0..trunc(1e6)] of char;
     n,res:longint;
procedure nhap;
     var
          i,l:longint;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(l);
          readln(s1);
          n:=1;
          s[1]:='*';
          for i:=1 to length(s1) do
               begin
                    inc(n);
                    s[n]:=s1[i];
                    inc(n);
                    s[n]:='*';
               end;
     end;
procedure Z_;
     var
          l,r,i,x:longint;
     begin
          l:=1;
          r:=1;
          res:=0;
          for i:=2 to n do
               begin
                    x:=2*l-i;
                    if i<r then z[i]:=min(z[x],r-i);
                    while (s[i-1-z[i]]=s[i+1+z[i]]) do inc(z[i]);
                    res:=max(res,z[i]);
                    if i+z[i]>r then
                         begin
                              l:=i;
                              r:=i+z[i];
                         end;
               end;
     end;
procedure solve;
     var
          i,len,q:longint;
     begin
          {readln(q);
          for i:=1 to q do
               begin
                    readln(len);
                    if len<=res then writeln(1)
                    else writeln(0);
               end; }
          writeln(res);
          close(input); close(output);
     end;
begin
     nhap;
     z_;
     solve;
end.

