pageextension 50032 "AMC Purchase Order List Ext" extends "Purchase Order List"
{
    AdditionalSearchTerms = 'Procurement List, Buy Order Overview, Vendor Orders, Order Purchase Log, Acquisition List, Supplier Orders, Buy List, Purchase Log, Supply Order List, Goods Order Overview';

    layout
    {
        addafter("No.")
        {
            field("AMC PW Transaction"; Rec."AMC PW Transaction")
            {
                ApplicationArea = All;
            }
        }
        addafter(Status)
        {
            field("AMC Receipt No."; Rec."AMC Receipt No.")
            {
                ApplicationArea = All;
            }
            field("AMC Posted Whse. Receipt No."; Rec."AMC Posted Whse. Receipt No.")
            {
                ApplicationArea = All;
            }
            field("AMC Posted Receipt No."; Rec."AMC Posted Receipt No.")
            {
                ApplicationArea = All;
            }
        }

        moveafter("Document Date"; "Requested Receipt Date")
        modify("Requested Receipt Date")
        {
            Visible = true;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        addafter("Requested Receipt Date")
        {

            field("Promised Receipt Date"; Rec."Promised Receipt Date")
            {
                ApplicationArea = All;
            }
        }
        addbefore(Status)
        {
            field("AMC Purchase Order Status"; Rec."AMC Purchase Order Status")
            {
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("AMC PW Transaction", false);
    end;
}
