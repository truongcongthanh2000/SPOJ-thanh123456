const
		maxn = trunc( 1e6 ) * 4 + 1000  + 9 ;
		oo = trunc( 1e9 ) + 9 ;
type
		ll = longint ;
		qq = qword ;
		arr = array [ 0 .. maxn ] of boolean ;
		arr2 = array [ 0 .. maxn ] of qq ;
var
		sag : arr ;
	    k , t  , i , m : ll ;
		n , xx , tam
                : qq ;
		a : arr2 ;
//============================================================================
procedure sang ;
var
		i , j   : ll ;
begin
		fillchar( sag , sizeof(sag) , true ) ;
        sag[1] := false ; sag[0] := false ;
		for i := 2 to trunc( sqrt( maxn )) do
		if sag[i] then
		begin
				j := i * i ;
				repeat
						sag[j] := false ;
						j := j + i ;
				until j > maxn ;
		end;
		m := 0 ;
		for i := 2 to maxn do
		if sag[i] then
		begin
				inc ( m ) ;
				a[m] := i ;
		end;
end ;
//============================================================================
procedure process  ;
var
		i , j : ll ;
		p , tam  : qq ;
begin
		read ( n ) ; read ( k ) ;
		p := 1 ;
		for i := 1 to k do p := p * a[i] ;
		if p > n then
		begin
				writeln ( - 1 );
				exit;
		end;
        for i := k + 1 to m do
                begin
                        if a[i] > n div ( p div a[i - k] ) then break;
                        p := p div a[i - k] * a[i];
                end;
        writeln ( p );
end ;
//============================================================================
Begin
		sang ;
		readln ( t ) ;
		for i := 1 to t do process ;
ENd .