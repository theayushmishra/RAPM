@AbapCatalog.viewEnhancementCategory: [ #NONE ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Train details - data definition'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity z_i_train_details as select from ztrain_details
{
    key train_no as TrainNo,
    train_name as TrainName,
    sequence as Sequence,
    station_code as StationCode,
    station_name as StationName,
    arrival_time as ArrivalTime,
    departure_time as DepartureTime,
    distance as Distance,
    source_station_code as SourceStationCode,
    source_station_name as SourceStationName,
    destination_station_code as DestinationStationCode,
    destination_station_name as DestinationStationName
}
