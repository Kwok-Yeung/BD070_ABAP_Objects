class ZCL_HOTEL3 definition
  public
  inheriting from ZCL_HOUSE
  final
  create public .

public section.
*"* public components of class ZCL_HOTEL3
*"* do not include other source files here!!!

  interfaces ZIF_PARTNER .

  methods CONSTRUCTOR
    importing
      !IM_NAME type STRING
      !IM_BEDS type I .
  class-methods DISPLAY_N_O_HOTELS .

  methods DISPLAY_ATTRIBUTES
    redefinition .
protected section.
*"* protected components of class ZCL_HOTEL3
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_HOTEL3
*"* do not include other source files here!!!

  data MV_BEDS type I .
  class-data GV_N_O_HOTELS type I .
ENDCLASS.



CLASS ZCL_HOTEL3 IMPLEMENTATION.


METHOD constructor.
  super->constructor( im_name = im_name ).
  me->mv_beds = im_beds.
  RAISE EVENT zif_partner~partner_created.
ENDMETHOD.


METHOD display_attributes.
  super->display_attributes( ).

  WRITE :   / 'Number of beds:'(002), AT c_pos_1 mv_beds.
ENDMETHOD.


method DISPLAY_N_O_HOTELS.
  WRITE:
    / 'Number of hotels'(003) , AT c_pos_1 gv_n_o_hotels.
endmethod.


method ZIF_PARTNER~DISPLAY_PARTNER.
  display_attributes( ).
endmethod.
ENDCLASS.
