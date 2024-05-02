# Tests for src/Qubit.g functions.

#########################################################################################
#
# ApplyQubitGateBetween Tests.
#

# Adapted from: qudit.tst
gap> m_1 := [[2, 3], [4, 5]];;
gap> ApplyQubitGateBetween(m_1, 1, 0);
[ [ 2, 3, 0, 0 ], [ 4, 5, 0, 0 ], [ 0, 0, 2, 3 ], [ 0, 0, 4, 5 ] ]

#########################################################################################
#
# AddQubitControl Tests.
#

# Tests AddQubitControl with two matrices.
gap> m_2 := [[2, 3, 4, 5], [6, 7, 8, 9], [10, 11, 12, 13], [14, 15, 16, 17]];;
gap> AddQubitControl( m_1 );
[ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 2, 3 ], [ 0, 0, 4, 5 ] ]
gap> AddQubitControl( m_2 );
[ [ 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 2, 3, 4, 5 ], [ 0, 0, 0, 0, 6, 7, 8, 9 ], 
  [ 0, 0, 0, 0, 10, 11, 12, 13 ], [ 0, 0, 0, 0, 14, 15, 16, 17 ] ]

#########################################################################################
#
# QubitSwapAndApply Tests.
#

# Adapted from: qudit.tst
gap> cx := [ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 0, 1 ], [ 0, 0, 1, 0 ] ];;
gap> QubitSwapAndApply( 1, 2, cx );
[ [ 1, 0, 0, 0 ], [ 0, 0, 0, 1 ], [ 0, 0, 1, 0 ], [ 0, 1, 0, 0 ] ]

#########################################################################################
#
# AssertQubitAncilla Tests.
#

# Adapted from: qudit.tst
gap> m_anc1 := [ [ 1, 2 ], [ 3, 4 ] ];;
gap> AssertQubitAncilla( m_anc1 );
[ [ 1 ] ]

#########################################################################################
#
# CheckQubitAncilla Tests.
#

# Adapted from: qudit.tst
gap> m_anc6 := [ [ 1, 2 ], [ 3, 4 ] ];;
gap> m_anc7 := [ [ 1, 2 ], [ 0, 4 ] ];;
gap> CheckQubitAncilla( m_anc6 );
false
gap> CheckQubitAncilla( m_anc7 );
true
