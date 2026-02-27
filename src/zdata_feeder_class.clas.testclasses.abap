CLASS ltcl_testclass01 DEFINITION DEFERRED.

CLASS ltcl_testclass01 DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA ref_cut TYPE REF TO zdata_feeder_class.
    METHODS
      test_success FOR TESTING RAISING cx_static_check.
    METHODS test_exception FOR TESTING.
ENDCLASS.


CLASS zdata_feeder_class DEFINITION LOCAL FRIENDS ltcl_testclass01.

CLASS ltcl_testclass01 IMPLEMENTATION.

  METHOD test_success.
* Preparation : Read an arbitrary carrier_id from DB
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""

    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    INTO @DATA(carrier_id).

    IF sy-subrc <> 0.
      cl_abap_unit_assert=>fail(
        msg    = 'Test requires atleast one entry in DB table /dmo/carrier'
*      level  = if_abap_unit_constant=>severity-medium
*      quit   = if_abap_unit_constant=>quit-test
*      detail =
      ).
    ENDIF.


    ref_cut = NEW #(  ).

    DATA(result) = ref_cut->multiply_by_two( num = 3 ).

    cl_abap_unit_assert=>assert_equals( msg = 'msg123.'
                                        exp = 6
                                        act = result ).
  ENDMETHOD.

  METHOD test_exception.

    CONSTANTS c_carrier_id TYPE /dmo/carrier_id VALUE 'XX'.



*    Preparation : make sure the carrier does not exist in the DB table /dmo/carrier

    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    WHERE carrier_id = 'XX'
    INTO @DATA(carrier_id).

    IF sy-subrc = 0.

      " carrier exists in the DB table, stop testing
      cl_abap_unit_assert=>fail(
      msg = '|Carrier ID { c_carrier_id } exists in the DB table /dmo/carrier, stop testing.|'
      level = if_abap_unit_constant=>severity-high
      quit = if_abap_unit_constant=>quit-test ).

    ENDIF.















  ENDMETHOD.

ENDCLASS.
*"* use this source file for your ABAP unit test classes
