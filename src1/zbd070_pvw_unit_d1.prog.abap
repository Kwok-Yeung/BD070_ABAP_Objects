*** Main-Program ZBD070_PVW_UNIT_D1
REPORT zbd070_spc_unit_d1.

INCLUDE zbd070_spc_unit_d1_airplane. "test class lcl_test_plane

START-OF-SELECTION.
* ... creating several planes
* ... but this is not important for testing
  ...
* Include bd070_spc_unit_d1_testclass
*----------------------------------------------------------------------*
* CLASS lcl_test_plane DEFINITION
*----------------------------------------------------------------------*
CLASS lcl_test_plane DEFINITION FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    METHODS:
      test_create_success FOR TESTING,
      test_create_exception FOR TESTING.
ENDCLASS. "lcl_test_plane DEFINITION
*----------------------------------------------------------------------*
* CLASS lcl_test_plane IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS lcl_test_plane IMPLEMENTATION.
*----------------------------------------------------------------------*
* testing successful instanciation
*----------------------------------------------------------------------*
  METHOD test_create_success.
    DATA:
      ls_plane_exp TYPE saplane,
      ls_plane_act TYPE saplane,
      lo_plane     TYPE REF TO lcl_airplane,
      lx_exc       TYPE REF TO zcx_invalid_planetype.
* get data for a passenger plane
    SELECT SINGLE * FROM saplane INTO @ls_plane_exp
    WHERE seatsmax_b GT 0.
* quit unit test class if no data found
    cl_aunit_assert=>assert_subrc(
    EXPORTING
    act = sy-subrc
    msg = `No passenger plane found in table SAPLANE - can't do this test`
    level = cl_aunit_assert=>fatal
    quit = cl_aunit_assert=>class ).
* check instance creation
    TRY.
        CREATE OBJECT lo_plane
          EXPORTING
            iv_name      = 'Frankfurt'
            iv_planetype = ls_plane_exp-planetype.
      CATCH zcx_invalid_planetype INTO lx_exc.
    ENDTRY.
* assert no exception is raised - quit test method
    cl_aunit_assert=>assert_not_bound(
    msg = `Constructor raises exception when it shouldn't`
    act = lx_exc
* LEVEL = CRITICAL
    quit = cl_aunit_assert=>method ).
  ENDMETHOD. "test_create_success
*----------------------------------------------------------------------*
* testing raising of exceptions by the constructor
*----------------------------------------------------------------------*
  METHOD test_create_exception.
    CONSTANTS:
    lc_planetype TYPE saplane-planetype VALUE '747-500'.
    DATA:
      ls_plane     TYPE saplane,
      ls_plane_act TYPE saplane,
      lv_failed(1) TYPE c,
      lo_plane     TYPE REF TO lcl_airplane,
      lx_exc       TYPE REF TO zcx_invalid_planetype.
* first, make sure planetype does not actually exist
    SELECT SINGLE * FROM saplane INTO @ls_plane
    WHERE planetype = @lc_planetype.
* quit this test method if planetype acually exists on DB
    cl_aunit_assert=>assert_subrc(
    exp = 4
    act = sy-subrc
    msg = `Test planetype 747-500 actually exists - can't do this test`
    level = cl_aunit_assert=>fatal
    quit = cl_aunit_assert=>method ).
* check instance creation
    TRY.
        CREATE OBJECT lo_plane
          EXPORTING
            iv_name      = 'Frankfurt'
            iv_planetype = lc_planetype.
      CATCH zcx_invalid_planetype INTO lx_exc.
    ENDTRY.
* assert exception is raised - quit test method if not
    cl_aunit_assert=>assert_bound(
    msg = `Constructor doesn't raise exception when it should`
    act = lx_exc
* LEVEL = CRITICAL
    quit = cl_aunit_assert=>method ).
  ENDMETHOD. "test_create_exception
ENDCLASS. "lcl_test_plane IMPLEMENTATION
