###############################################################################
#
# ApplyQubitGateAt( G, n, m )
#
# Specializes ApplyQubitGateAt from Qudit for qubit operators.
#
ApplyQubitGateBetween := function( G, n, m )
    return ApplyQuditGateBetween( 2, G, n, m );
end;

###############################################################################
#
# AddControl( G, n, m )
#
# If G is a qubit gate, then returns a controlled version of G. If G is not a
# qubit gate, then an error is raised by GetQuditGateSz.
#
AddQubitControl := function( G )
    local sz, id;
    sz := (GetQuditGateSz( 2, G ))[1];

    id := IdentityMat( sz );
    return DirectSumMat( id, G );
end;

###############################################################################
#
# ApplyQubitGateBetween( G, n, m )
#
# See ApplyQuditGateBetween( 2, G, n, m ).
#
ApplyQubitGateBetween := function( G, n, m )
    return ApplyQuditGateBetween( 2, G, n, m );
end;

###############################################################################
#
# QubitSwapAndApply( a, b, M )
#
# See SwapAndApply( 2, a, b, M ).
#
QubitSwapAndApply := function( a, b, M )
    return SwapAndApply( 2, a, b, M );
end;

#############################################################################
#
# AssertQubitAncilla( M )
#
# See AssertAncilla( 2, M, 0 ).
#
AssertQubitAncilla := function( M )
    return AssertAncilla( 2, M, 0 );
end;

#############################################################################
#
# CheckQubitAncilla( M )
#
# See CheckAncilla( 2, M, 0 ).
#
CheckQubitAncilla := function( M )
    return CheckAncilla( 2, M, 0 );
end;
