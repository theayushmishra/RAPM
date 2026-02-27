@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base view for ticket booking service'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity YR_TICKET_BOOKING
  //  as select from YI_CUSTOMER_TRAIN
  //  association [1..*] to YI_travel as _travel on YI_CUSTOMER_TRAIN.CustomerId = _travel.CustomerId
  as select from YI_travel
  association [1]    to YI_CUSTOMER_TRAIN  as _customer              on  YI_travel.CustomerId = _customer.CustomerId
  association [*]    to YI_train_details   as _train_details         on  YI_travel.TrainNo = _train_details.TrainNo
  association [0..1] to YI_train_seats_txn as _train_seats_available on  YI_travel.TrainNo    = _train_seats_available.TrainNo
                                                                     and YI_travel.TravelDate = _train_seats_available.DateOfOrigin
  association [0..*] to YI_TRAIN_FARE_INFO as _train_fare_info       on  YI_travel.TrainNo         = _train_fare_info.TrainNo
                                                                     and YI_travel.SeatClass       = _train_fare_info.SeatClass
                                                                     and YI_travel.FromStationCode = _train_fare_info.FromStation
                                                                     and YI_travel.ToStationCode   = _train_fare_info.ToStation
  //                                                                  and YI_travel.quota = _train_fare_infor.Quota
  association [1]    to YI_PASSENGER_INFO  as _passenger_info        on  YI_travel.Pnr = _passenger_info.Pnr
  //  association [0..1] to YI_CONVENIENCE_CGS as _convenience_charges on YI_travel.PaymentMode = _convenience_charges.PaymentMode
{
  key YI_travel.Pnr,
  key YI_travel.CustomerId,
  key YI_travel.TransactionId,
      YI_travel.TrainNo,
      YI_travel.SeatClass,
      YI_travel.TravelDate,
      YI_travel.FromStationCode,
      YI_travel.ToStationCode,
      YI_travel.BookingStatus,
      YI_travel.Coach,
      YI_travel.SeatNo,
      YI_travel.SeatType,
      YI_travel.Vikalp,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      YI_travel.LocalLastChanged,
      @Semantics.systemDateTime.lastChangedAt: true
      YI_travel.LastChanged,
      @Semantics.user.createdBy: true
      YI_travel.CreatedBy,
      @Semantics.user.lastChangedBy: true
      YI_travel.ChangedBy,
      _customer,
      _train_details,
      _train_seats_available,
      _train_fare_info,
      _passenger_info

};
