*----------------------------------------------------------------------*
***INCLUDE ZBD070_PRJT_WAITLIST_I01 .
*----------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Module  check_and_create_cust  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE check_and_create_cust INPUT.
  SELECT SINGLE name, street, city FROM scustom
                                INTO CORRESPONDING FIELDS OF @scustom
                                WHERE id = @scustom-id.
  IF sy-subrc <> 0.
    CLEAR: scustom-name, scustom-city.
    MESSAGE e000(zbd070) WITH scustom-id.
*   Customernumber & does not exist. Please correct!
  ENDIF.
ENDMODULE.                 " check_and_create_cust  INPUT


*&---------------------------------------------------------------------*
*&      Module  user_command_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  DATA:
        text TYPE string,
        save_ok TYPE sy-ucomm.
  save_ok = ok_code.
  CLEAR ok_code.

  CASE save_ok.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'CREATE'. "##########################################
      try.
        r_buffer->create_wait_list( EXPORTING
                                         im_carrid = sdyn_conn-carrid
                                         im_connid = sdyn_conn-connid
                                         im_fldate = sdyn_conn-fldate ).
        MESSAGE s005(zbd070)
          WITH sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
       CATCH zcx_wait_list into r_exc.
         text = r_exc->get_text( ).
         MESSAGE s901(zbd070) WITH sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
      ENDTRY.

    WHEN 'SHOW'.  "##########################################
      DATA:
            it_customer_list TYPE STANDARD TABLE OF zbd070_typd_cust,
            wa_cust LIKE LINE OF it_customer_list,
            r_customer_list TYPE TABLE OF REF TO lcl_customer,
            r_cust TYPE REF TO lcl_customer.

      if r_waitlist is BOUND.
        r_waitlist->get_wait_list( IMPORTING ex_wait_list = r_customer_list ).
        if r_customer_list is not INITIAL.
          CLEAR it_customer_list.
          LOOP AT r_customer_list INTO r_cust.
            r_cust->get_attributes( IMPORTING ex_cust = wa_cust ).
            INSERT wa_cust INTO TABLE it_customer_list.
          ENDLOOP.

          call FUNCTION 'ZBD070_DISPLAY_DATA' EXPORTING im_list = it_customer_list.
         else.
           MESSAGE s903(zbd070) with sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
          endif.
        else.
          MESSAGE s002(zbd070) with sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
       endif.


    WHEN 'DELETE'.   "##########################################
      try.
          r_buffer->delete_wait_list( EXPORTING
                                        im_carrid = sdyn_conn-carrid
                                        im_connid = sdyn_conn-connid
                                        im_fldate = sdyn_conn-fldate ).
          MESSAGE s906(zbd070) WITH sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
       CATCH zcx_wait_list into r_exc.
         text = r_exc->get_text( ).
         MESSAGE text TYPE 'S'.
      ENDTRY.

    WHEN 'FIRST'.   "##########################################
      r_waitlist = r_buffer->get_wait_list( im_carrid = sdyn_conn-carrid
                                            im_connid = sdyn_conn-connid
                                            im_fldate = sdyn_conn-fldate ).
      if r_waitlist is bound.
        try.
          r_waitlist->get_first( ).
          MESSAGE s907(zbd070) WITH sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
        CATCH zcx_wait_list into r_exc.
          text = r_exc->get_text( ).
          Message text TYPE 'I'.
         ENDTRY.
       else.
         MESSAGE s902(zbd070) WITH sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
       endif.

    WHEN 'ADD'.   "##########################################
      if scustom-id is INITIAL.
        MESSAGE s908(zbd070).
        exit.
       endif.
       r_waitlist = r_buffer->get_wait_list( im_carrid = sdyn_conn-carrid
                                              im_connid = sdyn_conn-connid
                                              im_fldate = sdyn_conn-fldate ).
       if r_waitlist is bound.
         try.
           create OBJECT r_customer
              EXPORTING
                im_id = scustom-id
                im_name = scustom-name
                im_street = scustom-street
                im_city = scustom-city
                im_app_date = sy-datum.
           r_waitlist->add( r_customer ).
           MESSAGE s910(zbd070)
                WITH scustom-id sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
           CATCH zcx_wait_list INTO r_exc.
             text = r_exc->get_text( ).
             MESSAGE text TYPE 'I'.
           ENDTRY.
        else.
          MESSAGE s902(zbd070) WITH sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
        endif.

    WHEN 'DEL'.   "##########################################
      if scustom-id is INITIAL.
        MESSAGE s908(zbd070).
        exit.
      endif.
      r_waitlist = r_buffer->get_wait_list( im_carrid = sdyn_conn-carrid
                                            im_connid = sdyn_conn-connid
                                            im_fldate = sdyn_conn-fldate ).
      if r_waitlist is bound.
        if not r_customer is bound.
          message s911(zbd070) WITH scustom-id sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
         else.
           try.
             r_waitlist->delete( r_customer ).
             MESSAGE s912(zbd070) WITH scustom-id sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
           CATCH zcx_wait_list into r_exc.
             text = r_exc->get_text( ).
             MESSAGE text TYPE 'I'.
           ENDTRY.
          endif.
       ELSE.
         MESSAGE s902(zbd0707) with sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
       endif.

    WHEN 'POS'.    "##########################################
      DATA pos like sy-tabix.
      DATA flight TYPE string.
      DATA fldate(10) type c.

      if scustom-id is initial.
        message s908(zbd070).
        exit.
      endif.
      r_waitlist = r_buffer->get_wait_list( im_carrid = sdyn_conn-carrid
                                            im_connid = sdyn_conn-connid
                                            im_fldate = sdyn_conn-fldate ).
      if r_waitlist is BOUND.
        try.
          create object r_customer
              EXPORTING
                im_id = scustom-id
                im_name = scustom-name
                im_street = scustom-street
                im_city = scustom-city
                im_app_date = sy-datum.
          r_waitlist->get_pos( EXPORTING im_customer = r_customer
                                IMPORTING ex_pos = pos ).
          WRITE sdyn_conn-fldate to fldate.
          CONCATENATE sdyn_conn-carrid sdyn_conn-connid fldate into flight SEPARATED BY space.
          MESSAGE i913(zbd070) with scustom-id flight pos.
         CATCH zcx_wait_list into r_exc.
           text = r_exc->get_text( ).
           MESSAGE text type 'I'.
         ENDTRY.
       ELSE.
         MESSAGE s902(zbd070) with sdyn_conn-carrid sdyn_conn-connid sdyn_conn-fldate.
       endif.

    WHEN OTHERS.

  ENDCASE.

ENDMODULE.                 " user_command_0100  INPUT


*&---------------------------------------------------------------------*
*&      Module  check_flight  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE check_flight INPUT.
  SELECT COUNT(*) FROM sflight
      WHERE      carrid = @sdyn_conn-carrid
            AND  connid = @sdyn_conn-connid
            AND  fldate = @sdyn_conn-fldate.

  IF sy-subrc <> 0.
    MESSAGE e004(zbd070).
*   Please select a valid flight!
  ENDIF.
ENDMODULE.                 " check_flight  INPUT


*&---------------------------------------------------------------------*
*&      Module  exit  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit INPUT.

  CASE ok_code.
    WHEN 'CANCEL'.
      CLEAR: scustom, sdyn_conn.
      LEAVE TO SCREEN 100.
    WHEN 'EXIT'.
      LEAVE PROGRAM.

  ENDCASE.

ENDMODULE.                 " exit  INPUT
