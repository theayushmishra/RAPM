@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for YBOOK_PAYMNT_TXN'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_BOOK_PAYMNT_TXN
  as select from ybook_paymnt_txn
{

  key transaction_id    as TransactionId,
  key pnr               as Pnr,
  key customer_id       as CustomerId,
      @Semantics.amount.currencyCode: 'AmountUnit'
      total_amount_paid as TotalAmountPaid,
      amount_unit       as AmountUnit,
      payment_mode      as PaymentMode,
      payment_date      as PaymentDate,
      payment_time      as PaymentTime
}
