*&---------------------------------------------------------------------*
REPORT  zbd070_alvs_s1.

*---------------------------------------------------------------------*
* CLASS lcl_event_handler DEFINITION
*---------------------------------------------------------------------*
CLASS lcl_event_handler DEFINITION.
  PUBLIC SECTION.

    METHODS on_double_click FOR EVENT double_click
                  OF cl_salv_events_table
      IMPORTING row column.

ENDCLASS. "lcl_event_handler DEFINITION


************** Types and Data Definitions ************************

TYPES: ty_spfli TYPE STANDARD TABLE OF spfli
                WITH NON-UNIQUE KEY carrid connid.

DATA: ok_code TYPE sy-ucomm.

DATA: go_handler   TYPE REF TO lcl_event_handler,
      go_container TYPE REF TO cl_gui_custom_container,
      go_alv_grid  TYPE REF TO cl_salv_table.

DATA: gt_spfli TYPE ty_spfli.

*---------------------------------------------------------------------*
* CLASS lcl_event_handler IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS lcl_event_handler IMPLEMENTATION.

  METHOD on_double_click.

    MESSAGE i010(zbd070) WITH row column.

  ENDMETHOD. "handler_method
ENDCLASS. "lcl_event_handler IMPLEMENTATION


START-OF-SELECTION.
********************

  SELECT * FROM spfli INTO TABLE @gt_spfli.

  CALL SCREEN '0100'.

*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'DYNPROSTATUS'.
  SET TITLEBAR 'TITLE1'.
ENDMODULE. " STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*& Module ALV_GRID OUTPUT
*&---------------------------------------------------------------------*
MODULE alv_grid OUTPUT.
*** Create object of class CL_GUI_CUSTOM_CAONTAINER to manage data !
  IF go_container IS NOT BOUND.
    CREATE OBJECT go_container
      EXPORTING
        container_name = 'CONTAINER_1'
      EXCEPTIONS
        OTHERS         = 6.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
*** create object of class cl_salv_table to visualize data !
    cl_salv_table=>factory(
      EXPORTING
*        list_display   = if_salv_c_bool_sap=>false " ALV wird im Listenmodus angezeigt
        r_container    = go_container              " Abstracter Container fuer GUI Controls
*        container_name =
      IMPORTING
        r_salv_table   = go_alv_grid               " Basisklasse einfache ALV Tabellen
      CHANGING
        t_table        = gt_spfli
    ).
*    CATCH cx_salv_msg. " ALV: Allg. Fehlerklasse  mit Meldung

*** create handler instance and register handler method *******
    CREATE OBJECT go_handler.
    SET HANDLER go_handler->on_double_click FOR go_alv_grid->get_event( ).

*** Call method to visualize data of internal table ************
    go_alv_grid->display( ).
  ENDIF.
ENDMODULE. " ALV_GRID OUTPUT

*&---------------------------------------------------------------------*
*& Module USER_COMMAND_0100 INPUT
*&---------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE ok_code.
    WHEN 'BACK'.
      SET SCREEN 0.
    WHEN 'EXIT'.
      LEAVE PROGRAM.
  ENDCASE.
ENDMODULE. " USER_COMMAND_0100 INPUT
