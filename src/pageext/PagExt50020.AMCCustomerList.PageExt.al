pageextension 50020 "AMC Customer List" extends "Customer List"
{
    layout
    {
        moveafter(Name; "Search Name")
        modify("Search Name")
        {
            Visible = True;
        }

        modify("Responsibility Center")
        {
            Visible = False;
        }
        addlast(Control1)
        {
            field("AMC Customer Type"; Rec."AMC Customer Type")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Segment Key"; Rec."AMC Customer Segment Key")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Industry Key"; Rec."AMC Customer Industry Key")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC MOS Customer Code"; Rec."AMC MOS Customer Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Frutarom Customer"; Rec."AMC Frutarom Customer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }

            field("AMC Invoice per Pieces"; Rec."AMC Invoice per Pieces")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC EDI Customer"; Rec."AMC EDI Customer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC ILN"; Rec."AMC ILN")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }

            field("AMC ILN Buyer"; Rec."AMC ILN Buyer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC EDI Transaction Type"; Rec."AMC EDI Transaction Type")

            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC EDI Code By Buyer"; Rec."AMC EDI Code By Buyer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Electronic Form Inv. Agr."; Rec."AMC Electronic Form Inv. Agr.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Invoice e-mail Address"; Rec."AMC Invoice e-mail Address")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Period Discount Type"; Rec."AMC Period Discount Type")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Period Discount [%]"; Rec."AMC Period Discount [%]")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Discount Agreement"; Rec."AMC Discount Agreement")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Qty of Discount Corr. Inv"; Rec."AMC Qty of Discount Corr. Inv")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Corr.Invoice No"; Rec."AMC Corr.Invoice No")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Discount Line Invoice"; Rec."AMC Discount Line Invoice")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Set Payment Customer"; Rec."AMC Set Payment Customer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Payment Customer Code"; Rec."AMC Payment Customer Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Payment Customer Name"; Rec."AMC Payment Customer Name")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Bill-To No. of Invoices RW"; Rec."AMC Bill-To No. of Invoices RW")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC No. of Invoices RW"; Rec."AMC No. of Invoices RW")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Set to Export"; Rec."AMC Set to Export")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Export Date"; Rec."AMC Export Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Export Time"; Rec."AMC Export Time")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Full Exp Date"; Rec."AMC Full Exp Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC RODO Customer"; Rec."AMC RODO Customer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC RODO Infor. Date"; Rec."AMC RODO Infor. Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC RODO Infor. Time"; Rec."AMC RODO Infor. Time")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC RODO Infor. Send Time"; Rec."AMC RODO Infor. Send Time")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC RODO Email Send"; Rec."AMC RODO Email Send")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Group Code"; Rec."AMC Customer Group Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Group name"; Rec."AMC Customer Group name")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer RF"; Rec."AMC Customer RF")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer RF Limit"; Rec."AMC Customer RF Limit")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer RF Limit Used"; Rec."AMC Customer RF Limit Used")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Set Off Customer Limit"; Rec."AMC Set Off Customer Limit")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Last Limit Change UserId"; Rec."AMC Last Limit Change UserId")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Last Limit Change Date"; Rec."AMC Last Limit Change Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Minimum Limit"; Rec."AMC Minimum Limit")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Maksimum Limit"; Rec."AMC Maksimum Limit")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Calculate Limit Date"; Rec."AMC Calculate Limit Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Minimum Limit Date"; Rec."AMC Minimum Limit Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Maximum Limit Date"; Rec."AMC Maximum Limit Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Set Limit Date From"; Rec."AMC Set Limit Date From")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Avarage Payment Days"; Rec."AMC Avarage Payment Days")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Debt Collection Notes"; Rec."AMC Debt Collection Notes")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Vendor per NIP Qty"; Rec."AMC Vendor per NIP Qty")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Sales All (LCY)"; Rec."AMC Sales All (LCY)")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Invoice All (LCY)"; Rec."AMC Invoice All (LCY)")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Payments All (LCY)"; Rec."AMC Payments All (LCY)")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Sales Item"; Rec."AMC Sales Item")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Sales Item All"; Rec."AMC Sales Item All")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Item COGS"; Rec."AMC Item COGS")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Item COGS All"; Rec."AMC Item COGS All")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Sales Resource"; Rec."AMC Sales Resource")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Sales Resource All"; Rec."AMC Sales Resource All")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Prepayment Balance"; Rec."AMC Prepayment Balance")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Bank No."; Rec."AMC Bank No.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Bank Name"; Rec."AMC Bank Name")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Qty E-mail Sent"; Rec."AMC Qty E-mail Sent")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Name 1"; Rec."AMC Emergency Name 1")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Phone 1"; Rec."AMC Emergency Phone 1")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency  Email 1"; Rec."AMC Emergency  Email 1")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Name 2"; Rec."AMC Emergency Name 2")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Phone 2"; Rec."AMC Emergency Phone 2")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Email 2"; Rec."AMC Emergency Email 2")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Adres E-mail Windykacji"; Rec."AMC Adres E-mail Windykacji")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Imię i Nazwisko Windykacja"; Rec."AMC Imię i Nazwisko Windykacja")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Telefon Windykacja"; Rec."AMC Telefon Windykacja")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
        }
    }
}