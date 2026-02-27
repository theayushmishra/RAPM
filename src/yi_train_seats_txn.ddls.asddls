@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YTRAIN_SEATS_TXN'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_train_seats_txn as select from ytrain_seats_txn
{
    key train_no as TrainNo,
    key date_of_origin as DateOfOrigin,
    seats_avail as SeatsAvail,
    seat_1a_avail as Seat1aAvail,
    seat_2a_avail as Seat2aAvail,
    seat_3a_avail as Seat3aAvail,
    seat_3e_avail as Seat3eAvail,
    seat_sl_avail as SeatSlAvail,
    seat_cc_avail as SeatCcAvail,
    seat_2s_avail as Seat2sAvail,
    seat_ev_avail as SeatEvAvail
}
