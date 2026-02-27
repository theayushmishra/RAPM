CLASS lhc_YR_TICKET_BOOKING DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR booking RESULT result.
    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE booking.

ENDCLASS.

CLASS lhc_YR_TICKET_BOOKING IMPLEMENTATION.




  METHOD precheck_create.

    DATA(lt_entities) = entities.

    LOOP AT lt_entities INTO DATA(entity).
      SELECT COUNT( * )
      FROM yi_customer_train
      WHERE CustomerId = @entity-CustomerId
      INTO @DATA(lv_count).

      IF lv_count <> 0.
        reported-booking = VALUE #( ( %cid = entity-%cid
                                      %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                      text = 'Customer ID valid' )
                                    ) ).

      ELSE.
        reported-booking = VALUE #( ( %cid = entity-%cid
                                      %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
      text = 'Customer ID invalid, Please enter correct Customer ID.' )
        ) ).
        EXIT.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_authorizations.

  ENDMETHOD.

ENDCLASS.
