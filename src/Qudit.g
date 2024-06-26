###############################################################################
#
# QuditId( d )
#
# Returns the identity operator for a qudit. That is a d-by-d identity matrix.
#
QuditId := function( d )
    return IdentityMat( d );
end;

###############################################################################
#
# AdjQuditSwap( d )
#
# Returns the swap operator for adjacent qudits. That is a (d^2)-by-(d^2)
# permutation matrix.
#
AdjQuditSwap := function( d )
    local M, i, j, s1, s2;
    M := NullMat( d^2, d^2 );

    for i in [1..d] do
        for j in [1..d] do
            s1 := (i - 1) * d + j;
            s2 := (j - 1) * d + i;

            M[s1, s2] := 1;
        od;
    od;
    return M;
end;

###############################################################################
#
# GetQuditGateSz( d, G )
#
# A qudit gate is a square matrix of size d^k for some positive integer k. This
# function determines if G is a gate, and if so, returns the corresponding d^k
# and k as a two element list. Otherwise, an error is raised.
#
GetQuditGateSz := function( d, G )
    local dim, res;
    dim := DimensionsMat( G );

    if not dim[1] = dim[2] then
        Error( "GetQuditGateSz: gate must be square." );
    fi;

    res := IsPowOf( d, dim[1] );
    if res = [ ] then
        Error( "IsPowOf: gate must be or dimension d^k for some k." );
    fi;
    return [ dim[1], res[1] ];
end;

###############################################################################
#
# ApplyQuditGateBetween( d, G, n, m )
#
# If G is a qudit gate of dimension d^k with n and m non-negative integers,
# then returns qudit gate that applies M to the n-th qudit throguh to the
# (n + k - 1)-th qudit in an (n + k + m)-qudit system. If G is not a qudit
# operator, then an error is raised by GetQuditGateSz. Otherwise, if either n
# or m is negative, then an error is raised.
#
ApplyQuditGateBetween := function( d, G, n, m )
    local id, tmp;

    GetQuditGateSz( d, G );
    if n < 0 then
        Error( "ApplyQuditGateBetween: qudit count (n) must be non-negative." );
    elif m < 0 then
        Error( "ApplyQuditGateBetween: qudit count (m) must be non-negative." );
    fi;

    id := QuditId( d );
    for tmp in [1..n] do
        G := KroneckerProduct( id, G );
    od;
    for tmp in [1..m] do
        G := KroneckerProduct( G, id );
    od;
    return G;
end;

###############################################################################
#
# QuditSwapAt( d, n, a, b )
#
# Returns the swap operator for arbitrary pairs of qudits at indices a and b in
# an n qudit system. If a or b is larger than n, then an error is returned.
#
QuditSwapAt := function( d, n, a, b )
    local tmp, M, adjSwap, swap, i;

    if n < 1 then
        Error( "QuditSwapAt: qudit count (n) must be positive." );
    elif a < 1 then
        Error( "QuditSwapAt: index (a) must be positive." );
    elif n < a then
        Error( "QuditSwapAt: index (a) must be at most the qudit count." );
    elif b < 1 then
        Error( "QuditSwapAt: index (b) must be positive." );
    elif n < b then
        Error( "QuditSwapAt: index (b) must be at most the qudit count." );
    elif d < 1 then
        Error( "QuditSwapAt: dimension (d) must be positive." );
    fi;

    if b < a then
        tmp := a;
        a := b;
        b := tmp;
    fi;

    M := IdentityMat( d^n );
    if a = b then
        return M;
    fi;

    adjSwap := AdjQuditSwap( d );
    for i in [a..(b-1)] do
        swap := ApplyQuditGateBetween( d, adjSwap, i - 1, n - i - 1 );
        M := swap * M; 
    od;
    for i in Reversed( [a..(b-2)] ) do
        swap := ApplyQuditGateBetween( d, adjSwap, i - 1, n - i - 1 );
        M := swap * M;
    od;

    return M;
end;

###############################################################################
#
# SwapAndApply( d, a, b, M )
#
# Returns an application of the matrix M with qudits a and b swapped. The
# result is the matrix obtained by conjugation with QuditSwapAt( d, n, a, b ),
# where n is the number of qubits acted upon by M. If QuditSwapAt( d, n, a, b )
# would return an error, then the same error is returned. If M is not a valid n
# qudit operator, then an error is also returned.
#
SwapAndApply := function( d, a, b, M )
    local n, swp;

    n   := (GetQuditGateSz( d, M ))[2];
    swp := QuditSwapAt( d, n, a, b );

    return swp * M * swp;
end;

#############################################################################
#
# SelfInvExp( d, M, a, b )
#
# Computes the matrix exponential exp(i*M*t) where M is self-inverse qudit
# operator, a=cos(t), and b=sin(t). If M is not self-inverse or a^2 + b^2 = 1
# does not hold, then an error is raised. Otherwise, aI + bM is returned.
#
SelfInvExp := function( d, M, a, b )
    local sz, id;

    sz := (GetQuditGateSz( d, M ))[1];
    id := IdentityMat( sz );

    if not M * M = id then
        Error( "SelfInvExp: Matrix must be self-inverse." );
    elif not a^2 + b^2 =1 then
        Error( "SelfInvExp: the squares of a and b must sum to 1." );
    fi;

    return a * id + E(4) * b * M;
end;

#############################################################################
#
# AssertAncilla( d, M, v )
#
# Converts the final qudit of M into an ancilla fixed to v. If M is not a
# qudit matrix or n is not between 0 and (d - 1), then an error is raised.
#
AssertAncilla := function( d, M, v )
    local sz, nsz, incl, proj, i, j;

    sz   := (GetQuditGateSz( d, M ))[1];
    nsz  := sz / d;
    proj := NullMat( nsz, sz );
    incl := NullMat( sz, nsz );

    for i in [1..nsz] do
        j := 1 + (i - 1) * d + v;
        incl[j][i] := 1;
        proj[i][j] := 1;
    od;

    return proj * M * incl;
end;

#############################################################################
#
# CheckAncilla( d, M, v )
#
# Checks if the final qudit of M can be interpreted as an ancilla both set
# and terminated in state v. If the final qudit is not a valid ancilla, then
# false is returned. If M is not a qudit matrix or n is not between 0 and
# (d - 1), then an error is raised. Otherwise, nothing is returned.
#
CheckAncilla := function( d, M, v )
    local sz, nsz, incl, i, j, k;

    sz   := (GetQuditGateSz( d, M ))[1];
    nsz  := sz / d;
    incl := NullMat( sz, nsz );

    for i in [1..nsz] do
        j := 1 + (i - 1) * d + v;
        incl[j][i] := 1;
    od;

    M := M * incl;
    k := 1 + v;
    for i in [1..sz] do
        if not i = k then
            for j in [1..nsz] do
                if not M[i][j] = 0 then
                    return false;
                fi;
            od;
        else
            k := k + d;
        fi;
    od;

    return true;
end;
