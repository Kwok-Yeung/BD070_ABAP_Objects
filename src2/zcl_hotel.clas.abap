class ZCL_HOTEL definition
  public
  final
  create public .

public section.
*"* public components of class ZCL_HOTEL
*"* do not include other source files here!!!

  methods CONSTRUCTOR
    importing
      !IM_NAME type STRING
      !IM_BEDS type I .
  methods DISPLAY_ATTRIBUTES .
  class-methods DISPLAY_N_O_HOTELS .
protected section.
*"* protected components of class ZCL_HOTEL
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_HOTEL
*"* do not include other source files here!!!

  constants C_POS_1 type I value  30. "#EC NOTEXT
  data MV_NAME type STRING .
  data MV_BEDS type I .
  class-data GV_N_O_HOTELS type I .
ENDCLASS.



CLASS ZCL_HOTEL IMPLEMENTATION.


METHOD constructor.
  mv_name = im_name.
  mv_beds = im_beds.
ENDMETHOD.


METHOD display_attributes.
  WRITE:
    / 'Name of hotel'(001) , AT c_pos_1 mv_name,
    / 'Number of beds:'(002), AT c_pos_1 mv_beds.
ENDMETHOD.


method DISPLAY_N_O_HOTELS.
  WRITE:
    / 'Number of hotels'(003) , AT c_pos_1 gv_n_o_hotels.
endmethod.
ENDCLASS.
