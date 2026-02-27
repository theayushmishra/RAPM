@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for YR_TICKET_BOOKING'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity YC_TICKET_BOOKING
  provider contract transactional_query
  as projection on YR_TICKET_BOOKING
  association [0..*] to YR_TICKET_BOOKING as _BaseEntity on $projection.Pnr = _BaseEntity.Pnr
{
  key Pnr,
  key CustomerId,
  key TransactionId,
      TrainNo,
      SeatClass,
      TravelDate,
      FromStationCode,
      ToStationCode,
      BookingStatus,
      Coach,
      SeatNo,
      SeatType,
      Vikalp,
      LocalLastChanged,
      LastChanged,
      CreatedBy,
      ChangedBy,
      /* Associations */
      _customer,
      _passenger_info,
      _train_details,
      _train_fare_info,
      _train_seats_available,
      _BaseEntity
}
