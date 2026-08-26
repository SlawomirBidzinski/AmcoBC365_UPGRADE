pageextension 50071 "AMC Posted Sales Shipment Ext." extends "Posted Sales Shipment"
{
    layout
    {
        addlast(General)
        {
            field("AMC RW Transaction Type"; Rec."AMC RW Transaction Type")
            {
                Importance = Additional;
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC AmcoWeb Order"; Rec."AMC AmcoWeb Order")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC RW for CRP"; Rec."AMC RW for CRP")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC EDI Customer"; Rec."AMC EDI Customer")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Customs Invoice"; Rec."AMC Customs Invoice")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Drop Shipment"; Rec."AMC Drop Shipment")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Currancy Exchange Date"; Rec."AMC Currancy Exchange Date")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Exchange Rate"; Rec."AMC Exchange Rate")
            {
                ApplicationArea = All;
                DecimalPlaces = 4 : 4;
                Editable = False;
            }
        }
        addafter(General)
        {
            group(AMCNotes)
            {
                Caption = 'Notes';
                field("AMC Notes"; Rec."AMC Notes")
                {
                    ApplicationArea = All;
                    Editable = False;
                }
            }
            group(AMCPriceCurr)
            {
                Caption = 'Waluta cennika - grupa';
                field("AMC Price Currency"; Rec."AMC Price Currency")
                {
                    ApplicationArea = All;
                    Editable = False;
                }
                field("AMC Price Exch. Date"; Rec."AMC Price Exch. Date")
                {
                    ApplicationArea = All;
                    Editable = False;
                }
                field("AMC Price Exch. Rate"; Rec."AMC Price Exch. Rate")
                {
                    ApplicationArea = All;
                    DecimalPlaces = 4 : 4;
                    Editable = False;
                }
            }
        }
        addlast(content)
        {
            /*group(AMCControl)
            {
                Caption = 'Controlling';

                group(AMCProfitCont)
                {
                    ShowCaption = false;
                    field("AMC Check For Low Price"; Rec."AMC Check For Low Price")
                    {
                        ApplicationArea = All;
                    }
                    field("AMC ID Authorise for Low Price"; Rec."AMC ID Authorise for Low Price")
                    {
                        ApplicationArea = All;
                    }
                    field("AMC Customer Serach Name"; Rec."AMC Customer Serach Name")
                    {
                        ApplicationArea = All;
                    }
                    part(AMCProfitItemContr; "AMC Item Led. Profit Con. Sub.")
                    {
                        ApplicationArea = All;
                        Caption = 'Profit Control.';
                        SubPageLink = "Sales Order No." = FIELD("No.");
                    }
                    part(AMCPayAutorContr; "AMC Pay. Autor. Contr. Subpage")
                    {
                        ApplicationArea = All;
                        Caption = 'Payment Control.';
                        SubPageLink = "Document No." = field("No.");
                    }
                    part(AMCSalesCommentLines; "AMC Sales Comment Subpage")
                    {
                        ApplicationArea = All;
                        SubPageLink = "Document Type" = CONST(Order), "No." = FIELD("No.");
                    }
                    grid(AMC3rdRow)
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
                }
            }
            */
        }
        modify("Shipment Date")
        {
            Importance = Standard;
        }
        modify("Requested Delivery Date")
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
            Importance = Standard;
        }
        modify("Sell-to City")
        {
            Importance = Standard;
        }
        modify("Sell-to Post Code")
        {
            Importance = Standard;
        }
        modify("Sell-to Country/Region Code")
        {
            Importance = Standard;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }
}
