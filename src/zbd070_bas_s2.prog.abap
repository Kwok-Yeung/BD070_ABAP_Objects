REPORT zbd070_bas_s2.

TYPE-POOLS icon.

*------------------------------------------------------------------*
* CLASS lcl_airplane DEFINITION                                    *
*------------------------------------------------------------------*
CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

    METHODS:
      set_attributes
        IMPORTING
          iv_name      TYPE string
          iv_planetype TYPE saplane-planetype,
      display_attributes.

    CLASS-METHODS:
      display_n_o_airplanes.

  PROTECTED SECTION.

  PRIVATE SECTION.

    CONSTANTS:
      c_pos_1 TYPE i VALUE 30.

    DATA:
      mv_name      TYPE string,
      mv_planetype TYPE saplane-planetype.

    CLASS-DATA:
      gv_n_o_airplanes TYPE i.

ENDCLASS. "lcl_airplane DEFINITION

*------------------------------------------------------------------*
* CLASS lcl_airplane IMPLEMENTATION                                *
*------------------------------------------------------------------*
CLASS lcl_airplane IMPLEMENTATION.
  METHOD set_attributes.

    mv_name = iv_name.
    mv_planetype = iv_planetype.

* doesn't make sense so much -
* only in order to get an effect
* after calling display_n_o_airplanes:
    gv_n_o_airplanes = gv_n_o_airplanes + 1.

  ENDMETHOD. "set_attributes

  METHOD display_attributes.
    DATA: lv_weight TYPE saplane-weight,
          lv_cap    TYPE saplane-tankcap.

    WRITE:
    / icon_ws_plane AS ICON,
    / 'Name of Airplane'(001) , AT c_pos_1 mv_name,
    / 'Type of Airplane:'(002), AT c_pos_1 mv_planetype.

  ENDMETHOD. "display_attributes

  METHOD display_n_o_airplanes.
    SKIP.
    WRITE:
    / 'Number of airplanes:'(ca1),
      AT c_pos_1 gv_n_o_airplanes LEFT-JUSTIFIED.
  ENDMETHOD. "display_n_o_airplanes

ENDCLASS. "lcl_airplane IMPLEMENTATION

DATA:
      go_airplane TYPE REF TO lcl_airplane.

DATA:
      gt_airplanes TYPE TABLE OF REF TO lcl_airplane.

START-OF-SELECTION.
*******************

* old syntax for object creation
* CREATE OBJECT go_airplane.

  go_airplane = NEW #( ).
  APPEND go_airplane TO gt_airplanes.

  go_airplane = NEW #( ).
  APPEND go_airplane TO gt_airplanes.

  go_airplane = NEW #( ).
  APPEND go_airplane TO gt_airplanes.
