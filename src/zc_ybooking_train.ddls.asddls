@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZYBOOKING_TRAIN'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_YBOOKING_TRAIN
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_YBOOKING_TRAIN
  association [1..1] to ZR_YBOOKING_TRAIN as _BaseEntity on $projection.PNR = _BaseEntity.PNR
{
  key Pnr,
  CustomerID,
  CustomerName,
  TransactionID,
  TrainNo,
  BookingDate,
  BookingTime,
  BookingStatus,
  Coach,
  SeatClass,
  SeatType,
  SeatNo,
  Vikalp,
  BookedFrom,
  PaymentMode,
  @Semantics: {
    Amount.Currencycode: 'FareUnit'
  }
  BaseFare,
  @Semantics: {
    Amount.Currencycode: 'FareUnit'
  }
  ConvenienceFee,
  @Semantics: {
    Amount.Currencycode: 'FareUnit'
  }
  TotalFare,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  FareUnit,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChanged,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChanged,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    User.Lastchangedby: true
  }
  ChangedBy,
  _BaseEntity
}
