@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YTRAIN_FARE_INFO'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_TRAIN_FARE_INFO as select from ytrain_fare_info
{
    key train_no as TrainNo,
    key seat_class as SeatClass,
    key from_station as FromStation,
    key to_station as ToStation,
    key quota as Quota,
    @Semantics.amount.currencyCode: 'FareUnit'
    base_fare as BaseFare,
    @Semantics.amount.currencyCode: 'FareUnit'
    reservation_charges as ReservationCharges,
    @Semantics.amount.currencyCode: 'FareUnit'
    special_charges as SpecialCharges,
    gst as Gst,
    @Semantics.amount.currencyCode: 'FareUnit'
    total_amount as TotalAmount,
    fare_unit as FareUnit
}
