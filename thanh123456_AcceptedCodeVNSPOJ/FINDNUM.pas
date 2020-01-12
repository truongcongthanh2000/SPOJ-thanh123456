const
   a:array [1..10] of longint =(2,3,5,7,11,13,17,19,23,29);
var
   n,min:int64;
procedure nhap;
   begin
   readln(n);
   end;
procedure vet(i,souoc:longint; giatri:int64);
   var
      j:longint;
   begin
   if souoc>n then exit;
   if souoc=n then
      begin
      if giatri<min then min:=giatri;
      end;
   j:=0;
   while giatri*a[i]<=min do
      begin
      inc(j);
      giatri:=giatri*a[i];
      vet(i+1,souoc*(j+1),giatri);
      end;
   end;
procedure xuat;
   begin
   min:=1000000000000000000;
   vet(1,1,1);
   writeln(min);
   end;
begin
nhap;
xuat;
end.
    