page 50045 "AMC Pay. Autor. Contr. Subpage"
{
    ApplicationArea = All;
    Caption = 'Pay. Autor. Contr. Subpage';
    PageType = ListPart;
    SourceTable = "AMC Payment Autor. Contr.";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Bill to Customer Code"; Rec."Bill to Customer Code")
                {
                    ApplicationArea = All;
                }
                field("Bill to Customer Name"; Rec."Bill to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Days Limit"; Rec."Days Limit")
                {
                    ApplicationArea = All;
                }
                field("Balance Limit"; Rec."Balance Limit")
                {
                    ApplicationArea = All;
                }
                field("Payment Control Date"; Rec."Payment Control Date")
                {
                    ApplicationArea = All;
                }
                field("Customer Payment Balance"; Rec."Customer Payment Balance")
                {
                    ApplicationArea = All;
                }
                field("Customer Balance Overterm"; Rec."Customer Balance Overterm")
                {
                    ApplicationArea = All;
                }
                field("Qty of Days past Due"; Rec."Qty of Days past Due")
                {
                    ApplicationArea = All;
                }
                field("Invoice Authorisation Amount"; Rec."Invoice Authorisation Amount")
                {
                    ApplicationArea = All;
                }
                field("Authorisation for Posting"; Rec."Authorisation for Posting")
                {
                    ApplicationArea = All;
                }
                field("Author UserId"; Rec."Author UserId")
                {
                    ApplicationArea = All;
                }
                field("Author. Date"; Rec."Author. Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
