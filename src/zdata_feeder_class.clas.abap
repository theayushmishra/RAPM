*CLASS ltcl_testclass01 DEFINITION DEFERRED.

CLASS zdata_feeder_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
*    DATA ref1 TYPE REF TO ltcl_testclass01.

    METHODS multiply_by_two IMPORTING num           TYPE i
                            RETURNING VALUE(result) TYPE i.

ENDCLASS.



CLASS zdata_feeder_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  delete from ytrain_details.
*
*    DATA lt_value TYPE STANDARD TABLE OF ytrain_details.
*    lt_value = VALUE #( ( train_no = 12069 sequence = 11 train_name = 'RIG-G JANSHATABDI EXPRESS' station_code = 'R' arrival_time = '103000' departure_time = '103500' distance = 241 origin_station_code = 'RIG' destination_station_code = 'G' ) ).
*
*    INSERT ytrain_details FROM TABLE @lt_value.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    DELETE FROM ystation_details.
*    DATA lt_value TYPE STANDARD TABLE OF ystation_details.
*    lt_value = VALUE #( ( station_code = 'RIG' station_name = 'RAIGARH' station_state_name = 'Chhattisgarh' )
*                        ( station_code = 'KHS' station_name = 'KAHRSIA' station_state_name = 'Chhattisgarh' )
*                        ( station_code = 'SKT' station_name = 'SHAKTI' station_state_name = 'Chhattisgarh' )
*                        ( station_code = 'BUA' station_name = 'BARADWAR' station_state_name = 'Chhattisgarh' )
*                        ( station_code = 'CPH' station_name = 'CHAMPA' station_state_name = 'Chhattisgarh' )
*                        ( station_code = 'R' station_name = 'RAIPUR' station_state_name = 'Chhattisgarh' ) ).
*
*    INSERT ystation_details FROM TABLE @lt_value.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    DELETE FROM ycustomer_train.
*
*    DATA lt_value TYPE STANDARD TABLE OF ycustomer_train.
*    lt_value = VALUE #( ( customer_id = '16160945' customer_name = 'Arun Prajapati' customer_dob = '19910726' customer_address = 'Jharsuguda' customer_mobile_number = '7845789730' customer_email_id = 'arun.prajapati@gmail.com'  )
*    ( customer_id = '16160946' customer_name = 'Joy Kumar' customer_dob = '19990104' customer_address = 'Korba' customer_mobile_number = '8845789730' customer_email_id = 'Joy.kumar1@gmail.com'  )
*    ( customer_id = '16160947' customer_name = 'Pravin Dev' customer_dob = '19790104' customer_address = 'Bilaspur' customer_mobile_number = '8845789730' customer_email_id = 'pravin_dev123@gmail.com'  )
*    ( customer_id = '16160948' customer_name = 'Monty Panesar' customer_dob = '19890304' customer_address = 'Raipur' customer_mobile_number = '7856789730' customer_email_id = 'monty_monty@gmail.com'  )
*    ( customer_id = '16160949' customer_name = 'Deepak Kumar' customer_dob = '20020604' customer_address = 'Korba' customer_mobile_number = '8845789730' customer_email_id = 'deepak_deepak@gmail.com'  )
*    ( customer_id = '16160950' customer_name = 'Suman Keerat' customer_dob = '20041226' customer_address = 'Shakti' customer_mobile_number = '8985097306' customer_email_id = 'suman-keerat@gmail.com'  )
*    ( customer_id = '16160952' customer_name = 'Arjun Rampal' customer_dob = '20050608' customer_address = 'Raigarh' customer_mobile_number = '7545789730' customer_email_id = 'arjun.12rampal@gmail.com'  )
* ).
*
*    MODIFY ycustomer_train FROM TABLE @lt_value.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    DATA lt_value TYPE STANDARD TABLE OF ytrain_fare_info.
*    lt_value = VALUE #( ( train_no = '12069' from_station = 'RIG' to_station = 'G' seat_class = '2S' quota = 'General' base_fare = '175' reservation_charges = '15' special_charges = '15' gst = 5 total_amount = '205' fare_unit = 'INR' )
*    ( train_no = '12069' from_station = 'RIG' to_station = 'R' seat_class = '2S' quota = 'General' base_fare = '120' reservation_charges = '15' special_charges = '15' gst = 5 total_amount = '150' fare_unit = 'INR' )
*    ( train_no = '12069' from_station = 'RIG' to_station = 'KHS' seat_class = '2S' quota = 'General' base_fare = '45' reservation_charges = '15' special_charges = '15' gst = 5 total_amount = '75' fare_unit = 'INR' ) ).
*
*    MODIFY ytrain_fare_info FROM TABLE @lt_value.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    DATA lt_value TYPE STANDARD TABLE OF yconvenience_cgs.
*
*    lt_value = VALUE #( ( payment_mode = 'UPI' convenience_fee = '20' fee_unit = 'INR' )
*    ( payment_mode = 'Net Banking' convenience_fee = '30' fee_unit = 'INR' ) ).
*
*    INSERT yconvenience_cgs FROM TABLE @lt_value.
    "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lt_value TYPE STANDARD TABLE OF ytravel.
*
*    lt_value = VALUE #( ( pnr = '4379127979' Customer_Id = '16160945'
*                          Transaction_Id = '276856258' Train_No = '12069'
*                          Seat_Class = '1A' Travel_Date = '20260221'
*                          From_Station_Code = 'RIG' To_Station_Code = 'R'
*                          Booking_Status = '' Coach = ''
*                          Seat_No = '' Seat_Type = ''
*                          vikalp = 'x' ) ).
*
*    MODIFY ytravel FROM TABLE @lt_value.
*
*
*
*    IF sy-subrc = 0.
*      out->write( 'success' ).
*    ELSE.
*      out->write( 'failure' ).
*    ENDIF.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*    CONSTANTS c_carrier_id TYPE /dmo/carrier_id VALUE 'XX'.
*
*    TRY.
*
*        SELECT * FROM /dmo/carrier
*        WHERE carrier_id = @c_carrier_id
*        INTO TABLE @DATA(lt_carriers).
*
*      CATCH cx_abap_invalid_value.
*        out->write( |carrier { c_carrier_id } does not exist| ).
*    ENDTRY.



**********************************************************************
*    DATA variable1 TYPE p lenGTH 3 DECIMALS 2.
*    variable1 = '99.13'.

*    out->write(  variable1 ).

    DATA var_str TYPE string.
    DATA var_n TYPE n LENGTH 5.

    var_str = 'R2D5'.
    var_n = var_str.

*    out->write( var_n ).


    DATA var_utc TYPE utclong.

    var_utc = utclong_current(  ).



    DATA(var_utc1) = utclong_add(
                       val     = var_utc
                       days    = 02
                       hours   = 12
                       minutes = 10
                       seconds = 72
                     ).


*out->write( var_utc1 ).

*OUT->write( TEXT-002 ).
*OUT->write( TEXT-ab2 ).

    DATA result_int TYPE i.
    DATA input_string TYPE string VALUE 'abcdabacd'.

    result_int = count(
                   val   = input_string
                   sub   = 'a'
*                   regex =
*                   pcre  =
*                   occ   =
*                   off   =
*                   len   =
*                   case  =
                 ).

    result_int = find( val = input_string sub = 'a' off = 4
                        ).

    DATA input_string2 TYPE c lenGTH 10 VALUE `abc   `.

    out->write( strlen( input_string2 ) ).
    out->write( numofchar( input_string2 ) ).

*    out->write( result_int ).




  ENDMETHOD.

  METHOD multiply_by_two.
    result = num * 2.
  ENDMETHOD.

ENDCLASS.
