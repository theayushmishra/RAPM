@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YTRAVEL'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_travel
  as select from ytravel
{
  key pnr                as Pnr,
  key customer_id        as CustomerId,
  key transaction_id     as TransactionId,
      train_no           as TrainNo,
      seat_class         as SeatClass,
      travel_date        as TravelDate,
      from_station_code  as FromStationCode,
      to_station_code    as ToStationCode,
      booking_status     as BookingStatus,
      coach              as Coach,
      seat_no            as SeatNo,
      seat_type          as SeatType,
      vikalp             as Vikalp,
      local_last_changed as LocalLastChanged,
      last_changed       as LastChanged,
      created_by         as CreatedBy,
      changed_by         as ChangedBy
}
