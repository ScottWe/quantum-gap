# Tests for src/Base.g functions.

# IsPowOf for valid powers of 2.
gap> IsPowOf( 2, 2 );
true
gap> IsPowOf( 2, 4 );
true
gap> IsPowOf( 2, 8 );
true

# IsPowOf for valid powers of 3.
gap> IsPowOf( 3, 3 );
true
gap> IsPowOf( 3, 9 );
true
gap> IsPowOf( 3, 27 );
true

# IsPowOf for invalid powers of 2.
gap> IsPowOf( 2, 1 );
false
gap> IsPowOf( 2, 6 );
false

# IsPowOf for invalid powers of 3.
gap> IsPowOf( 3, 1 );
false
gap> IsPowOf( 3, 6 );
false
