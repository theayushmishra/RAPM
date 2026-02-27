CLASS lsc_zr_ybooking_train DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zr_ybooking_train IMPLEMENTATION.

  METHOD adjust_numbers.

    DATA lt_mapped TYPE TABLE FOR MAPPED LATE zr_ybooking_train.

    lt_mapped = mapped-booking.

    LOOP AT lt_mapped INTO DATA(map).
      READ ENTITIES OF zr_ybooking_train IN LOCAL MODE
      ENTITY booking
      ALL FIELDS
      WITH VALUE #( ( %pid = map-%pid ) )
      RESULT DATA(ls_result).

      SELECT SINGLE FROM ybooking_train
      FIELDS MAX( pnr ) AS last_pnr
      INTO @DATA(lv_max_pnr).

      DATA(next_pnr) = lv_max_pnr + 1.

      APPEND VALUE #(
          %pid      = map-%pid
          pnr  = next_pnr
        ) TO mapped-booking.

      APPEND VALUE #( %pid = map-%pid
              pnr = next_pnr " Highlights the field on UI
              %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                            text = 'PNR assigned' ) )
     TO reported-booking.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_ybooking_train DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR booking
        RESULT result,
      determinename FOR DETERMINE ON MODIFY
        IMPORTING keys FOR booking~determinename,
*      validateBookingStatus FOR VALIDATE ON SAVE
*        IMPORTING keys FOR booking~validateBookingStatus,
*      earlynumbering_create FOR NUMBERING
*        IMPORTING entities FOR CREATE booking,
      precheck_create FOR PRECHECK
        IMPORTING entities FOR CREATE booking.
*      determinename FOR DETERMINE ON MODIFY
*        IMPORTING keys FOR booking~determinename.
ENDCLASS.

CLASS lhc_zr_ybooking_train IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
*  METHOD validateBookingStatus.
*    READ ENTITIES OF zr_ybooking_train IN LOCAL MODE
*    ENTITY booking
*    ALL FIELDS
*    WITH CORRESPONDING #( keys )
*    RESULT DATA(lt_result)
*    FAILED DATA(lt_failed)
*    REPORTED DATA(lt_reported).
*
*  ENDMETHOD.


*  METHOD earlynumbering_create.
*
**    DATA(lt_entities) = entities.
**
**    SELECT SINGLE FROM ybooking_train
**    FIELDS MAX( pnr ) AS last_pnr
**    INTO @DATA(lv_max_pnr).
**
**    LOOP AT lt_entities INTO DATA(entity).
**
**      DATA(next_pnr) = lv_max_pnr + 1.
**
**      APPEND VALUE #(
**          %cid      = entity-%cid
**          pnr  = next_pnr
**          %is_draft = entity-%is_draft
**        ) TO mapped-booking.
**
**      APPEND VALUE #( %cid = entity-%cid
**              pnr = next_pnr " Highlights the field on UI
**              %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
**                                            text = 'PNR assigned' ) )
**     TO reported-booking.
**
**    ENDLOOP.
*
*  ENDMETHOD.

  METHOD precheck_create.

    DATA(entity) = entities[ 1 ].

    SELECT SINGLE COUNT( * )
    FROM ycustomer_train
    WHERE customer_id = @entity-CustomerID
    INTO @DATA(count_customerId).

    SELECT SINGLE COUNT( * )
    FROM ytrain_info
    WHERE train_no = @entity-TrainNo
    INTO @DATA(count_trainNo).

    IF count_customerId = 1 AND count_trainNo = 1.
      reported-booking = VALUE #( (  %cid = entity-%cid  %msg = new_message_with_text(
                                                               severity = if_abap_behv_message=>severity-success
                                                               text     = 'Customer ID and Train No. are correct!' ) ) ).

    ELSE.
      failed-booking = VALUE #( ( %cid = entity-%cid ) ).

      IF count_customerId = 0.
        reported-booking = VALUE #( (  %cid = entity-%cid  %msg = new_message_with_text(
                                                                 severity = if_abap_behv_message=>severity-error
                                                                 text     = 'Customer ID is incorrect! Please enter correct Customer ID.' ) ) ).

      ELSE.
        reported-booking = VALUE #( (  %cid = entity-%cid  %msg = new_message_with_text(
                                                               severity = if_abap_behv_message=>severity-error
                                                               text     = 'Train No. is incorrect! Please enter correct Train No.' ) ) ).
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD determineName.

    READ ENTITIES OF zr_ybooking_train IN LOCAL MODE
     ENTITY booking
     ALL FIELDS
     WITH CORRESPONDING #( keys )
     RESULT DATA(lt_entities).
*
*
    LOOP AT lt_entities INTO DATA(ent).

      DATA(customerId) = ent-CustomerID.

      SELECT SINGLE
      FROM ycustomer_train
      FIELDS customer_name
      WHERE customer_id = @customerId
      INTO @DATA(custName).
*
      IF sy-subrc = 0.
*        MODIFY lt_entities FROM ent.
*      ENDIF.

        MODIFY ENTITIES OF zr_ybooking_train IN LOCAL MODE
        ENTITY booking
        UPDATE
        FIELDS ( CustomerName )
        WITH VALUE #( ( %tky = ent-%tky CustomerName = custName ) ).

        APPEND VALUE #(  %pid = ent-%pid
           %key = ent-%key
                   %element-customerName = custName " Highlights the field on UI
                   %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success
                                                 text = 'Customer Name auto generated' ) )
          TO reported-booking.

      ENDIF.

*
    ENDLOOP.
*





*    DATA lt_update TYPE TABLE FOR UPDATE zr_ybooking_train.
*
*    lt_update = CORRESPONDING #( lt_entities ).
*
*    MODIFY ENTITIES OF zr_ybooking_train IN LOCAL MODE
*    ENTITY booking
*    UPDATE
*    FIELDS ( CustomerName )
*    WITH lt_update
*    REPORTED DATA(lt_report).
*
*    reported-booking = CORRESPONDING #( lt_report-booking ).

  ENDMETHOD.

ENDCLASS.
