uses math;
const
     fin='';fon='';
     maxn=101;
     di:array [1..4] of longint =(-1,0,1,0);
     dj:array [1..4] of longint =(0,1,0,-1);
type
     mang=array [0..maxn,0..maxn] of longint;
var
     n,min_res,max_res:longint;
     a,d:mang;
     queue_dong,queue_cot:array [0..maxn*maxn] of longint;
procedure nhap;
     var
          i,j:longint;
     begin
          assign(input,fin);reset(input);
          assigN(output,fon);rewrite(output);
          readln(n);
          min_res:=maxlongint;
          max_res:=0;
          for i:=1 to n do
               begin
                    for j:=1 to n do
                         begin
                              read(a[i,j]);
                              min_res:=min(min_res,a[i,j]);
                              max_res:=max(max_res,a[i,j]);
                         end;
               end;
     end;
procedure push(x,y:longint;var vao:longint);
     begin
          inc(vao);
          queue_dong[vao]:=x;
          queue_cot[vao]:=y;
     end;
function BFS(s,t:longint):boolean;
     var
          i,ra,vao,u,v,x,y:longint;
     begin
          ra:=1;
          vao:=0;
          fillchar(d,sizeof(d),0);
          if (a[1,1]>=s) and (a[1,1]<=t) then
               begin
                    push(1,1,vao);
                    d[1,1]:=1;
               end;
          while ra<=vao do
               begin
                    u:=queue_dong[ra];
                    v:=queue_cot[ra];
                    inc(ra);
                    for i:=1 to 4 do
                         begin
                              x:=u+di[i];
                              y:=v+dj[i];
                              if (x>=1) and (x<=n) and (y<=n) and (y>=1) then
                                   begin
                                        if (d[x,y]=0) and (a[x,y]>=s) and (a[x,y]<=t) then
                                             begin
                                                  push(x,y,vao);
                                                  d[x,y]:=d[u,v]+1;
                                                  if (x=n) and (y=n) then exit(true);
                                             end;
                                   end;
                         end;
               end;
          if d[n,n]<>0 then exit(true)
          else exit(false);
     end;
function Check(k:longint):boolean;
     var
          i:longint;
     begin
          for i:=min_res to max_res-k do
               if BFS(i,i+k)=true then exit(true);
          exit(false);
     end;
procedure solve;
     var
          l,r,mid,res:longint;
     begin
          l:=0;
          r:=max_res-min_res;
          res:=0;
          repeat
               mid:=(l+r) div 2;
               if CHeck(mid)=true then
                    begin
                         r:=mid-1;
                         res:=mid;
                    end
               else l:=mid+1;
          until l>r;
          writeln(res);
     close(input); close(output);
     end;
begin
     nhap;
     solve;
end.

