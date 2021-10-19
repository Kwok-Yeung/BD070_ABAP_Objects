class ZCL_40_HOTEL definition
  public
  final
  create public .

public section.

  interfaces ZIF_40_PARTNER .

  methods CONSTRUCTOR
    importing
      value(IM_NAME) type STRING
      value(IM_BEDS) type I .
  methods DISPLAY_ATTRIBUTES .
  class-methods DISPLAY_N_O_HOTELS .
protected section.
private section.

  constants C_POS_1 type I value 30 ##NO_TEXT.
  data MV_NAME type STRING .
  data MV_BEDS type I .
  class-data GV_N_O_HOTELS type I .
ENDCLASS.



CLASS ZCL_40_HOTEL IMPLEMENTATION.


  method CONSTRUCTOR.
    mv_name = im_name.
  mv_beds = im_beds.
  endmethod.


  method DISPLAY_ATTRIBUTES.
    WRITE:
    / 'Name of hotel'(001) , AT c_pos_1 mv_name,
    / 'Number of beds:'(002), AT c_pos_1 mv_beds.
  endmethod.


  method DISPLAY_N_O_HOTELS.
      WRITE:
    / 'Number of hotels'(003) , AT c_pos_1 gv_n_o_hotels.
  endmethod.
ENDCLASS.
