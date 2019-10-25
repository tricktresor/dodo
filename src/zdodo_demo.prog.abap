REPORT zdodo_demo.

PARAMETERS p_demo.

INITIALIZATION.
  zdodo_main=>show(
    EXPORTING
      id   = 'RE'
      name = sy-cprog ).
