@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZYBOOKING_TRAIN'
@EndUserText.label: '###GENERATED Core Data Service Entity'
@Metadata.ignorePropagatedAnnotations: true
//@Search.searchable: true
define root view entity ZR_YBOOKING_TRAIN
  as select from ybooking_train as booking
{
  key pnr                as Pnr,
      customer_id        as CustomerID,
//      @search.defaultSearchElement: true
      customer_name      as CustomerName,
      transaction_id     as TransactionID,
      train_no           as TrainNo,
      booking_date       as BookingDate,
      booking_time       as BookingTime,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'zvh_train',
        entity.element: 'BookingStatus',
        additionalBinding: [{
          localConstant: 'zbooking_status',
          element: 'zbooking_status',
          usage: #FILTER }],
          distinctValues: true
      } ]
      booking_status     as BookingStatus,
      coach              as Coach,
      seat_class         as SeatClass,
      seat_type          as SeatType,
      seat_no            as SeatNo,
      vikalp             as Vikalp,
      booked_from        as BookedFrom,
      payment_mode       as PaymentMode,
      @Semantics.amount.currencyCode: 'FareUnit'
      base_fare          as BaseFare,
      @Semantics.amount.currencyCode: 'FareUnit'
      convenience_fee    as ConvenienceFee,
      @Semantics.amount.currencyCode: 'FareUnit'
      total_fare         as TotalFare,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
      fare_unit          as FareUnit,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed as LocalLastChanged,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed       as LastChanged,
      @Semantics.user.createdBy: true
      created_by         as CreatedBy,
      @Semantics.user.lastChangedBy: true
      changed_by         as ChangedBy
}
