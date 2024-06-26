###############################################################################
#
# Field Exntensions.
#

c_omg   := E( 8 );
c_i     := E( 4 );
c_sqrt2 := ER( 2 );

###############################################################################
#
# The Pauli Group.
#

m_x := [ [ 0, 1 ],
         [ 1, 0 ] ];
m_y := [ [ 0,   -c_i ],
         [ c_i, 0    ] ];
m_z := [ [ 1, 0  ],
         [ 0, -1 ] ];

###############################################################################
#
# Clifford+T Generating Set.
#

m_omg := [ [ c_omg, 0     ],
           [ 0,     c_omg ] ];
m_h   := [ [ 1, 1  ],
           [ 1, -1 ] ] / c_sqrt2;
m_s   := [ [ 1, 0   ],
           [ 0, c_i ] ];
m_sdg := [ [ 1, 0    ],
           [ 0, -c_i ] ];
m_t   := [ [ 1, 0     ],
           [ 0, c_omg ] ];
m_tdg := [ [ 1, 0       ],
           [ 0, c_omg^7 ] ];
m_cx  := AddQubitControl( m_x );

###############################################################################
#
# Derived Generators.
#

m_ix    := c_i * m_x;
m_sx    := [ [ 1 - c_i, 1 + c_i ],
             [ 1 + c_i, 1 - c_i ] ] / 2;
m_swap  := [ [ 1, 0, 0, 0 ],
             [ 0, 0, 1, 0 ],
             [ 0, 1, 0, 0 ],
             [ 0, 0, 0, 1 ] ];
m_cz    := AddQubitControl( m_z );
m_ch    := AddQubitControl( m_h );
m_cswap := AddQubitControl( m_swap );
m_ccx   := AddQubitControl( m_cx );
m_ccz   := AddQubitControl( m_cz );
