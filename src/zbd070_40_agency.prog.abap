*&---------------------------------------------------------------------*
*&  Include           ZBD070_GCL_S2_AGENCY
*&---------------------------------------------------------------------*

*INTERFACE lif_partner.
*  METHODS:
*    display_partner.
*  EVENTS:
*    partner_created.
*ENDINTERFACE. "lif_partner

*---------------------------------------------------------------------*
* CLASS lcl_travel_agency DEFINITION
*---------------------------------------------------------------------*
CLASS lcl_travel_agency DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING iv_name TYPE string,
      display_agency_partners,
      display_attributes.
    CLASS-METHODS:
    get_instance
    RETURNING VALUE(r_instance) TYPE REF TO lcl_travel_agency.

  PRIVATE SECTION.

     Class-Data instance TYPE REF TO lcl_travel_agency.

    DATA:
      mv_name     TYPE string,
      mt_partners TYPE TABLE OF REF TO zif_partner.

    METHODS:
      on_partner_created FOR EVENT partner_created
                    OF zif_partner
        IMPORTING sender.

ENDCLASS. "lcl_travel_agency DEFINITION

*---------------------------------------------------------------------*
* CLASS lcl_travel_agency IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS lcl_travel_agency IMPLEMENTATION.

  METHOD display_attributes.
    WRITE: / icon_private_files AS ICON,
          'Travel Agency:'(007), mv_name.
    ULINE.
    display_agency_partners( ).
  ENDMETHOD. "display_attributes

  METHOD display_agency_partners.
    WRITE 'Here are the partners of the travel agency:'(008).
    ULINE.
    LOOP AT mt_partners INTO DATA(lo_partner).
      lo_partner->display_partner( ).
    ENDLOOP.
  ENDMETHOD. "display_agency_partners

  METHOD constructor.
    mv_name = iv_name.
    SET HANDLER on_partner_created FOR ALL INSTANCES.
  ENDMETHOD. "constructor

  METHOD on_partner_created.
    APPEND sender TO mt_partners.
  ENDMETHOD. "on_partner_created
METHOD get_instance.
  If instance is not BOUND.
    CREATE OBJECT instance
      EXPORTING
        iv_name = 'Travel&Smile Travel'
      .
    ENDIF.
  r_instance = instance.
  Endmethod.

ENDCLASS. "lcl_travel_agency IMPLEMENTATION
