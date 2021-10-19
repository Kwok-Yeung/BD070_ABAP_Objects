*&---------------------------------------------------------------------*
*&  Include           ZBD070_INT_T2_AGENCY
*&---------------------------------------------------------------------*
INTERFACE lif_partner.
  METHODS:
    display_partner.
ENDINTERFACE. "lif_partner

*---------------------------------------------------------------------*
* CLASS lcl_travel_agency DEFINITION
*---------------------------------------------------------------------*
CLASS lcl_travel_agency DEFINITION.

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING iv_name TYPE string,
      display_attributes.

  PRIVATE SECTION.

    DATA:
      mv_name TYPE string.

ENDCLASS. "lcl_travel_agency DEFINITION

*---------------------------------------------------------------------*
* CLASS lcl_travel_agency IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS lcl_travel_agency IMPLEMENTATION.

  METHOD display_attributes.
    WRITE: / icon_private_files AS ICON,
          'Travel Agency:'(007), mv_name.
    ULINE.
  ENDMETHOD. "display_attributes


  METHOD constructor.
    mv_name = iv_name.
  ENDMETHOD. "constructor

ENDCLASS. "lcl_travel_agency IMPLEMENTATION
