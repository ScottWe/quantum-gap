###############################################################################
#
# QuditId( d )
#
# Returns the identity operator for a qudit. That is a d-by-d identity matrix
# over the complex numbers
#
QuditId := function( d )
    return IdentityMat( d );
end;

###############################################################################
#
# GetQuditGateSz( d, G )
#
# A qudit gate is a square matrix of size d^k for some positive integer k. This
# function determines if G is a gate, and if so, then the dimension of G is
# returned. Otherwise, an error is raised.
#
GetQuditGateSz := function( d, G )
    local dim;
    dim := DimensionsMat( G );

    if not dim[1] = dim[2] then
        Error( "GetQuditGateSz: gate must be square." );
    elif not IsPowOf( d, dim[1] ) then
        Error( "IsPowOf: gate must be or dimension d^k for some k." );
    fi;
    return dim[1];
end;

###############################################################################
#
# ApplyQuditGateAt( d, G, n, m )
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
        Error( "ApplyQuditGateAt: qudit count (n) must be non-negative." );
    elif m < 0 then
        Error( "ApplyQuditGateAt: qudit count (m) must be non-negative." );
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