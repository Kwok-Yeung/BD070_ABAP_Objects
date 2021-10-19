class ZCL_HOUSE definition
  public
  create public .

public section.
*"* public components of class ZCL_HOUSE
*"* do not include other source files here!!!

  methods CONSTRUCTOR
    importing
      !IM_NAME type STRING .
  methods DISPLAY_ATTRIBUTES .
protected section.
*"* protected components of class ZCL_HOUSE
*"* do not include other source files here!!!

  constants C_POS_1 type I value  30. "#EC NOTEXT
private section.
*"* private components of class ZCL_HOUSE
*"* do not include other source files here!!!

  data MV_NAME type STRING .
ENDCLASS.



CLASS ZCL_HOUSE IMPLEMENTATION.


METHOD CONSTRUCTOR.
  mv_name = im_name.
ENDMETHOD.


METHOD DISPLAY_ATTRIBUTES.
  WRITE:
    / 'Name of hotel'(001) , AT c_pos_1 mv_name.

ENDMETHOD.
ENDCLASS.
