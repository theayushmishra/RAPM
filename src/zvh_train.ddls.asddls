@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help definition for ''Train'' applns'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable : true
@ObjectModel.dataCategory: #VALUE_HELP
define view entity zvh_train
  as select from ybooking_train
{
  key pnr                as Pnr,
      @Search.defaultSearchElement: true
      customer_id        as CustomerId,
      @Search.defaultSearchElement: true
      customer_name      as CustomerName,
      @Search.defaultSearchElement: true
      transaction_id     as TransactionId,
      @Search.defaultSearchElement: true
      train_no           as TrainNo,
      @Search.defaultSearchElement: true
      booking_date       as BookingDate,
      booking_time       as BookingTime,
      @Search.defaultSearchElement: true
      booking_status     as BookingStatus,
      coach              as Coach,
      seat_class         as SeatClass,
      seat_type          as SeatType,
      seat_no            as SeatNo,
      vikalp             as Vikalp,
      booked_from        as BookedFrom,
      payment_mode       as PaymentMode,
      fare_unit          as FareUnit,
      local_last_changed as LocalLastChanged,
      last_changed       as LastChanged,
      created_by         as CreatedBy,
      changed_by         as ChangedBy
}
