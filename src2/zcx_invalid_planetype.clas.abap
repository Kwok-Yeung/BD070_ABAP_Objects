class ZCX_INVALID_PLANETYPE definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.
*"* public components of class ZCX_INVALID_PLANETYPE
*"* do not include other source files here!!!

  interfaces IF_T100_MESSAGE .

  constants:
    begin of ZCX_INVALID_PLANETYPE,
      msgid type symsgid value 'ZBD070',
      msgno type symsgno value '020',
      attr1 type scx_attrname value 'PLANETYPE',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ZCX_INVALID_PLANETYPE .
  data PLANETYPE type S_PLANETYE .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !PLANETYPE type S_PLANETYE optional .
protected section.
*"* protected components of class ZCX_INVALID_PLANETYPE
*"* do not include other source files here!!!
private section.
*"* private components of class ZCX_INVALID_PLANETYPE
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCX_INVALID_PLANETYPE IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->PLANETYPE = PLANETYPE .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = ZCX_INVALID_PLANETYPE .
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
