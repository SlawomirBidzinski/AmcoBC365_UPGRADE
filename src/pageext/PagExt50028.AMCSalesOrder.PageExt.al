pageextension 50028 "AMC Sales Order Subpage" extends "Sales Order"
{
    layout
    {
        modify("Sell-to Contact")
        {
            Importance = Additional;
        }
        modify("Promised Delivery Date")
        {
            ApplicationArea = All;
            Importance = Standard;
            Visible = True;
        }
        addafter("Promised Delivery Date")
        {
            field("AMC Delivery Date"; Rec."AMC Delivery Date")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction Type"; Rec."AMC RW Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("AMC RW Fully Invoiced"; Rec."AMC RW Fully Invoiced")
                {
                    ApplicationArea = All;
                }
        }
        addlast(General)
        {

            field("AMC Shipment No"; Rec."AMC Shipment No")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Posted Shipment No"; Rec."AMC Posted Shipment No")
            {
                ApplicationArea = All;
                Editable = False;
                trigger OnDrillDown()
                var
                    PostWhseShipmHeadTemp: Record "Posted Whse. Shipment Header" temporary;
                    PostedWhseShipLine: Record "Posted Whse. Shipment Line";
                    PostedWhseShipmList: Page "Posted Whse. Shipment List";
                    ShipmentQty: Decimal;

                begin

                    CLEAR(PostWhseShipmHeadTemp);

                    PostedWhseShipLine.RESET;
                    PostedWhseShipLine.SETRANGE("Source Type", 37);
                    PostedWhseShipLine.SETRANGE("Source Subtype", 1);
                    PostedWhseShipLine.SETRANGE("Source No.", rec."No.");
                    IF PostedWhseShipLine.FINDFIRST THEN
                        REPEAT
                            PostWhseShipmHeadTemp.RESET;
                            PostWhseShipmHeadTemp.SETRANGE("No.", PostedWhseShipLine."No.");
                            IF NOT PostWhseShipmHeadTemp.FINDFIRST THEN BEGIN
                                PostedWhseShipHeader.GET(PostedWhseShipLine."No.");
                                PostWhseShipmHeadTemp.INIT;
                                PostWhseShipmHeadTemp.TRANSFERFIELDS(PostedWhseShipHeader);
                                PostWhseShipmHeadTemp.INSERT;
                            END;
                        UNTIL PostedWhseShipLine.NEXT = 0;

                    PostWhseShipmHeadTemp.RESET;
                    ShipmentQty := PostWhseShipmHeadTemp.COUNT;

                    IF ShipmentQty > 1 THEN BEGIN
                        Page.RUN(Page::"Posted Whse. Shipment List", PostWhseShipmHeadTemp);
                    END ELSE BEGIN
                        IF rec."AMC Posted Shipment No" <> '' THEN BEGIN
                            IF PostedWhseShipHeader.GET(rec."AMC Posted Shipment No") THEN
                                Page.RUN(Page::"Posted Whse. Shipment", PostedWhseShipHeader);
                        END;
                    END;
                end;
            }
            group("AMC EDI")
            {
                field("AMC EDI Customer"; Rec."AMC EDI Customer")
                {
                    ApplicationArea = All;
                }

                field("AMC EDI Order Status"; Rec."AMC EDI Order Status")
                {
                    ApplicationArea = All;
                }
            }

            group("AMC Szczegóły Zlecenia")
            {
                field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
                {
                    ApplicationArea = All;
                }

                field("AMC Creation Date"; Rec."AMC Creation Date")
                {
                    ApplicationArea = All;
                }
                field("AMC Drop Shipment"; Rec."AMC Drop Shipment")
                {
                    ApplicationArea = All;
                }

                field("AMC Customs Invoice"; Rec."AMC Customs Invoice")
                {
                    ApplicationArea = All;
                }

                field("AMC AmcoWeb Order"; Rec."AMC AmcoWeb Order")
                {
                    ApplicationArea = All;
                }

                field("AMC Invoice per Pieces"; Rec."AMC Invoice per Pieces")
                {
                    ApplicationArea = All;
                }
            }

            group("AMC Waluta Zamówienia")
            {
                field("AMC Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var

                    begin

                        IF rec."Currency Code" <> '' then
                            rec.Validate("AMC Currancy Exchange Date", rec."Posting Date")
                        else
                            rec.Validate("AMC Currancy Exchange Date", 0D);
                    end;

                }

                field("AMC Currancy Exchange Date"; Rec."AMC Currancy Exchange Date")
                {
                    ApplicationArea = All;
                }

                field("AMC Exchange Rate"; Rec."AMC Exchange Rate")
                {
                    ApplicationArea = All;
                }
                
            }

        }

        addafter(General)
        {
            group(AMCPriceCurr)
            {
                Caption = 'Waluta cennika - grupa';
                field("AMC Price Currency"; Rec."AMC Price Currency")
                {
                    ApplicationArea = All;
                }
                field("AMC Price Exch. Date"; Rec."AMC Price Exch. Date")
                {
                    ApplicationArea = All;
                }
                field("AMC Price Exch. Rate"; Rec."AMC Price Exch. Rate")
                {
                    ApplicationArea = All;
                    DecimalPlaces = 4 : 4;
                }
            }
        }
        addafter(AMCPriceCurr)
        {
            group(AMCNotes)
            {
                Caption = 'Notes';
                field("AMC Notes"; Rec."AMC Notes")
                {
                    ApplicationArea = All;
                }
                field("AMC Remarks from Shipment"; Rec."AMC Remarks from Shipment")
                {
                    ApplicationArea = All;
                }
            }
        }
        addafter("Invoice Details")
        {
            group(AMCLowPriceControl)
            {
                Caption = 'Low Price Controlling';

                group(AMCProfitCont)
                {
                    ShowCaption = false;
                }
                group("AMC Kontrola Niskiej Ceny")
                {
                    field("AMC Check For Low Price"; Rec."AMC Check For Low Price")
                    {
                        ApplicationArea = All;
                    }
                    field("AMC ID Authorise for Low Price"; Rec."AMC ID Authorise for Low Price")
                    {
                        ApplicationArea = All;
                    }

                    part(AMCProfitItemContr; "AMC Item Led. Profit Con. Sub.")
                    {
                        ApplicationArea = All;
                        Caption = 'Profit Control.';
                        SubPageLink = "Sales Order No." = FIELD("No.");
                    }
                }
            }

            group(AMCPaymentControl)
            {
                Caption = 'Payment Controlling';
                group("AMC Kontrola Płatności")
                {
                    field(AMCActualCustomerLimit; ActualCustomerLimit)
                    {
                        ApplicationArea = All;
                        Caption = 'Aktualny limit PLN';
                    }
                    field(AMCActualCustomerBalance; ActualCustomerBalance)
                    {
                        ApplicationArea = All;
                        Caption = 'Aktualne saldo PLN';
                    }
                    field(AMCCustomerBalanceAfterSale; CustomerBalanceAfterSale)
                    {
                        ApplicationArea = All;
                        Caption = 'Saldo po Trans. PLN';
                    }
                    field(AMCAmountIncludingVAT; Rec."Amount Including VAT")
                    {
                        ApplicationArea = All;
                    }
                    group("AMC Autoryzacja Płatności")
                    {
                        field("AMC Authorise for Limit"; Rec."AMC Authorise for Limit")
                        {
                            ApplicationArea = All;
                        }
                        field("AMC Authorise UserID"; Rec."AMC Authorise UserID")
                        {
                            ApplicationArea = All;
                        }
                        field("AMC Authorise Date"; Rec."AMC Authorise Date")
                        {
                            ApplicationArea = All;
                        }
                    }

                    part(AMCPayAutorContr; "AMC Pay. Autor. Contr. Subpage")
                    {
                        ApplicationArea = All;
                        Caption = 'Payment Control.';
                        SubPageLink = "Document No." = field("No."), "Document Type" = field("Document Type");
                    }
                    part(AMCSalesCommentLines; "AMC Sales Comment Subpage")
                    {
                        ApplicationArea = All;
                        SubPageLink = "Document Type" = CONST(Order), "No." = FIELD("No.");
                    }
                }
            }
        }
        modify("Sell-to Customer No.")
        {
            Importance = Standard;
        }
        modify("Opportunity No.")
        {
            Visible = false;
        }
        modify("Shipment Date")
        {
            Importance = Standard;
        }
        modify("Requested Delivery Date")
        {
            Importance = Standard;
        }
        modify("Payment Method Code")
        {
            Importance = Standard;
        }
        modify("Payment Terms Code")
        {
            Importance = Standard;
        }
        modify("Due Date")
        {
            Importance = Standard;
        }
        modify("Salesperson Code")
        {
            Importance = Standard;
        }
        modify("Sell-to Address")
        {
            Importance = Standard;
        }
        modify("Sell-to Address 2")
        {
            Importance = Additional;
        }
        modify("Sell-to City")
        {
            Importance = Standard;
        }
        modify("Sell-to Post Code")
        {
            Importance = Standard;
        }
        modify("ITI VAT Settlement Date")
        {
            Importance = Standard;
        }
        modify("VAT Reporting Date")
        {
            Importance = Standard;
        }
        modify("Sell-to Country/Region Code")
        {
            Importance = Standard;
        }
        modify("VAT Registration No.")
        {
            Importance = Standard;
        }
        modify("Campaign No.")
        {
            Visible = False;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }

    actions
    {
        addafter("Create &Warehouse Shipment")
        {
            action(AMCWhseShpt)
            {
                ApplicationArea = All;
                Image = NewShipment;
                Caption = 'Wydanie Magazynowe';

                trigger OnAction()
                var
                    WhseShipHeader: Record "Warehouse Shipment Header";
                    GetSourceDocOutbound: Codeunit "Get Source Doc. Outbound";
                begin
                    IF Rec."AMC Shipment No" <> '' THEN BEGIN
                        IF WhseShipHeader.GET(Rec."AMC Shipment No") THEN
                            Page.RUN(Page::"Warehouse Shipment", WhseShipHeader);
                    END ELSE BEGIN
                        GetSourceDocOutbound.CreateFromSalesOrder(Rec);
                        IF NOT Rec.FIND('=><') THEN
                            Rec.INIT();
                    END;
                end;
            }
            action(AMCPostedWhseDoc)
            {
                ApplicationArea = All;
                Caption = 'Posted Whse. Shipment';
                Image = PostedReceipt;
                RunObject = page "Posted Whse. Shipment Lines";
                RunPageLink = "Source Document" = const("Sales Order"), "Source No." = field("No.");
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CalculateCustomerLimit();
        CalculateOrderValue();
    end;

    local procedure CalculateCustomerLimit()
    var
        CustomerRec: Record Customer;
        SetOffLimit: Boolean;
    begin
        ActualCustomerLimit := 0;
        ActualCustomerBalance := 0;
        CustomerBalanceAfterSale := 0;
        PLNCurrencyCode := 'PLN';

        IF Rec."Bill-to Customer No." <> '' THEN
            IF CustomerRec.GET(Rec."Bill-to Customer No.") THEN BEGIN
                CustomerRec.CALCFIELDS("Balance (LCY)");
                ActualCustomerBalance := CustomerRec."Balance (LCY)";
                ActualCustomerLimit := CustomerRec."Credit Limit (LCY)";
                SetOffLimit := CustomerRec."AMC Set Off Customer Limit";
                IF (Rec."Currency Code" = '') OR (Rec."Currency Code" = 'PLN') THEN
                    CustomerBalanceAfterSale := ActualCustomerBalance + OrderGrossAmount
                ELSE
                    CustomerBalanceAfterSale := ActualCustomerBalance + ROUND(OrderGrossAmount * Rec."AMC Exchange Rate", 0.01);
            END;

        IF SetOffLimit = FALSE THEN
            IF (CustomerBalanceAfterSale <> 0) THEN
                IF CustomerBalanceAfterSale > ActualCustomerLimit THEN
                    LimitWarr := FALSE
                ELSE
                    LimitWarr := TRUE
            ELSE
                LimitWarr := TRUE;
    end;

    local procedure CalculateOrderValue()
    var
        SalesLineRec: Record "Sales Line";
    begin
        IF Rec."Currency Code" <> '' THEN
            CurrencyCode := Rec."Currency Code"
        ELSE
            CurrencyCode := 'PLN';

        CASE Rec.Status OF
            Rec.Status::Open:
                BEGIN
                    OrderNetAmount := 0;
                    OrderGrossAmount := 0;
                END;

            Rec.Status::Released:
                BEGIN
                    OrderNetAmount := 0;
                    OrderGrossAmount := 0;
                    SalesLineRec.RESET();
                    SalesLineRec.SETRANGE("Document Type", Rec."Document Type");
                    SalesLineRec.SETRANGE("Document No.", Rec."No.");
                    IF SalesLineRec.FindSet() THEN
                        REPEAT
                            OrderNetAmount := OrderNetAmount + SalesLineRec.Amount;
                            OrderGrossAmount := OrderGrossAmount + SalesLineRec."Amount Including VAT";
                        UNTIL SalesLineRec.NEXT() = 0;
                END;
        END;
    end;

    var
        PostedWhseShipHeader: Record "Posted Whse. Shipment Header";
        ChangeExchangeRate: Page "Change Exchange Rate";
        ActualCustomerLimit: Decimal;
        ActualCustomerBalance: Decimal;
        CustomerBalanceAfterSale: Decimal;
        OrderGrossAmount: Decimal;
        OrderNetAmount: Decimal;
        CurrencyCode: Code[20];
        PLNCurrencyCode: Code[20];
        LimitWarr: Boolean;
}
