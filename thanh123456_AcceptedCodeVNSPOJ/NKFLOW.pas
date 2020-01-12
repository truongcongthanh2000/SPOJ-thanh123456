program Max_Flow_by_Ford_Fulkerson;
const
 max = 1000;
 maxC = 1000000000;
var
 c, f: array[1..max, 1..max] of longint;
 Trace: array[1..1000*max] of longint;
 Delta: array[1..1000*max] of longint;
 Queue: array[1..max*1000] of longint;
 n, A, B: longint;
procedure Enter; {Nh?p d? li?u}
var
 m, i, u, v: longint;
begin
 FillChar(c, SizeOf(c), 0);
 ReadLn(n, m, A, B);
 for i := 1 to m do
 ReadLn(u, v, c[u, v]);
end;
function Min(X, Y: longint): longint;
begin
 if X < Y then Min := X else Min := Y;
end;
function FindPath: Boolean;
var
 u, v: longint;
 First, Last: longint;
begin
 FillChar(Trace, SizeOf(Trace), 0); {Trace[v] = 0 d?ng nghia v?i v chua dánh d?u}
 First := 1; Last := 1; Queue[1] := A;
 Trace[A] := n + 1; {Ch? c?n nó khác 0 d? dánh d?u mà thôi, s? duong nào cung du?c c?}
 Delta[A] := maxC; {Kh?i t?o nhan}
 repeat
 u := Queue[First]; Inc(First); {L?y u kh?i Queue}
 for v := 1 to n do
 if Trace[v] = 0 then {Xét nh?ng d?nh v chua dánh d?u tham}
 begin
 if f[u, v] < c[u, v] then {N?u (u, v) là cung thu?n trên Gf và có tr?ng s? là c[u, v] - f[u, v]}
 begin
 Trace[v] := u; {Luu v?t, Trace[v] mang d?u duong}
 Delta[v] := min(Delta[u], c[u, v] - f[u, v]);
 end
 else
 if f[v, u] > 0 then {N?u (u, v) là cung ngh?ch trên Gf và có tr?ng s? là f[v, u]}
 begin
 Trace[v] := -u; {Luu v?t, Trace[v] mang d?u âm}
 Delta[v] := min(Delta[u], f[v, u]);
 end;
 if Trace[v] <> 0 then {Trace[v] khác 0 t?c là t? u có th? tham v}
 begin
 if v = B then {Có du?ng tang lu?ng t? A t?i B}
 begin
 FindPath := True; Exit;
 end;
 Inc(Last); Queue[Last] := v; {Dua v vào Queue}
 end;
 end;
 until First > Last; {Hàng d?i Queue r?ng}
 FindPath := False; {? trên không Exit du?c t?c là không có du?ng}
end;
procedure IncFlow; {Tang lu?ng d?c du?ng tang lu?ng}
var
 IncValue, u, v: longint;
begin
 IncValue := Delta[B]; {Nhan Delta[B] chính là tr?ng s? nh? nh?t trên các cung c?a du?ng tang lu?ng}
 v := B; {Truy v?t du?ng di, tang lu?ng d?c theo du?ng di}
 repeat
 u := Trace[v]; {Xét cung (?u?, v) trên du?ng tang lu?ng}
 if u > 0 then f[u, v] := f[u, v] + IncValue {(|u|, v) là cung thu?n thì tang f[u, v]}
 else
 begin
 u := -u;
 f[v, u] := f[v, u] - IncValue; {(|u|, v) là cung ngh?ch thì gi?m f[v, |u|]}
 end;
 v := u;
 until v = A;
end;
procedure PrintResult; {In k?t qu?}
var
 u, v: longint;
 m:int64;
begin
 m := 0;
 for u := 1 to n do
 for v := 1 to n do
 if c[u, v] > 0 then
 begin
 if u = A then m := m + f[A, v];
 end;
 WriteLn( m);
end;
begin
 Assign(Input, ''); Reset(Input);
 Assign(Output, ''); Rewrite(Output);
 Enter;
 FillChar(f, SizeOf(f), 0);
 repeat
 if not FindPath then Break;
 IncFlow;
 until False;
 PrintResult;
 Close(Input);
 Close(Output);
end.
