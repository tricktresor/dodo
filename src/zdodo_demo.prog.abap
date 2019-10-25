* demonstration for class zdodo_main
REPORT zdodo_demo.

"dummy paramter to display selection screen
PARAMETERS p_demo.

INITIALIZATION.
  "show documentation of this report
  zdodo_main=>show(
    EXPORTING
      id   = 'RE'
      name = sy-cprog ).
