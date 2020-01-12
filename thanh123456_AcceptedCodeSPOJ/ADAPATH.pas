uses math;
const
     fin='';fon='';
     di:array [1..4] of longint =(-1,0,1,0);
     dj:array [1..4] of longint =(0,1,0,-1);
     maxn=trunc(1e2);
var
     test,n,max_dinh,p,m,q,nlist:longint;
     c,vt:array [0..maxn*2+1,0..maxn*2+1] of longint;
     sl,u,v,h,a,list,match:array [0..maxn*maxn*10] of longint;
     free:Array [0..maxn*maxn*10] of boolean;
procedure nhap;
     begin
          assign(input,fin);reset(input);
          assign(output,fon);rewrite(output);
          readln(test);
     end;
procedure nhapdulieu;
     var
          i,j:longint;
     begin
          readln(n);
          fillchar(sl,sizeof(sl),0);
          max_dinh:=0;
          for i:=1 to n do
               for j:=1 to n do
                    begin
                         read(c[i,j]);
                         vt[i,j]:=sl[c[i,j]]+1;
                         inc(sl[c[i,j]]);
                         max_dinh:=max(max_dinh,c[i,j]);
                    end;
     end;
procedure init(dinh1,dinh2:longint);
     var
          i,j,k,x,y,m,dinh:longint;
     begin
          m:=0;
          p:=sl[dinh1];
          q:=sl[dinh2];
          for i:=1 to n do
               for j:=1 to n do
                    begin
                         if c[i,j]=dinh1 then
                              begin
                                   for k:=1 to 4 do
                                        begin
                                             x:=i+di[k];
                                             y:=j+dj[k];
                                             if (x=0) or (x=n+1) then continue;
                                             if (y=0) or (y=n+1) then continue;
                                             if c[x,y]=dinh2 then
                                                  begin
                                                       inc(m);
                                                       u[m]:=vt[i,j];
                                                       v[m]:=vt[x,y];
                                                  end;
                                        end;
                              end;
                    end;
          dinh:=u[m];
          fillchar(h,sizeof(h),0);
          for i:=1 to m do inc(h[u[i]]);
          for i:=2 to dinh+1 do h[i]:=h[i-1]+h[i];
          for i:=1 to m do
               begin
                    a[h[u[i]]]:=v[i];
                    dec(h[u[i]]);
               end;
          fillchar(match,sizeof(match),0);
          for i:=1 to p do list[i]:=i;
          nlist:=p;
     end;
procedure CapGhep;
     var
          Found:boolean;
          Old,i:longint;
     procedure dfs(u:longint);
          var
               i,v:longint;
          begin
               for i:=h[u]+1 to h[u+1] do
                    begin
                         v:=a[i];
                         if free[v]=false then
                              begin
                                   free[v]:=true;
                                   if match[v]=0 then Found:=true
                                   else dfs(match[v]);
                                   if Found=true then
                                        begin
                                             match[v]:=u;
                                             exit;
                                        end;
                              end;
                    end;
          end;
     begin
          repeat
               Old:=nlist;
               fillchar(free,sizeof(free),false);
               for i:=nlist downto 1 do
                    begin
                         Found:=false;
                         dfs(list[i]);
                         if Found=true then
                              begin
                                   list[i]:=list[nlist];
                                   dec(nlist);
                              end;
                    end;
          until old=nlist;
     end;
function Check(dinh1,dinh2:longint):boolean;
     var
          i:longint;
     begin
          init(dinh1,dinh2);
          CapGhep;
          for i:=1 to q do
               if match[i]=0 then exit(false);
          exit(true);
     end;
procedure solve;
     var
          i:longint;
     begin
          for i:=1 to max_dinh-1 do
               begin
                    if Check(i,i+1)=false then
                         begin
                              writeln('NO');
                              exit;
                         end;
               end;
          writeln('YES');
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
