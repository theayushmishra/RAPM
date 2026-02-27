@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YTRAVEL_INSUR'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_TRAVEL_INSUR as select from ytravel_insur
{
    key pnr as Pnr,
    transaction_id as TransactionId,
    insurance_opted as InsuranceOpted,
    @Semantics.amount.currencyCode: 'AmountUnit'
    insurance_amount as InsuranceAmount,
    amount_unit as AmountUnit
}
