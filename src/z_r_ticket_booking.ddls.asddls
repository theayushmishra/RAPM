@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Train ticket booking - base view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z_r_ticket_booking
  as select from zticket_booking
{
  key booking_id            as BookingId,
  key user_id               as UserId,
      booked_on             as BookedOn,
      train_no              as TrainNo,
      from_station_code     as FromStationCode,
      to_station_code       as ToStationCode,
      departure_date        as DepartureDate,
      departure_time        as DepartureTime,
      departure_day         as DepartureDay,
      booking_status        as BookingStatus,
      class                 as Class,
      quota                 as Quota,
      total_passengers      as TotalPassengers,
      passenger_name        as PassengerName,
      passenger_age         as PassengerAge,
      passenger_gender      as PassengerGender,
      passenger_nationality as PassengerNationality,
      birth_preference      as BirthPreference,
      passenger_mobile_no   as PassengerMobileNo,
      passenger_email_id    as PassengerEmailId,
      total_amount          as TotalAmount,
      payment_mode          as PaymentMode,
      transaction_id        as TransactionId
}
