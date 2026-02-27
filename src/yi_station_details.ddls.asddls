@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YSTATION_DETAILS'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_station_details as select from ystation_details
{
    key station_code as StationCode,
    station_name as StationName,
    station_state_name as StationStateName
}
