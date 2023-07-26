###############################################################################
#
# QutritId( p )
#
# Returns the identity operator for a p-level qutrit. That is a p-by-p identity
# matrix over the complex numbers
#
QutritId := function( p )
    return IdentityMat( p );
end;

###############################################################################
#
# GetQutritGateSz( p, G )
#
# A p-level qutrit gate is a square matrix of size p^k for some positive
# integer k. This function determines if G is a gate, and if so, then the
# dimension of G is returned. Otherwise, an error is raised.
#
GetQutritGateSz := function( p, G )
    local dim;
    dim := DimensionsMat( G );

    if not dim[1] = dim[2] then
        Error( "GetQutritGateSz: gate must be square." );
    elif not IsPowOf( p, dim[1] ) then
        Error( "IsPowOf: gate must be or dimension p^k for some k." );
    fi;
    return dim[1];
end;

###############################################################################
#
# ApplyQutritGateAt( p, G, n, m )
#
# If G is a p-level qutrit gate of dimension p^k with n and m non-negative
# integers, then returns p-level qutrit gate that applies M to the n-th qutrit
# throguh to the (n + k - 1)-th qutrit in an (n + k + m)-qutrit system. If G
# is not a p-level qutrit operator, then an error is raised by GetQutritGateSz.
# Otherwise, if either n or m is negative, then an error is raised.
#
ApplyQutritGateBetween := function( p, G, n, m )
    local id, tmp;

    GetQutritGateSz( p, G );
    if n < 0 then
        Error( "ApplyQutritGateAt: qutrit count (n) must be non-negative." );
    elif m < 0 then
        Error( "ApplyQutritGateAt: qutrit count (m) must be non-negative." );
    fi;

    id := QutritId( p );
    for tmp in [1..n] do
        G := KroneckerProduct( id, G );
    od;
    for tmp in [1..m] do
        G := KroneckerProduct( G, id );
    od;
    return G;
end;
