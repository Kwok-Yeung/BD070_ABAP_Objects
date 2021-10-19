*&---------------------------------------------------------------------*
REPORT  zbd070_alvs_t1.


************** Types and Data Definitions ************************

TYPES: ty_spfli TYPE STANDARD TABLE OF spfli
                WITH NON-UNIQUE KEY carrid connid.

DATA: ok_code TYPE sy-ucomm.

DATA: gt_spfli TYPE ty_spfli.

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
*** Create object of class CL_GUI_CUSTOM_CONTAINER to manage data !

*** create object of class cl_salv_table to visualize data !

*** create handler instance and register handler method *******

*** Call method to visualize data of internal table ************

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
