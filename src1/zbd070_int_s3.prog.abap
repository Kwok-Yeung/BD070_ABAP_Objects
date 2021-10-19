REPORT zbd070_int_s3.

TYPE-POOLS icon.

INCLUDE zbd070_int_s3_agency.
INCLUDE zbd070_int_s3_carrier.
INCLUDE zbd070_int_s3_rental.



DATA:
  go_vehicle TYPE REF TO lcl_vehicle,
  go_truck   TYPE REF TO lcl_truck,
  go_bus     TYPE REF TO lcl_bus,
  go_rental  TYPE REF TO lcl_rental.

DATA:
  go_agency    TYPE REF TO lcl_travel_agency,
  go_carrier   TYPE REF TO lcl_carrier,
  go_airplane  TYPE REF TO lcl_airplane,
  go_cargo     TYPE REF TO lcl_cargo_plane,
  go_passenger TYPE REF TO lcl_passenger_plane,
  gv_count     TYPE i.

START-OF-SELECTION.
*******************

******* create travel_agency **********************************
  CREATE OBJECT go_agency
    EXPORTING
      iv_name = 'Travel&Smile Travel'.

******* create rental *****************************************
  CREATE OBJECT go_rental
    EXPORTING
      iv_name = 'Happy Car Rental'.

***** Insert rental company into partner list of travel agency
  go_agency->add_partner( go_rental ).

******* create truck ******************************************
  CREATE OBJECT go_truck
    EXPORTING
      iv_make  = 'MAN'
      iv_cargo = 45.
  go_rental->add_vehicle( go_truck ).

******* create bus ********************************************
  CREATE OBJECT go_bus
    EXPORTING
      iv_make       = 'Mercedes'
      iv_passengers = 80.
  go_rental->add_vehicle( go_bus ).

******* create truck ******************************************
  CREATE OBJECT go_truck
    EXPORTING
      iv_make  = 'VOLVO'
      iv_cargo = 48.
  go_rental->add_vehicle( go_truck ).

***** Create Carrier ******************************************
  CREATE OBJECT go_carrier
    EXPORTING
      iv_name = 'Smile&Fly-Travel'.

***** Insert carrier into business partner list of travel agency
  go_agency->add_partner( go_carrier ).

***** Passenger Plane *****************************************
  CREATE OBJECT go_passenger
    EXPORTING
      iv_name         = 'LH BERLIN'
      iv_planetype    = '747-400'
      iv_seats        = 345
    EXCEPTIONS
      wrong_planetype = 1.
  IF sy-subrc = 0.
    go_carrier->add_airplane( go_passenger ).
  ENDIF.

***** cargo Plane *********************************************
  CREATE OBJECT go_cargo
    EXPORTING
      iv_name         = 'US Hercules'
      iv_planetype    = '747-200F'
      iv_cargo        = 533
    EXCEPTIONS
      wrong_planetype = 1.
  IF sy-subrc = 0.
    go_carrier->add_airplane( go_cargo ).
  ENDIF.

******* show attributes of all partners of travel_agency ******
  go_agency->display_attributes( ).
