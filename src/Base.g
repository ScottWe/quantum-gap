###############################################################################
#
# IsPowOf( n, p )
#
# Returns true if and only if n is a power of p.
#
IsPowOf := function( p, n )
    local i;

    i := p;
    while i < n do
        i := i * p;
    od;
    return i = n;
end;