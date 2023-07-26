# Tests for src/Qutrit.g functions.

# Helper variables for 3-level systems.
gap> v_p3 := [1, 2, 3, 4, 5, 6, 7, 8, 9];;

# Sets up test matrices.
gap> m_p2_1 := [[2, 3], [4, 5]];;
gap> m_p2_2 := [[2, 3, 4, 5], [6, 7, 8, 9], [10, 11, 12, 13], [14, 15, 16, 17]];;
gap> m_p3_1 := [[1, 2, 3], [4, 5, 6], [7, 8, 9]];;
gap> m_p3_2 := [v_p3, v_p3, v_p3, v_p3, v_p3, v_p3, v_p3, v_p3, v_p3];;
gap> m_nsqr := [v_p3, v_p3, v_p3, v_p3];;

# GetQutritGateSz for valid powers of 2.
gap> GetQutritGateSz(2, m_p2_1);
2
gap> GetQutritGateSz(2, m_p2_2);
4

# GetQutritGateSz for valid powers of 3.
gap> GetQutritGateSz(3, m_p3_1);
3
gap> GetQutritGateSz(3, m_p3_2);
9

# GetQutritGateSz for invalid p.
gap> GetQutritGateSz(2, m_p3_1);
Error, IsPowOf: gate must be or dimension p^k for some k.
gap> GetQutritGateSz(3, m_p2_1);
Error, IsPowOf: gate must be or dimension p^k for some k.

# GetQutritGateSz for non-square matrices.
gap> GetQutritGateSz(2, m_nsqr);
Error, GetQutritGateSz: gate must be square.

# ApplyQutritGateBetween for 2-level systems.
gap> ApplyQutritGateBetween(2, m_p2_1, 1, 0);
[ [ 2, 3, 0, 0 ], [ 4, 5, 0, 0 ], [ 0, 0, 2, 3 ], [ 0, 0, 4, 5 ] ]
gap> ApplyQutritGateBetween(2, m_p2_1, 2, 0);
[ [ 2, 3, 0, 0, 0, 0, 0, 0 ], [ 4, 5, 0, 0, 0, 0, 0, 0 ], 
  [ 0, 0, 2, 3, 0, 0, 0, 0 ], [ 0, 0, 4, 5, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 2, 3, 0, 0 ], [ 0, 0, 0, 0, 4, 5, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 2, 3 ], [ 0, 0, 0, 0, 0, 0, 4, 5 ] ]
gap> ApplyQutritGateBetween(2, m_p2_1, 0, 1);
[ [ 2, 0, 3, 0 ], [ 0, 2, 0, 3 ], [ 4, 0, 5, 0 ], [ 0, 4, 0, 5 ] ]
gap> ApplyQutritGateBetween(2, m_p2_1, 0, 2);
[ [ 2, 0, 0, 0, 3, 0, 0, 0 ], [ 0, 2, 0, 0, 0, 3, 0, 0 ], 
  [ 0, 0, 2, 0, 0, 0, 3, 0 ], [ 0, 0, 0, 2, 0, 0, 0, 3 ], 
  [ 4, 0, 0, 0, 5, 0, 0, 0 ], [ 0, 4, 0, 0, 0, 5, 0, 0 ], 
  [ 0, 0, 4, 0, 0, 0, 5, 0 ], [ 0, 0, 0, 4, 0, 0, 0, 5 ] ]
gap> ApplyQutritGateBetween(2, m_p2_1, 1, 1);
[ [ 2, 0, 3, 0, 0, 0, 0, 0 ], [ 0, 2, 0, 3, 0, 0, 0, 0 ], 
  [ 4, 0, 5, 0, 0, 0, 0, 0 ], [ 0, 4, 0, 5, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 2, 0, 3, 0 ], [ 0, 0, 0, 0, 0, 2, 0, 3 ], 
  [ 0, 0, 0, 0, 4, 0, 5, 0 ], [ 0, 0, 0, 0, 0, 4, 0, 5 ] ]

# ApplyQutritGateBetween for 3-level systems.
gap> ApplyQutritGateBetween(3, m_p3_1, 1, 0);
[ [ 1, 2, 3, 0, 0, 0, 0, 0, 0 ], [ 4, 5, 6, 0, 0, 0, 0, 0, 0 ], 
  [ 7, 8, 9, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 2, 3, 0, 0, 0 ], 
  [ 0, 0, 0, 4, 5, 6, 0, 0, 0 ], [ 0, 0, 0, 7, 8, 9, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 1, 2, 3 ], [ 0, 0, 0, 0, 0, 0, 4, 5, 6 ], 
  [ 0, 0, 0, 0, 0, 0, 7, 8, 9 ] ]
gap> ApplyQutritGateBetween(3, m_p3_1, 0, 1);
[ [ 1, 0, 0, 2, 0, 0, 3, 0, 0 ], [ 0, 1, 0, 0, 2, 0, 0, 3, 0 ], 
  [ 0, 0, 1, 0, 0, 2, 0, 0, 3 ], [ 4, 0, 0, 5, 0, 0, 6, 0, 0 ], 
  [ 0, 4, 0, 0, 5, 0, 0, 6, 0 ], [ 0, 0, 4, 0, 0, 5, 0, 0, 6 ], 
  [ 7, 0, 0, 8, 0, 0, 9, 0, 0 ], [ 0, 7, 0, 0, 8, 0, 0, 9, 0 ], 
  [ 0, 0, 7, 0, 0, 8, 0, 0, 9 ] ]

# ApplyQutritGateBetween for invalid qubit counts.
gap> ApplyQutritGateBetween(2, m_p2_1, -1, 3);
Error, ApplyQutritGateAt: qutrit count (n) must be non-negative.
gap> ApplyQutritGateBetween(2, m_p2_1, 2, -1);
Error, ApplyQutritGateAt: qutrit count (m) must be non-negative.

# ApplyQutritGateBetween for invalid qutrits.
gap> ApplyQutritGateBetween(2, m_p3_1, 2, 3);
Error, IsPowOf: gate must be or dimension p^k for some k.
gap> ApplyQutritGateBetween(3, m_p2_1, 2, 3);
Error, IsPowOf: gate must be or dimension p^k for some k.
