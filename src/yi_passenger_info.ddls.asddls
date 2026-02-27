@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YPASSENGER_INFO'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_PASSENGER_INFO as select from ypassenger_info
{
    key pnr as Pnr,
    name as Name,
    age as Age,
    gender as Gender,
    mobile_no as MobileNo
}
