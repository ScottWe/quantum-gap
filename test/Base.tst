# Tests for src/Base.g functions.

# IsPowOf for valid powers of 2.
gap> IsPowOf( 2, 2 );
[ 1 ]
gap> IsPowOf( 2, 4 );
[ 2 ]
gap> IsPowOf( 2, 8 );
[ 3 ]

# IsPowOf for valid powers of 3.
gap> IsPowOf( 3, 3 );
[ 1 ]
gap> IsPowOf( 3, 9 );
[ 2 ]
gap> IsPowOf( 3, 27 );
[ 3 ]

# IsPowOf for invalid powers of 2.
gap> IsPowOf( 2, 1 );
[  ]
gap> IsPowOf( 2, 6 );
[  ]
gap> IsPowOf( 2, 999 );
[  ]

# IsPowOf for invalid powers of 3.
gap> IsPowOf( 3, 1 );
[  ]
gap> IsPowOf( 3, 6 );
[  ]
gap> IsPowOf( 3, 2222 );
[  ]
