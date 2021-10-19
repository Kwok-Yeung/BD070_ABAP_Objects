class ZCL_BD070_SAPLANE definition
  public
  final
  create protected

  global friends ZCB_BD070_SAPLANE .

public section.

  interfaces IF_OS_STATE .

  methods SET_WEI_UNIT
    importing
      !I_WEI_UNIT type S_WEI_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_WEIGHT
    importing
      !I_WEIGHT type S_PLAN_WEI
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_TANKCAP
    importing
      !I_TANKCAP type S_CAPACITY
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_SPEED_UNIT
    importing
      !I_SPEED_UNIT type S_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_SPAN_UNIT
    importing
      !I_SPAN_UNIT type S_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_SPAN
    importing
      !I_SPAN type S_SPAN
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_SEATSMAX_B
    importing
      !I_SEATSMAX_B type S_SMAX_B
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_SEATSMAX
    importing
      !I_SEATSMAX type S_SEATSMAX
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_PRODUCER
    importing
      !I_PRODUCER type S_PROD
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_OP_SPEED
    importing
      !I_OP_SPEED type S_SPEED
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_LENG_UNIT
    importing
      !I_LENG_UNIT type S_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_LENG
    importing
      !I_LENG type S_LENGTH
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CON_UNIT
    importing
      !I_CON_UNIT type S_CONUNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CONSUM
    importing
      !I_CONSUM type S_CONSUM
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CAP_UNIT
    importing
      !I_CAP_UNIT type S_CAPUNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_WEI_UNIT
    returning
      value(RESULT) type S_WEI_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_WEIGHT
    returning
      value(RESULT) type S_PLAN_WEI
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_TANKCAP
    returning
      value(RESULT) type S_CAPACITY
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_SPEED_UNIT
    returning
      value(RESULT) type S_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_SPAN_UNIT
    returning
      value(RESULT) type S_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_SPAN
    returning
      value(RESULT) type S_SPAN
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_SEATSMAX_B
    returning
      value(RESULT) type S_SMAX_B
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_SEATSMAX
    returning
      value(RESULT) type S_SEATSMAX
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_PRODUCER
    returning
      value(RESULT) type S_PROD
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_PLANETYPE
    returning
      value(RESULT) type S_PLANETYE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_OP_SPEED
    returning
      value(RESULT) type S_SPEED
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_LENG_UNIT
    returning
      value(RESULT) type S_UNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_LENG
    returning
      value(RESULT) type S_LENGTH
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CON_UNIT
    returning
      value(RESULT) type S_CONUNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CONSUM
    returning
      value(RESULT) type S_CONSUM
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CAP_UNIT
    returning
      value(RESULT) type S_CAPUNIT
    raising
      CX_OS_OBJECT_NOT_FOUND .
protected section.

  data PLANETYPE type S_PLANETYE .
  data SEATSMAX type S_SEATSMAX .
  data CONSUM type S_CONSUM .
  data CON_UNIT type S_CONUNIT .
  data TANKCAP type S_CAPACITY .
  data CAP_UNIT type S_CAPUNIT .
  data WEIGHT type S_PLAN_WEI .
  data WEI_UNIT type S_WEI_UNIT .
  data SPAN type S_SPAN .
  data SPAN_UNIT type S_UNIT .
  data LENG type S_LENGTH .
  data LENG_UNIT type S_UNIT .
  data OP_SPEED type S_SPEED .
  data SPEED_UNIT type S_UNIT .
  data PRODUCER type S_PROD .
  data SEATSMAX_B type S_SMAX_B .
private section.

  data SEATSMAX_F type S_SMAX_F .

  methods GET_SEATSMAX_F
    returning
      value(RESULT) type S_SMAX_F
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_SEATSMAX_F
    importing
      !I_SEATSMAX_F type S_SMAX_F
    raising
      CX_OS_OBJECT_NOT_FOUND .
ENDCLASS.



CLASS ZCL_BD070_SAPLANE IMPLEMENTATION.


  method GET_CAP_UNIT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CAP_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CAP_UNIT.

           " GET_CAP_UNIT
  endmethod.


  method GET_CONSUM.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CONSUM
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CONSUM.

           " GET_CONSUM
  endmethod.


  method GET_CON_UNIT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CON_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CON_UNIT.

           " GET_CON_UNIT
  endmethod.


  method GET_LENG.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute LENG
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = LENG.

           " GET_LENG
  endmethod.


  method GET_LENG_UNIT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute LENG_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = LENG_UNIT.

           " GET_LENG_UNIT
  endmethod.


  method GET_OP_SPEED.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute OP_SPEED
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = OP_SPEED.

           " GET_OP_SPEED
  endmethod.


  method GET_PLANETYPE.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute PLANETYPE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = PLANETYPE.

           " GET_PLANETYPE
  endmethod.


  method GET_PRODUCER.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute PRODUCER
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = PRODUCER.

           " GET_PRODUCER
  endmethod.


  method GET_SEATSMAX.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute SEATSMAX
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = SEATSMAX.

           " GET_SEATSMAX
  endmethod.


  method GET_SEATSMAX_B.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute SEATSMAX_B
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = SEATSMAX_B.

           " GET_SEATSMAX_B
  endmethod.


  method GET_SEATSMAX_F.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute SEATSMAX_F
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = SEATSMAX_F.

           " GET_SEATSMAX_F
  endmethod.


  method GET_SPAN.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute SPAN
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = SPAN.

           " GET_SPAN
  endmethod.


  method GET_SPAN_UNIT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute SPAN_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = SPAN_UNIT.

           " GET_SPAN_UNIT
  endmethod.


  method GET_SPEED_UNIT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute SPEED_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = SPEED_UNIT.

           " GET_SPEED_UNIT
  endmethod.


  method GET_TANKCAP.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute TANKCAP
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = TANKCAP.

           " GET_TANKCAP
  endmethod.


  method GET_WEIGHT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute WEIGHT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = WEIGHT.

           " GET_WEIGHT
  endmethod.


  method GET_WEI_UNIT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute WEI_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = WEI_UNIT.

           " GET_WEI_UNIT
  endmethod.


  method IF_OS_STATE~GET.
***BUILD 090501
     " returning result type ref to object
************************************************************************
* Purpose        : Get state.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* GENERATED: Do not modify
************************************************************************

  data: STATE_OBJECT type ref to CL_OS_STATE.

  create object STATE_OBJECT.
  call method STATE_OBJECT->SET_STATE_FROM_OBJECT( ME ).
  result = STATE_OBJECT.

  endmethod.


  method IF_OS_STATE~HANDLE_EXCEPTION.
***BUILD 090501
     " importing I_EXCEPTION type ref to IF_OS_EXCEPTION_INFO optional
     " importing I_EX_OS type ref to CX_OS_OBJECT_NOT_FOUND optional
************************************************************************
* Purpose        : Handles exceptions during attribute access.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : If an exception is raised during attribut access,
*                  this method is called and the exception is passed
*                  as a paramater. The default is to raise the exception
*                  again, so that the caller can handle the exception.
*                  But it is also possible to handle the exception
*                  here in the callee.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
* - 2000-08-02   : (SB)  OO Exceptions
************************************************************************
* Modify if you like
************************************************************************

  if i_ex_os is not initial.
    raise exception i_ex_os.
  endif.

  endmethod.


  method IF_OS_STATE~INIT.
***BUILD 090501
"#EC NEEDED
************************************************************************
* Purpose        : Initialisation of the transient state partition.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : Transient state is initial.
*
* OO Exceptions  : -
*
* Implementation : Caution!: Avoid Throwing ACCESS Events.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* Modify if you like
************************************************************************

  endmethod.


  method IF_OS_STATE~INVALIDATE.
***BUILD 090501
"#EC NEEDED
************************************************************************
* Purpose        : Do something before all persistent attributes are
*                  cleared.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : Whatever you like to do.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* Modify if you like
************************************************************************

  endmethod.


  method IF_OS_STATE~SET.
***BUILD 090501
     " importing I_STATE type ref to object
************************************************************************
* Purpose        : Set state.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* GENERATED: Do not modify
************************************************************************

  data: STATE_OBJECT type ref to CL_OS_STATE.

  STATE_OBJECT ?= I_STATE.
  call method STATE_OBJECT->SET_OBJECT_FROM_STATE( ME ).

  endmethod.


  method SET_CAP_UNIT.
***BUILD 090501
     " importing I_CAP_UNIT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CAP_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CAP_UNIT <> CAP_UNIT ).

    CAP_UNIT = I_CAP_UNIT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CAP_UNIT <> CAP_UNIT )

           " GET_CAP_UNIT
  endmethod.


  method SET_CONSUM.
***BUILD 090501
     " importing I_CONSUM
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CONSUM
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CONSUM <> CONSUM ).

    CONSUM = I_CONSUM.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CONSUM <> CONSUM )

           " GET_CONSUM
  endmethod.


  method SET_CON_UNIT.
***BUILD 090501
     " importing I_CON_UNIT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CON_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CON_UNIT <> CON_UNIT ).

    CON_UNIT = I_CON_UNIT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CON_UNIT <> CON_UNIT )

           " GET_CON_UNIT
  endmethod.


  method SET_LENG.
***BUILD 090501
     " importing I_LENG
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute LENG
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_LENG <> LENG ).

    LENG = I_LENG.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_LENG <> LENG )

           " GET_LENG
  endmethod.


  method SET_LENG_UNIT.
***BUILD 090501
     " importing I_LENG_UNIT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute LENG_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_LENG_UNIT <> LENG_UNIT ).

    LENG_UNIT = I_LENG_UNIT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_LENG_UNIT <> LENG_UNIT )

           " GET_LENG_UNIT
  endmethod.


  method SET_OP_SPEED.
***BUILD 090501
     " importing I_OP_SPEED
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute OP_SPEED
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_OP_SPEED <> OP_SPEED ).

    OP_SPEED = I_OP_SPEED.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_OP_SPEED <> OP_SPEED )

           " GET_OP_SPEED
  endmethod.


  method SET_PRODUCER.
***BUILD 090501
     " importing I_PRODUCER
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute PRODUCER
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_PRODUCER <> PRODUCER ).

    PRODUCER = I_PRODUCER.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_PRODUCER <> PRODUCER )

           " GET_PRODUCER
  endmethod.


  method SET_SEATSMAX.
***BUILD 090501
     " importing I_SEATSMAX
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute SEATSMAX
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_SEATSMAX <> SEATSMAX ).

    SEATSMAX = I_SEATSMAX.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_SEATSMAX <> SEATSMAX )

           " GET_SEATSMAX
  endmethod.


  method SET_SEATSMAX_B.
***BUILD 090501
     " importing I_SEATSMAX_B
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute SEATSMAX_B
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_SEATSMAX_B <> SEATSMAX_B ).

    SEATSMAX_B = I_SEATSMAX_B.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_SEATSMAX_B <> SEATSMAX_B )

           " GET_SEATSMAX_B
  endmethod.


  method SET_SEATSMAX_F.
***BUILD 090501
     " importing I_SEATSMAX_F
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute SEATSMAX_F
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_SEATSMAX_F <> SEATSMAX_F ).

    SEATSMAX_F = I_SEATSMAX_F.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_SEATSMAX_F <> SEATSMAX_F )

           " GET_SEATSMAX_F
  endmethod.


  method SET_SPAN.
***BUILD 090501
     " importing I_SPAN
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute SPAN
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_SPAN <> SPAN ).

    SPAN = I_SPAN.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_SPAN <> SPAN )

           " GET_SPAN
  endmethod.


  method SET_SPAN_UNIT.
***BUILD 090501
     " importing I_SPAN_UNIT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute SPAN_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_SPAN_UNIT <> SPAN_UNIT ).

    SPAN_UNIT = I_SPAN_UNIT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_SPAN_UNIT <> SPAN_UNIT )

           " GET_SPAN_UNIT
  endmethod.


  method SET_SPEED_UNIT.
***BUILD 090501
     " importing I_SPEED_UNIT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute SPEED_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_SPEED_UNIT <> SPEED_UNIT ).

    SPEED_UNIT = I_SPEED_UNIT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_SPEED_UNIT <> SPEED_UNIT )

           " GET_SPEED_UNIT
  endmethod.


  method SET_TANKCAP.
***BUILD 090501
     " importing I_TANKCAP
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute TANKCAP
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_TANKCAP <> TANKCAP ).

    TANKCAP = I_TANKCAP.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_TANKCAP <> TANKCAP )

           " GET_TANKCAP
  endmethod.


  method SET_WEIGHT.
***BUILD 090501
     " importing I_WEIGHT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute WEIGHT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_WEIGHT <> WEIGHT ).

    WEIGHT = I_WEIGHT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_WEIGHT <> WEIGHT )

           " GET_WEIGHT
  endmethod.


  method SET_WEI_UNIT.
***BUILD 090501
     " importing I_WEI_UNIT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute WEI_UNIT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_WEI_UNIT <> WEI_UNIT ).

    WEI_UNIT = I_WEI_UNIT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_WEI_UNIT <> WEI_UNIT )

           " GET_WEI_UNIT
  endmethod.
ENDCLASS.
