class ZCA_BD070_SAPLANE definition
  public
  inheriting from ZCB_BD070_SAPLANE
  final
  create private .

public section.

  class-data AGENT type ref to ZCA_BD070_SAPLANE read-only .

  class-methods CLASS_CONSTRUCTOR .
protected section.
private section.
ENDCLASS.



CLASS ZCA_BD070_SAPLANE IMPLEMENTATION.


  method CLASS_CONSTRUCTOR.
***BUILD 090501
************************************************************************
* Purpose        : Initialize the 'class'.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : Singleton is created.
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 1999-09-20   : (OS) Initial Version
* - 2000-03-06   : (BGR) 2.0 modified REGISTER_CLASS_AGENT
************************************************************************
* GENERATED: Do not modify
************************************************************************

  create object AGENT.

  call method AGENT->REGISTER_CLASS_AGENT
    exporting
      I_CLASS_NAME          = 'ZCL_BD070_SAPLANE'
      I_CLASS_AGENT_NAME    = 'ZCA_BD070_SAPLANE'
      I_CLASS_GUID          = '005056B5064F1ED992B180457ECA6883'
      I_CLASS_AGENT_GUID    = '005056B5064F1ED992B1806792578886'
      I_AGENT               = AGENT
      I_STORAGE_LOCATION    = 'SAPLANE'
      I_CLASS_AGENT_VERSION = '2.0'.

           "CLASS_CONSTRUCTOR
  endmethod.
ENDCLASS.
