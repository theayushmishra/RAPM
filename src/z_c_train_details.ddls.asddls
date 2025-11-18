@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Train details - consumption view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity z_c_train_details
  provider contract transactional_query
  as projection on z_i_train_details
{
  key TrainNo,
      TrainName,
      Sequence,
      StationCode,
      StationName,
      ArrivalTime,
      DepartureTime,
      Distance,
      SourceStationCode,
      SourceStationName,
      DestinationStationCode,
      DestinationStationName
}
