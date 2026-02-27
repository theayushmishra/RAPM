@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YBOOKING_TRAIN'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_booking_train
  as select from ybooking_train
{
  key pnr                as Pnr,
      customer_id        as CustomerId,
      customer_name      as CustomerName,
      transaction_id     as TransactionId,
      train_no           as TrainNo,
      booking_date       as BookingDate,
      booking_time       as BookingTime,
      booking_status     as BookingStatus,
      coach              as Coach,
      seat_class         as SeatClass,
      seat_type          as SeatType,
      seat_no            as SeatNo,
      vikalp             as Vikalp,
      booked_from        as BookedFrom,
      payment_mode       as PaymentMode,
      @Semantics.amount.currencyCode : 'FareUnit'
      base_fare          as BaseFare,
      @Semantics.amount.currencyCode : 'FareUnit'
      convenience_fee    as ConvenienceFee,
      @Semantics.amount.currencyCode : 'FareUnit'
      total_fare         as TotalFare,
      fare_unit          as FareUnit,
      local_last_changed as LocalLastChanged,
      last_changed       as LastChanged,
      created_by         as CreatedBy,
      changed_by         as ChangedBy
}
