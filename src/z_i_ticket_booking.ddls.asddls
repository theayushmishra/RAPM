@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Train ticket booking - interface view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z_i_ticket_booking
  as select from z_r_ticket_booking
  association [1] to z_i_train_details as _train_details on $projection.TrainNo = _train_details.TrainNo
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
      PassengerNationality,
      BirthPreference,
      PassengerMobileNo,
      PassengerEmailId,
      TotalAmount,
      PaymentMode,
      TransactionId,
      _train_details
}
