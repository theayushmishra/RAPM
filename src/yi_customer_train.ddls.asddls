@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YCUSTOMER_TRAIN'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_CUSTOMER_TRAIN as select from ycustomer_train
{
    key customer_id as CustomerId,
    customer_name as CustomerName,
    customer_dob as CustomerDob,
    customer_address as CustomerAddress,
    customer_mobile_number as CustomerMobileNumber,
    customer_email_id as CustomerEmailId
}
