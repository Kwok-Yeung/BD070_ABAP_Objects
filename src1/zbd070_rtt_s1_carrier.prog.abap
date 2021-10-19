*&---------------------------------------------------------------------*
*&  Include           ZBD070_RTT_S1_CARRIER
*&---------------------------------------------------------------------*

*------------------------------------------------------------------*
* CLASS lcl_airplane DEFINITION                                    *
*------------------------------------------------------------------*
CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    METHODS:
      constructor
        IMPORTING
          iv_name      TYPE string
          iv_planetype TYPE saplane-planetype
        RAISING
          zcx_invalid_value,

      display_attributes.

    CLASS-METHODS:
      class_constructor,
      display_n_o_airplanes,
      get_n_o_airplanes
        RETURNING VALUE(rv_count) TYPE i.

    EVENTS:
      airplane_created.

  PROTECTED SECTION.

    CONSTANTS:
      c_pos_1 TYPE i VALUE 30.

  PRIVATE SECTION.

    TYPES:
      ty_planetypes TYPE STANDARD TABLE OF saplane
                                  WITH NON-UNIQUE KEY planetype.

    DATA:
      mv_name      TYPE string,
      mv_planetype TYPE saplane-planetype,
      mv_weight    TYPE saplane-weight,
      mv_tankcap   TYPE saplane-tankcap.

    CLASS-DATA:
      gv_n_o_airplanes TYPE i,
      gt_planetypes    TYPE ty_planetypes.

    CLASS-METHODS:
      get_technical_attributes
        IMPORTING
                  iv_type    TYPE saplane-planetype
        EXPORTING
                  ev_weight  TYPE saplane-weight
                  ev_tankcap TYPE saplane-tankcap
        RAISING   zcx_invalid_planetype.

ENDCLASS. "lcl_airplane DEFINITION

*------------------------------------------------------------------*
* CLASS lcl_airplane IMPLEMENTATION                                *
*------------------------------------------------------------------*
CLASS lcl_airplane IMPLEMENTATION.

  METHOD class_constructor.
    SELECT planetype, tankcap, weight FROM saplane
      INTO CORRESPONDING FIELDS OF TABLE @gt_planetypes.
  ENDMETHOD. "class_constructor

  METHOD constructor.

    DATA:
      lx_inv_planetype TYPE REF TO zcx_invalid_planetype.

    mv_name = iv_name.
    mv_planetype = iv_planetype.

    TRY.
        get_technical_attributes(
          EXPORTING
            iv_type = iv_planetype
          IMPORTING
            ev_weight = mv_weight
            ev_tankcap = mv_tankcap ).

        gv_n_o_airplanes = gv_n_o_airplanes + 1.
        RAISE EVENT airplane_created.
      CATCH zcx_invalid_planetype INTO lx_inv_planetype.
        RAISE EXCEPTION TYPE zcx_invalid_value
          EXPORTING
            parnam   = 'IV_PLANETYPE'
            previous = lx_inv_planetype.
    ENDTRY.
  ENDMETHOD. "constructor

  METHOD display_attributes.
    DATA: lv_weight TYPE saplane-weight,
          lv_cap    TYPE saplane-tankcap.

    WRITE:
    / icon_ws_plane AS ICON,
    / 'Name of Airplane'(001) , AT c_pos_1 mv_name,
    / 'Type of Airplane:'(002), AT c_pos_1 mv_planetype,
    / 'Weight:'(003), AT c_pos_1 mv_weight LEFT-JUSTIFIED,
    / 'Tank capacity:'(004), AT c_pos_1 mv_tankcap LEFT-JUSTIFIED.

  ENDMETHOD. "display_attributes

  METHOD display_n_o_airplanes.
    SKIP.
    WRITE:
    / 'Number of airplanes:'(ca1),
      AT c_pos_1 gv_n_o_airplanes LEFT-JUSTIFIED.
  ENDMETHOD. "display_n_o_airplanes

  METHOD get_n_o_airplanes.
    rv_count = gv_n_o_airplanes.
  ENDMETHOD. "get_n_o_airplanes

  METHOD get_technical_attributes.
    READ TABLE gt_planetypes INTO DATA(ls_planetype)
                             WITH TABLE KEY planetype = iv_type
                             TRANSPORTING weight tankcap.
    IF sy-subrc = 0.
      ev_weight = ls_planetype-weight.
      ev_tankcap = ls_planetype-tankcap.
    ELSE.
      RAISE EXCEPTION TYPE zcx_invalid_planetype
        EXPORTING
          planetype = iv_type.
    ENDIF.
  ENDMETHOD. "get_technical_attributes

ENDCLASS. "lcl_airplane IMPLEMENTATION

*---------------------------------------------------------------------*
* CLASS lcl_cargo_plane DEFINITION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
CLASS lcl_cargo_plane DEFINITION INHERITING FROM lcl_airplane.

  PUBLIC SECTION.

    METHODS:
      constructor
        IMPORTING
          iv_name      TYPE string
          iv_planetype TYPE saplane-planetype
          iv_cargo     TYPE s_plan_car
        RAISING
          zcx_invalid_value,

      display_attributes REDEFINITION,

      get_cargo RETURNING VALUE(rv_cargo) TYPE s_plan_car.

  PRIVATE SECTION.
    DATA:
      mv_cargo TYPE s_plan_car.

ENDCLASS. "lcl_cargo_plane DEFINITION

*---------------------------------------------------------------------*
* CLASS lcl_cargo_plane IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS lcl_cargo_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor(
      EXPORTING
        iv_name = iv_name
        iv_planetype = iv_planetype ).

    mv_cargo = iv_cargo.
  ENDMETHOD. "constructor

  METHOD get_cargo.
    rv_cargo = mv_cargo.
  ENDMETHOD. "get_cargo

  METHOD display_attributes.
    super->display_attributes( ).
    WRITE:
      / 'Max Cargo:'(005), AT c_pos_1 mv_cargo LEFT-JUSTIFIED.
    ULINE.
  ENDMETHOD. "display_attributes

ENDCLASS. "lcl_cargo_plane IMPLEMENTATION

*---------------------------------------------------------------------*
* CLASS lcl_passenger_plane DEFINITION
*---------------------------------------------------------------------*
CLASS lcl_passenger_plane DEFINITION INHERITING FROM lcl_airplane.

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          iv_name      TYPE string
          iv_planetype TYPE saplane-planetype
          iv_seats     TYPE s_seatsmax
        RAISING
          zcx_invalid_value,

      display_attributes REDEFINITION.

  PRIVATE SECTION.
    DATA:
      mv_seats TYPE s_seatsmax.

ENDCLASS. "lcl_passenger_plane DEFINITION

*---------------------------------------------------------------------*
* CLASS lcl_passenger_plane IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS lcl_passenger_plane IMPLEMENTATION.

  METHOD constructor.
    super->constructor(
      EXPORTING
       iv_name = iv_name
       iv_planetype = iv_planetype ).

    mv_seats = iv_seats.
  ENDMETHOD. "constructor

  METHOD display_attributes.
    super->display_attributes( ).
    WRITE:
      / 'Max Seats:'(006), AT c_pos_1 mv_seats LEFT-JUSTIFIED.
    ULINE.
  ENDMETHOD. "display_attributes

ENDCLASS. "lcl_passenger_plane IMPLEMENTATION

*---------------------------------------------------------------------*
* CLASS lcl_carrier DEFINITION
*---------------------------------------------------------------------*
CLASS lcl_carrier DEFINITION.

  PUBLIC SECTION.
    INTERFACES:
      zif_partner.

    METHODS:
      constructor IMPORTING iv_name TYPE string,
      display_attributes,
      add_airplane IMPORTING io_plane TYPE REF TO lcl_airplane.

  PRIVATE SECTION.
    DATA:
      mv_name      TYPE string,
      mt_airplanes TYPE TABLE OF REF TO lcl_airplane.

    METHODS:
      on_airplane_created FOR EVENT airplane_created
                    OF lcl_airplane
        IMPORTING sender,

      display_airplanes,
      get_max_cargo RETURNING VALUE(rv_max_cargo) TYPE s_plan_car.
ENDCLASS. "lcl_carrier DEFINITION

*---------------------------------------------------------------------*
* CLASS lcl_carrier IMPLEMENTATION
*---------------------------------------------------------------------*
CLASS lcl_carrier IMPLEMENTATION.

  METHOD constructor.
    mv_name = iv_name.
    SET HANDLER on_airplane_created FOR ALL INSTANCES.
    RAISE EVENT zif_partner~partner_created.
  ENDMETHOD. "constructor

  METHOD on_airplane_created.
    APPEND sender TO mt_airplanes.
  ENDMETHOD. "on_airplane_created

  METHOD display_attributes.
    DATA:
      lv_max_cargo TYPE s_plan_car.

    SKIP 2.
    WRITE: icon_flight AS ICON,
           mv_name.
    ULINE.
    ULINE.
    me->display_airplanes( ).

    lv_max_cargo = me->get_max_cargo( ).
    WRITE: / 'Capacity of biggest cargo plane:'(max),
             lv_max_cargo LEFT-JUSTIFIED.

  ENDMETHOD. "display_attributes

  METHOD add_airplane.
    APPEND io_plane TO mt_airplanes.
  ENDMETHOD. "add_airplane

  METHOD display_airplanes.
    DATA: lo_plane TYPE REF TO lcl_airplane.

    LOOP AT mt_airplanes INTO lo_plane.
      lo_plane->display_attributes( ).
    ENDLOOP.
  ENDMETHOD. "display_airplanes

  METHOD get_max_cargo.
    DATA:
      lo_plane TYPE REF TO lcl_airplane,
      lo_cargo TYPE REF TO lcl_cargo_plane.
    DATA:
      lo_descr TYPE REF TO cl_abap_typedescr.

    LOOP AT mt_airplanes INTO lo_plane.
      lo_descr = cl_abap_typedescr=>describe_by_object_ref( lo_plane ).
      IF lo_descr->get_relative_name( ) = 'LCL_CARGO_PLANE'.
        lo_cargo ?= lo_plane.
        IF rv_max_cargo < lo_cargo->get_cargo( ).
          rv_max_cargo = lo_cargo->get_cargo( ).
        ENDIF.
      ENDIF.

* TRY.
* lo_cargo ?= lo_plane.
**
*      IF rv_max_cargo < lo_cargo->get_cargo( ).
* rv_max_cargo = lo_cargo->get_cargo( ).
* ENDIF.
**
*        CATCH cx_sy_move_cast_error.
** plane is not a cargo plane - do nothing
* ENDTRY.

    ENDLOOP.
  ENDMETHOD. "get_max_cargo

  METHOD zif_partner~display_partner.
    me->display_attributes( ).
  ENDMETHOD. "zif_partner~display_partner

ENDCLASS. "lcl_carrier IMPLEMENTATION
