CLASS zcl_dodo_apack DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_apack_manifest .

    METHODS constructor .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DODO_APACK IMPLEMENTATION.


  METHOD constructor.

    zif_apack_manifest~descriptor-group_id        = 'tricktresor.de'.
    zif_apack_manifest~descriptor-artifact_id     = 'dodo'.
    zif_apack_manifest~descriptor-version         = '0.1.1'.
    zif_apack_manifest~descriptor-git_url         = 'https://github.com/tricktresor/dodo'.
    zif_apack_manifest~descriptor-dependencies    = VALUE #( ).
    zif_apack_manifest~descriptor-repository_type = ``.

  ENDMETHOD.
ENDCLASS.
