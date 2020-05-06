CLASS zcl_dodo_apack DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_apack_manifest .

    METHODS constructor .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DODO_APACK IMPLEMENTATION.


  METHOD constructor.

    if_apack_manifest~descriptor-group_id        = 'tricktresor.de'.
    if_apack_manifest~descriptor-artifact_id     = 'dodo'.
    if_apack_manifest~descriptor-version         = '0.1.1'.
    if_apack_manifest~descriptor-git_url         = 'https://github.com/tricktresor/dodo'.
    if_apack_manifest~descriptor-dependencies    = VALUE #( ).
    if_apack_manifest~descriptor-repository_type = ``.

  ENDMETHOD.
ENDCLASS.
