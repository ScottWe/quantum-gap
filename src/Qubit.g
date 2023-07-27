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
    local sz, null, iden, blocks;
    sz := GetQuditGateSz( 2, G );

    blocks := [ [ 1, 1, IdentityMat( sz ) ], [ 2, 2, G ] ];
    return MatrixByBlockMatrix( BlockMatrix( blocks, 2, 2 ) );
end;
