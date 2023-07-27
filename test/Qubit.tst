# Tests for src/Qubit.g functions.

# Sets up test matrices.
gap> m_1 := [[2, 3], [4, 5]];;
gap> m_2 := [[2, 3, 4, 5], [6, 7, 8, 9], [10, 11, 12, 13], [14, 15, 16, 17]];;

# ApplyQubitGateBetween specializes ApplyQuditGateBetween.
gap> ApplyQubitGateBetween(m_1, 1, 0);
[ [ 2, 3, 0, 0 ], [ 4, 5, 0, 0 ], [ 0, 0, 2, 3 ], [ 0, 0, 4, 5 ] ]

# AddQubitControl for valid operators.
gap> AddQubitControl( m_1 );
[ [ 1, 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 2, 3 ], [ 0, 0, 4, 5 ] ]
gap> AddQubitControl( m_2 );
[ [ 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 2, 3, 4, 5 ], [ 0, 0, 0, 0, 6, 7, 8, 9 ], 
  [ 0, 0, 0, 0, 10, 11, 12, 13 ], [ 0, 0, 0, 0, 14, 15, 16, 17 ] ]
