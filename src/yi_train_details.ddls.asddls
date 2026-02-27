@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YTRAIN_DETAILS'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_train_details as select from ytrain_details
{
    key train_no as TrainNo,
    key sequence as Sequence,
    train_name as TrainName,
    station_code as StationCode,
    arrival_time as ArrivalTime,
    departure_time as DepartureTime,
    distance as Distance,
    origin_station_code as OriginStationCode,
    destination_station_code as DestinationStationCode
}
