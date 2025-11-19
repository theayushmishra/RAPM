@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Train ticket booking - consumption view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z_c_ticket_booking
  provider contract transactional_query as projection on z_i_ticket_booking
{
    key BookingId,
    key UserId,
    BookedOn,
    TrainNo,
    FromStationCode,
    ToStationCode,
    DepartureDate,
    DepartureTime,
    DepartureDay,
    BookingStatus,
    Class,
    Quota,
    TotalPassengers,
    PassengerName,
    PassengerAge,
    PassengerGender,
//    PassengerNationality,
//    BirthPreference,
    PassengerMobileNo,
    PassengerEmailId,
//    TotalAmount,
//    PaymentMode,
//    TransactionId,
    /* Associations */
    _train_details
}
