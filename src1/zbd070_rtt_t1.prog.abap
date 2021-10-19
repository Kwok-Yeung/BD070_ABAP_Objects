*&---------------------------------------------------------------------*
*& Report  ZBD070_RTT_S1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zbd070_rtt_t1.

TYPE-POOLS icon.

INCLUDE zbd070_rtt_t1_agency.
INCLUDE zbd070_rtt_t1_carrier.
INCLUDE zbd070_rtt_t1_rental.



DATA:
  go_hotel     TYPE REF TO zcl_hotel2,
  go_vehicle   TYPE REF TO lcl_vehicle,
  go_truck     TYPE REF TO lcl_truck,
  go_bus       TYPE REF TO lcl_bus,
  go_rental    TYPE REF TO lcl_rental,
  go_passenger TYPE REF TO lcl_passenger_plane,
  go_cargo     TYPE REF TO lcl_cargo_plane,
  go_carrier   TYPE REF TO lcl_carrier,
  go_agency    TYPE REF TO lcl_travel_agency.

DATA:
  gv_text      TYPE string,
  gx_inv_value TYPE REF TO zcx_invalid_value.

START-OF-SELECTION.
*******************

******* create travel_agency **********************************
  go_agency = NEW #( iv_name = 'Travel&Smile Travel' ).

******* create hotel ******************************************
  go_hotel = NEW #(
      im_name = 'Sleep Well Hotel'
      im_beds = 345
  ).


******* create rental *****************************************
  go_rental = NEW #(
      iv_name = 'Happy Car Rental' ).


******* create truck ******************************************
  go_truck = NEW #(
      iv_make  = 'MAN'
      iv_cargo = 45 ).

******* create bus ********************************************
  go_bus = NEW #(
      iv_make       = 'Mercedes'
      iv_passengers = 80 ).

******* create truck ******************************************
  go_truck = NEW #(
      iv_make  = 'VOLVO'
      iv_cargo = 48 ).

***** Create Carrier ******************************************
  go_carrier = NEW #(
      iv_name = 'Smile&Fly-Travel' ).



***** Passenger Plane *****************************************
  TRY.
      go_passenger = NEW #(
          iv_name      = 'LH BERLIN'
          iv_planetype = '747-500'
          iv_seats     = 345 ).

    CATCH zcx_invalid_value INTO gx_inv_value.
      gv_text = gx_inv_value->get_text( ).
      WRITE:
        / icon_failure AS ICON,
          gv_text.

      gv_text = gx_inv_value->previous->get_text( ).
      WRITE:
        / icon_failure AS ICON,
          gv_text.

  ENDTRY.



***** cargo Plane *********************************************
  TRY.
      go_cargo = NEW #(
          iv_name      = 'US Hercules'
          iv_planetype = '747-200F'
          iv_cargo     = 533 ).

    CATCH zcx_invalid_value INTO gx_inv_value.
      gv_text = gx_inv_value->get_text( ).
      WRITE:
        / icon_failure AS ICON,
          gv_text.

      gv_text = gx_inv_value->previous->get_text( ).
      WRITE:
        / icon_failure AS ICON,
          gv_text.

  ENDTRY.



******* show attributes of all partners of travel_agency ******
  go_agency->display_attributes( ).
