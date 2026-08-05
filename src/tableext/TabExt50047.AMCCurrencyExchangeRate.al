tableextension 50037 "AMC Currency Exchange Rate" extends "Currency Exchange Rate"
{
    fields
    {
        field(50001; "AMC Sales Exch. Rate"; Decimal)
        {
            Caption = 'Sales Exch. Rate';
            DecimalPlaces = 0 : 4;
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Purch. Exch. Rate"; Decimal)
        {
            Caption = 'Purch. Exch. Rate';
            DecimalPlaces = 0 : 4;
            DataClassification = CustomerContent;
        }
    }
    procedure ExchangeRateSale(Date: Date; CurrencyCode: code[10]; var ExchangeDate: Date; var AverangeRate: Decimal): Decimal

    var
        ExchangeRateAmt: Decimal;
        RelExchangeRateAmt: Decimal;
        CurrencyFactor: Decimal;
        RelCurrencyCode: Code[10];
        UseAdjmtAmounts: Boolean;

    begin

        IF CurrencyCode = '' THEN
            EXIT(1);
        FindCurrency(Date, CurrencyCode, 1);
        IF NOT UseAdjmtAmounts THEN BEGIN
            TESTFIELD("AMC Sales Exch. Rate");
            TESTFIELD("Relational Exch. Rate Amount");
        END ELSE BEGIN
            TESTFIELD("Adjustment Exch. Rate Amount");
            TESTFIELD("Relational Adjmt Exch Rate Amt");
            "Exchange Rate Amount" := "Adjustment Exch. Rate Amount";
            "Relational Exch. Rate Amount" := "Relational Adjmt Exch Rate Amt";
        END;
        RelExchangeRateAmt := "AMC Sales Exch. Rate";
        ExchangeRateAmt := "Exchange Rate Amount";
        RelCurrencyCode := "Relational Currency Code";
        IF "Relational Currency Code" = '' THEN
            CurrencyFactor := "Exchange Rate Amount" / "Relational Exch. Rate Amount"
        ELSE BEGIN
            FindCurrency(Date, RelCurrencyCode, 2);
            IF NOT UseAdjmtAmounts THEN BEGIN
                TESTFIELD("AMC Sales Exch. Rate");
                TESTFIELD("Relational Exch. Rate Amount");
            END ELSE BEGIN
                TESTFIELD("Adjustment Exch. Rate Amount");
                TESTFIELD("Relational Adjmt Exch Rate Amt");
                "Exchange Rate Amount" := "Adjustment Exch. Rate Amount";
                "Relational Exch. Rate Amount" := "Relational Adjmt Exch Rate Amt";
            END;
            CurrencyFactor := (ExchangeRateAmt * "Exchange Rate Amount") / (RelExchangeRateAmt * "Relational Exch. Rate Amount");
        END;
        ExchangeDate := "Starting Date";
        AverangeRate := "Relational Exch. Rate Amount";
        EXIT(CurrencyFactor);
    end;


}