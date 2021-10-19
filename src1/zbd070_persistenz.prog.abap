*&---------------------------------------------------------------------*
*& Report  ZBD070_PERSISTENZ
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zbd070_persistenz.

DATA go_plane TYPE REF TO zcl_bd070_saplane.
DATA go_agent TYPE REF TO zca_bd070_saplane.
DATA gf_tankcap TYPE saplane-tankcap.

START-OF-SELECTION.

  go_agent = zca_bd070_saplane=>agent.

  TRY .
      go_plane = go_agent->get_persistent(
                            i_planetype = '757F'
                            ).


      gf_tankcap = go_plane->get_tankcap( ).
      WRITE : 'Tankkapazität', gf_tankcap.

      go_plane->set_tankcap( 42320 ).
      go_agent->if_os_ca_service~save( ).
      COMMIT WORK.
    CATCH cx_os_object_not_found.

  ENDTRY.
