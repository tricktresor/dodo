class ZDODO_MAIN definition
  public
  final
  create public .

*"* public components of class ZDODO_MAIN
*"* do not include other source files here!!!
public section.

  class-methods SHOW
    importing
      !ID type DOKU_ID
      !NAME type CLIKE .
  class-methods EXIT .
protected section.
*"* protected components of class ZDODO_MAIN
*"* do not include other source files here!!!

  class-data GV_OBJECT type DOKU_OBJ .
  class-data GR_HTML type ref to CL_GUI_HTML_VIEWER .
  class-data GR_DOCK type ref to CL_GUI_DOCKING_CONTAINER .
private section.
*"* private components of class ZDODO_MAIN
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZDODO_MAIN IMPLEMENTATION.


METHOD EXIT.

  IF gr_dock IS BOUND.
    gr_dock->set_visible( space ).
  ENDIF.

  CLEAR gv_object.

ENDMETHOD.


METHOD SHOW.

*== data
  DATA lt_lines    TYPE STANDARD TABLE OF tline.
  DATA ls_header   TYPE thead.
  DATA lt_html     TYPE STANDARD TABLE OF  htmlline.
  DATA lv_url      TYPE c LENGTH 500.
  DATA lv_spras    TYPE sylangu.


*== has anything changed??
  CHECK gv_object <> name.

  gv_object = name.

*== read docu
  CALL FUNCTION 'DOCU_GET'
    EXPORTING
      id     = id
      langu  = sy-langu
      object = gv_object
    IMPORTING
      head   = ls_header
    TABLES
      line   = lt_lines
    EXCEPTIONS
      OTHERS = 5.

*==  Build controls
  IF gr_dock IS INITIAL.
*== create docking container
    CREATE OBJECT gr_dock
      EXPORTING
        side                    = cl_gui_docking_container=>dock_at_right
        extension               = 400
        no_autodef_progid_dynnr = 'X'.
  ENDIF.


  IF lt_lines IS INITIAL.
*== No doku: Set controls to invisible
    IF gr_html IS BOUND.
      gr_html->set_visible( space ).
    ENDIF.
    IF gr_dock IS BOUND.
      gr_dock->set_visible( space ).
    ENDIF.
  ELSE.
*== Doku exists: Set controls visible
    IF gr_html IS BOUND.
      gr_html->set_visible( 'X' ).
    ENDIF.
    IF gr_dock IS BOUND.
      gr_dock->set_visible( 'X' ).
    ENDIF.
  ENDIF.

  IF lt_lines IS NOT INITIAL.
*== doku exists:
    IF gr_html IS INITIAL.
*== Create HTML-Control
      CREATE OBJECT gr_html
        EXPORTING
          parent = gr_dock.
    ENDIF.


*==  Convert Docu to HTML
    CALL FUNCTION 'CONVERT_ITF_TO_HTML'
      EXPORTING
        i_header    = ls_header
      TABLES
        t_itf_text  = lt_lines
        t_html_text = lt_html
      EXCEPTIONS
        OTHERS      = 4.
    IF sy-subrc = 0.
*== Push data to control
      CALL METHOD gr_html->load_data
        IMPORTING
          assigned_url = lv_url
        CHANGING
          data_table   = lt_html
        EXCEPTIONS
          OTHERS       = 4.

      IF sy-subrc = 0.
*==  Display HTML-Text
        gr_html->show_url( lv_url ).
      ENDIF.
    ENDIF.
  ENDIF.

ENDMETHOD.
ENDCLASS.
