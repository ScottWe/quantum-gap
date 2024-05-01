###############################################################################
#
# GetPowFor( p, n )
#
# If n is a power of p, then returns a singleton list [ i ] such that p^i = n.
# Otherwise, returns an empty list.
#
GetPowFor := function( p, n )
    local x, i;

    # Finds largest integer x from p to n such that p^i = x for some integer i.
    x := p;
    i := 1;
    while x < n do
        x := x * p;
        i := i + 1;
    od;

    # Checks whether n was identified as a power of p.
    if x = n then
        return [ i ];
    else
        return [ ];
    fi;
end;

###############################################################################
#
# IsPowOf( p, n )
#
# Returns true if and only if n = p^i for some positive integer i.
#
IsPowOf := function( p, n )
    return not ( GetPowFor( p, n ) = [] );
end;