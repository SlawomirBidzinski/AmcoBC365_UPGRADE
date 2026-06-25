pageextension 50025 "AMC Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("AMC Default Currency Bank Acc."; Rec."AMC Default Currency Bank Acc.")
            {
                ApplicationArea = All;
            }
            field("AMC Check Sales Limits"; Rec."AMC Check Sales Limits")
            {
                ApplicationArea = All;
            }
            field("AMC Additional Invoice Notes"; Rec."AMC Additional Invoice Notes")
            {
                ApplicationArea = All;
            }
        }
        addlast(Dimensions)
        {
            field("AMC Manufacturer DimensionCode"; Rec."AMC Manufacturer DimensionCode")
            {
                ApplicationArea = All;
            }
        }
        addlast("Number Series")
        {
            field("AMC RW Item Nos."; Rec."AMC RW Item Nos.")
            {
                ApplicationArea = All;
            }
            field("AMC Customs Inv. Corr. Nos"; Rec."AMC Customs Inv. Corr. Nos")
            {
                ApplicationArea = All;
            }
            field("AMC Customs Inv. Nos"; Rec."AMC Customs Inv. Nos")
            {
                ApplicationArea = All;
            }
            field("AMC Technolog Card Nos"; Rec."AMC Technolog Card Nos")
            {
                ApplicationArea = All;
            }
            field("AMC Project Card Nos"; Rec."AMC Project Card Nos")
            {
                ApplicationArea = All;
            }
            field("AMC Discount Corr. Inv Nos"; Rec."AMC Discount Corr. Inv Nos")
            {
                ApplicationArea = All;
            }
            field("AMC Posted Disc. Corr. Inv Nos"; Rec."AMC Posted Disc. Corr. Inv Nos")
            {
                ApplicationArea = All;
            }
            field("AMC Product Card Nos"; Rec."AMC Product Card Nos")
            {
                ApplicationArea = All;
            }
        }
        addlast(content)
        {
            group(AMCEDI)
            {
                Caption = 'EDI';

                field("AMC EDI Invoice File"; Rec."AMC EDI Invoice File")
                {
                    ApplicationArea = All;
                }
                field("AMC EDI Duplicate Invoice"; Rec."AMC EDI Duplicate Invoice")
                {
                    ApplicationArea = All;
                }
                field("AMC EDI Order xml port"; Rec."AMC EDI Order xml port")
                {
                    ApplicationArea = All;
                }
                field("AMC AMC EDI Invoice xml port"; Rec."AMC AMC EDI Invoice xml port")
                {
                    ApplicationArea = All;
                }
                field("AMC EDI Cred Memo xml port"; Rec."AMC EDI Cred Memo xml port")
                {
                    ApplicationArea = All;
                }
                field("AMC Amco EDI Use"; Rec."AMC Amco EDI Use")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Use"; Rec."AMC Selgros EDI Use")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Archive Path"; Rec."AMC Selgros EDI Archive Path")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Source Path"; Rec."AMC Selgros EDI Source Path")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Invoice File"; Rec."AMC Selgros EDI Invoice File")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Dupl. Invoice"; Rec."AMC Selgros EDI Dupl. Invoice")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Order xml port"; Rec."AMC Selgros EDI Order xml port")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Invoice xml port"; Rec."AMC Selgros EDI Inv. xml port")
                {
                    ApplicationArea = All;
                }
                field("AMC Selgros EDI Cred Memo xml port"; Rec."AMC Sel. EDI Cr. Memo XMLPort")
                {
                    ApplicationArea = All;
                }
                field("AMC EDI Archive Path"; Rec."AMC EDI Archive Path")
                {
                    ApplicationArea = All;
                }
                field("AMC EDI Source Path"; Rec."AMC EDI Source Path")
                {
                    ApplicationArea = All;
                }
                field("AMC Use EDI File Monitor"; Rec."AMC Use EDI File Monitor")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCRD)
            {
                Caption = 'R&&D';

                field("AMC EIS Export Item"; Rec."AMC EIS Export Item")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Customer"; Rec."AMC EIS Export Customer")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Salesperson"; Rec."AMC EIS Export Salesperson")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Invoices"; Rec."AMC EIS Export Invoices")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Vendor"; Rec."AMC EIS Export Vendor")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Purchase Ord"; Rec."AMC EIS Export Purchase Ord")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Inbound Tran"; Rec."AMC EIS Export Inbound Tran")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Sales Ord"; Rec."AMC EIS Export Sales Ord")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Purchase Inv"; Rec."AMC EIS Export Purchase Inv")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Export Prod. BOM"; Rec."AMC EIS Export Prod. BOM")
                {
                    ApplicationArea = All;
                }
                field("AMC EIS Customer Code"; Rec."AMC EIS Customer Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Invoice PDF Catalog"; Rec."AMC Invoice PDF Catalog")
                {
                    ApplicationArea = All;
                }
                field("AMC Invoice Setting Date From"; Rec."AMC Invoice Setting Date From")
                {
                    ApplicationArea = All;
                }
                field("AMC Frutarom Export Path"; Rec."AMC Frutarom Export Path")
                {
                    ApplicationArea = All;
                }
                field("AMC Rebate Account"; Rec."AMC Rebate Account")
                {
                    ApplicationArea = All;
                }
                field("AMC Export Rebate Balance"; Rec."AMC Export Rebate Balance")
                {
                    ApplicationArea = All;
                }
                field("AMC Item Rebate Code"; Rec."AMC Item Rebate Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Addit. Manuf. Cost Account"; Rec."AMC Addit. Manuf. Cost Account")
                {
                    ApplicationArea = All;
                }
                field("AMC Cost of Purchase Frutarom"; Rec."AMC Cost of Purchase Frutarom")
                {
                    ApplicationArea = All;
                }
                field("AMC ExportAdditandPurchaseCost"; Rec."AMC ExportAdditandPurchaseCost")
                {
                    ApplicationArea = All;
                }
                field("AMC CostAccount of Utilization"; Rec."AMC CostAccount of Utilization")
                {
                    ApplicationArea = All;
                }
                field("AMC CostAccount Matrial Losses"; Rec."AMC CostAccount Matrial Losses")
                {
                    ApplicationArea = All;
                }
                field("AMC Addit. Manuf. Cost Code"; Rec."AMC Addit. Manuf. Cost Code")
                {
                    ApplicationArea = All;
                }
                field("AMC CostofPurchaseFrutaromCode"; Rec."AMC CostofPurchaseFrutaromCode")
                {
                    ApplicationArea = All;
                }
                field("AMC Cost of Utilization Code"; Rec."AMC Cost of Utilization Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Cost Matrial Losses Code"; Rec."AMC Cost Matrial Losses Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Trans.Code for Value Corr."; Rec."AMC Trans.Code for Value Corr.")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCAmco)
            {
                Caption = 'AMCO';

                field("AMC Consolidate Item Code 2"; Rec."AMC Consolidate Item Code 2")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Desc. 2"; Rec."AMC Consolidate Item Desc. 2")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item UnitCode2"; Rec."AMC Consolidate Item UnitCode2")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Code 3"; Rec."AMC Consolidate Item Code 3")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Desc. 3"; Rec."AMC Consolidate Item Desc. 3")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item UnitCode3"; Rec."AMC Consolidate Item UnitCode3")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Code 4"; Rec."AMC Consolidate Item Code 4")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Desc. 4"; Rec."AMC Consolidate Item Desc. 4")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item UnitCode4"; Rec."AMC Consolidate Item UnitCode4")
                {
                    ApplicationArea = All;
                }
                field("AMC Production Forecast Code"; Rec."AMC Production Forecast Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Catalog Price Currency"; Rec."AMC Catalog Price Currency")
                {
                    ApplicationArea = All;
                }
                field("AMC RW Invoiced Correction No."; Rec."AMC RW Invoiced Correction No.")
                {
                    ApplicationArea = All;
                }
                field("AMC RW Open Correction No."; Rec."AMC RW Open Correction No.")
                {
                    ApplicationArea = All;
                }
                field("AMC RW Business Posting Group"; Rec."AMC RW Business Posting Group")
                {
                    ApplicationArea = All;
                }
                field("AMC Service Invoice"; Rec."AMC Service Invoice")
                {
                    ApplicationArea = All;
                }
                field("AMC Service Corr. Invoice"; Rec."AMC Service Corr. Invoice")
                {
                    ApplicationArea = All;
                }
                field("AMC Set Postponed VAT"; Rec."AMC Set Postponed VAT")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Code"; Rec."AMC Consolidate Item Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Desc."; Rec."AMC Consolidate Item Desc.")
                {
                    ApplicationArea = All;
                }
                field("AMC Consolidate Item Unit Code"; Rec."AMC Consolidate Item Unit Code")
                {
                    ApplicationArea = All;
                }
                field("AMC RW Return Order Corr. No."; Rec."AMC RW Return Order Corr. No.")
                {
                    ApplicationArea = All;
                }
                field("AMC RW Credit Memo Corr. No."; Rec."AMC RW Credit Memo Corr. No.")
                {
                    ApplicationArea = All;
                }
                field("AMC Paym. Code Customer Inv."; Rec."AMC Paym. Code Customer Inv.")
                {
                    ApplicationArea = All;
                }
                field("AMC Disc. Corr. ItemChargeCode"; Rec."AMC Disc. Corr. ItemChargeCode")
                {
                    ApplicationArea = All;
                }
                field("AMC Kod Regionu - Centrala"; Rec."AMC Kod Regionu - Centrala")
                {
                    ApplicationArea = All;
                }
                field("AMC Karta Techn. PDF Catalog"; Rec."AMC Karta Techn. PDF Catalog")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCAuth)
            {
                Caption = 'Authorisation';

                field("AMC Profit Level (%)"; Rec."AMC Profit Level (%)")
                {
                    ApplicationArea = All;
                }
                field("AMC Profit Control"; Rec."AMC Profit Control")
                {
                    ApplicationArea = All;
                }
                field("AMC Paymant Days Block"; Rec."AMC Paymant Days Block")
                {
                    ApplicationArea = All;
                }
                field("AMC Payment Value Block"; Rec."AMC Payment Value Block")
                {
                    ApplicationArea = All;
                }
                field("AMC Payment Control Set"; Rec."AMC Payment Control Set")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
