@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YTRAIN_SEATS_INF'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_TRAIN_SEATS_INF as select from ytrain_seats_inf
{
    key train_no as TrainNo,
    train_type_code as TrainTypeCode,
    max_seats as MaxSeats,
    max_seat_1a as MaxSeat1a,
    max_seat_2a as MaxSeat2a,
    max_seat_3a as MaxSeat3a,
    max_seat_3e as MaxSeat3e,
    max_seat_sl as MaxSeatSl,
    max_seat_cc as MaxSeatCc,
    max_seat_2s as MaxSeat2s,
    max_seat_ev as MaxSeatEv
}
