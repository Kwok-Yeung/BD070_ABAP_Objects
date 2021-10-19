*----------------------------------------------------------------------*
***INCLUDE LBC402_FMDD_WAITLISTO01 .
*----------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS space.
  SET TITLEBAR 'WLIST'.

ENDMODULE.                             " STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*
*&      Module  DISPLAY_LIST_0100  OUTPUT
*&---------------------------------------------------------------------*
*       displays the waiting list
*----------------------------------------------------------------------*
MODULE display_list_0100 OUTPUT.
  SUPPRESS DIALOG.
  LEAVE TO LIST-PROCESSING AND RETURN TO SCREEN 0.

  LOOP AT cust_list INTO wa_cust.
    WRITE: / sy-tabix,
             wa_cust-id COLOR COL_KEY,
             wa_cust-name,
             wa_cust-city,
             wa_cust-app_date.
  ENDLOOP.

ENDMODULE.                             " DISPLAY_LIST_0100  OUTPUT
