# Tests for src/Qudit.g functions.

# Helper variables for 3-level systems.
gap> v_d3 := [1, 2, 3, 4, 5, 6, 7, 8, 9];;

# Sets up test matrices.
gap> m_d2_1 := [[2, 3], [4, 5]];;
gap> m_d2_2 := [[2, 3, 4, 5], [6, 7, 8, 9], [10, 11, 12, 13], [14, 15, 16, 17]];;
gap> m_d3_1 := [[1, 2, 3], [4, 5, 6], [7, 8, 9]];;
gap> m_d3_2 := [v_d3, v_d3, v_d3, v_d3, v_d3, v_d3, v_d3, v_d3, v_d3];;
gap> m_nsqr := [v_d3, v_d3, v_d3, v_d3];;

# GetQuditGateSz for valid powers of 2.
gap> GetQuditGateSz(2, m_d2_1);
2
gap> GetQuditGateSz(2, m_d2_2);
4

# GetQuditGateSz for valid powers of 3.
gap> GetQuditGateSz(3, m_d3_1);
3
gap> GetQuditGateSz(3, m_d3_2);
9

# GetQuditGateSz for invalid p.
gap> GetQuditGateSz(2, m_d3_1);
Error, IsPowOf: gate must be or dimension d^k for some k.
gap> GetQuditGateSz(3, m_d2_1);
Error, IsPowOf: gate must be or dimension d^k for some k.

# GetQuditGateSz for non-square matrices.
gap> GetQuditGateSz(2, m_nsqr);
Error, GetQuditGateSz: gate must be square.

# ApplyQuditGateBetween for 2-level systems.
gap> ApplyQuditGateBetween(2, m_d2_1, 1, 0);
[ [ 2, 3, 0, 0 ], [ 4, 5, 0, 0 ], [ 0, 0, 2, 3 ], [ 0, 0, 4, 5 ] ]
gap> ApplyQuditGateBetween(2, m_d2_1, 2, 0);
[ [ 2, 3, 0, 0, 0, 0, 0, 0 ], [ 4, 5, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 2, 3, 0, 0, 0, 0 ], [ 0, 0, 4, 5, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 2, 3, 0, 0 ], [ 0, 0, 0, 0, 4, 5, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 2, 3 ], [ 0, 0, 0, 0, 0, 0, 4, 5 ] ]
gap> ApplyQuditGateBetween(2, m_d2_1, 0, 1);
[ [ 2, 0, 3, 0 ], [ 0, 2, 0, 3 ], [ 4, 0, 5, 0 ], [ 0, 4, 0, 5 ] ]
gap> ApplyQuditGateBetween(2, m_d2_1, 0, 2);
[ [ 2, 0, 0, 0, 3, 0, 0, 0 ], [ 0, 2, 0, 0, 0, 3, 0, 0 ], 
  [ 0, 0, 2, 0, 0, 0, 3, 0 ], [ 0, 0, 0, 2, 0, 0, 0, 3 ], 
  [ 4, 0, 0, 0, 5, 0, 0, 0 ], [ 0, 4, 0, 0, 0, 5, 0, 0 ], 
  [ 0, 0, 4, 0, 0, 0, 5, 0 ], [ 0, 0, 0, 4, 0, 0, 0, 5 ] ]
gap> ApplyQuditGateBetween(2, m_d2_1, 1, 1);
[ [ 2, 0, 3, 0, 0, 0, 0, 0 ], [ 0, 2, 0, 3, 0, 0, 0, 0 ], 
  [ 4, 0, 5, 0, 0, 0, 0, 0 ], [ 0, 4, 0, 5, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 2, 0, 3, 0 ], [ 0, 0, 0, 0, 0, 2, 0, 3 ], 
  [ 0, 0, 0, 0, 4, 0, 5, 0 ], [ 0, 0, 0, 0, 0, 4, 0, 5 ] ]

# ApplyQuditGateBetween for 3-level systems.
gap> ApplyQuditGateBetween(3, m_d3_1, 1, 0);
[ [ 1, 2, 3, 0, 0, 0, 0, 0, 0 ], [ 4, 5, 6, 0, 0, 0, 0, 0, 0 ], 
  [ 7, 8, 9, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 2, 3, 0, 0, 0 ], 
  [ 0, 0, 0, 4, 5, 6, 0, 0, 0 ], [ 0, 0, 0, 7, 8, 9, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 1, 2, 3 ], [ 0, 0, 0, 0, 0, 0, 4, 5, 6 ], 
  [ 0, 0, 0, 0, 0, 0, 7, 8, 9 ] ]
gap> ApplyQuditGateBetween(3, m_d3_1, 0, 1);
[ [ 1, 0, 0, 2, 0, 0, 3, 0, 0 ], [ 0, 1, 0, 0, 2, 0, 0, 3, 0 ], 
  [ 0, 0, 1, 0, 0, 2, 0, 0, 3 ], [ 4, 0, 0, 5, 0, 0, 6, 0, 0 ], 
  [ 0, 4, 0, 0, 5, 0, 0, 6, 0 ], [ 0, 0, 4, 0, 0, 5, 0, 0, 6 ], 
  [ 7, 0, 0, 8, 0, 0, 9, 0, 0 ], [ 0, 7, 0, 0, 8, 0, 0, 9, 0 ], 
  [ 0, 0, 7, 0, 0, 8, 0, 0, 9 ] ]

# ApplyQuditGateBetween for invalid qubit counts.
gap> ApplyQuditGateBetween(2, m_d2_1, -1, 3);
Error, ApplyQuditGateAt: qudit count (n) must be non-negative.
gap> ApplyQuditGateBetween(2, m_d2_1, 2, -1);
Error, ApplyQuditGateAt: qudit count (m) must be non-negative.

# ApplyQuditGateBetween for invalid qudits.
gap> ApplyQuditGateBetween(2, m_d3_1, 2, 3);
Error, IsPowOf: gate must be or dimension d^k for some k.
gap> ApplyQuditGateBetween(3, m_d2_1, 2, 3);
Error, IsPowOf: gate must be or dimension d^k for some k.
