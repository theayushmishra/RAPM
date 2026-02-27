@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YCONVENIENCE_CGS'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_CONVENIENCE_CGS
  as select from yconvenience_cgs
{
  key payment_mode    as PaymentMode,
      @Semantics.amount.currencyCode: 'FeeUnit'
      convenience_fee as ConvenienceFee,
      fee_unit        as FeeUnit
}
