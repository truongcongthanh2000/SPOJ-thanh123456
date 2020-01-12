uses math;
const
     fin='';fon='';
     maxn=trunc(1e6);
type
     mang=array [0..maxn] of longint;
var
     n,k,test,bot1,top1,bot2,top2,res:longint;
     stack1,stack2,a:mang;
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
          readln(n,k);
          for i:=1 to n do read(a[i]);
          k:=k+2;
     end;
procedure push(x:longint;var top:longint;var stack:mang);
     begin
          inc(top);
          stack[top]:=x;
     end;
function Get(top:longint;var stack:mang):longint;
     begin
          exit(stack[top]);
     end;
procedure pop_right(var top:longint;var stack:mang);
     begin
          stack[top]:=0;
          dec(top);
     end;
procedure pop_left(var bot:longint;var stack:mang);
     begin
          stack[bot]:=0;
          inc(bot);
     end;
procedure init;
     var
          i:longint;
     begin
          bot1:=1; top1:=0;         ///min
          bot2:=1; top2:=0;         ///max
          for i:=1 to min(n,k) do
               begin
                    while (top1>=bot1) and (a[get(top1,stack1)]>=a[i]) do pop_right(top1,stack1);
                    while (top2>=bot2) and (a[get(top2,stack2)]<=a[i]) do pop_right(top2,stack2);
                    push(i,top1,stack1);
                    push(i,top2,stack2);
               end;
          res:=a[get(bot2,stack2)]-a[get(bot1,stack1)];
     end;
procedure De_queue;
     var
          i:longint;
     begin
          for i:=k+1 to n do
               begin
                    while (top1>=bot1) and (a[get(top1,stack1)]>=a[i]) do pop_right(top1,stack1);
                    while (top2>=bot2) and (a[get(top2,stack2)]<=a[i]) do pop_right(top2,stack2);
                    push(i,top1,stack1);
                    push(i,top2,stack2);
                    if i-get(bot1,stack1)>=k then pop_left(bot1,stack1);
                    if i-get(bot2,stack2)>=k then pop_left(bot2,stack2);
                    res:=max(res,a[get(bot2,stack2)]-a[get(bot1,stack1)]);
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
                    init;
                    De_Queue;
               end;
          close(input); close(output);
     end;
begin
     nhap;
     xuat;
end.

