uses math;
const
     fin='';fon='';
     maxm=trunc(1e16);
     maxn=trunc(1e6)+1;
type
     mang=array [0..maxn] of int64;
var
     n:longint;
     res:int64;
     s,f_min,f_max,sl_min,sl_max:mang;
procedure nhap;
     var
          i:longint;
          x,res:int64;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(n);
          for i:=1 to n do
               begin
                    read(x);
                    //if i=n then writeln(x);
                    s[i]:=s[i-1]+x;
               end;
          f_min[n+1]:=maxm;
          f_max[n+1]:=-maxm;
          for i:=n downto 1 do
               begin
                    res:=s[n]-s[i-1];
                    f_min[i]:=min(f_min[i+1],res);
                    if res=f_min[i+1] then
                         sl_min[i]:=sl_min[i+1]+1
                    else
                    if res<f_min[i+1] then
                         sl_min[i]:=1
                    else sl_min[i]:=sl_min[i+1];
                    f_max[i]:=max(f_max[i+1],res);
                    if res=f_max[i+1] then
                         sl_max[i]:=sl_max[i+1]+1
                    else
                    if res>f_max[i+1] then
                         sl_max[i]:=1
                    else sl_max[i]:=sl_max[i+1];
               end;
          f_min[n+1]:=0;
          f_max[n+1]:=0;
     end;
procedure Tinh_Res;
     var
          i:longint;
          s1,s2:int64;
     begin
          res:=-maxm;
          for i:=1 to n-1 do
               begin
                    s1:=abs(s[i]-f_min[i+1]);
                    s2:=abs(s[i]-f_max[i+1]);
                    res:=max(res,max(s1,s2));
               end;
     end;
procedure Dem;
     var
          i:longint;
          s1,s2,dem:int64;
     begin
          dem:=0;
          for i:=1 to n-1 do
               begin
                    s1:=abs(s[i]-f_min[i+1]);
                    s2:=abs(s[i]-f_max[i+1]);
                    if max(s1,s2)=res then
                         begin
                              if s1>s2 then inc(dem,sl_min[i+1])
                              else inc(dem,sl_max[i+1]);
                         end;
               end;
          writeln(res,' ',dem);
     end;
begin
     nhap;
     Tinh_Res;
     Dem;
end.
