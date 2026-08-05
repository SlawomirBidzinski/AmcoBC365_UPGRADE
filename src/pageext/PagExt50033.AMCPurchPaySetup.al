pageextension 50033 "AMC Purch. & Pay. Setup" extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(General)
        {
            field("AMC Purch Planning Flexibility"; Rec."AMC Purch Planning Flexibility")
            {
                ApplicationArea = All;
            }
            field("AMC Purchase Order Email"; Rec."AMC Purchase Order Email")
            {
                ApplicationArea = All;
            }
            field("AMC Location Code"; Rec."AMC Location Code")
            {
                ApplicationArea = All;
            }
        }
        addlast("Number Series")
        {
            field("AMC PW Receipt No."; Rec."AMC PW Receipt No.")
            {
                ApplicationArea = All;
            }
            field("AMC PW Receipt Invoiced No."; Rec."AMC PW Receipt Invoiced No.")
            {
                ApplicationArea = All;
            }
            field("AMC PW Business Posting Group"; Rec."AMC PW Business Posting Group")
            {
                ApplicationArea = All;
            }
            field("AMC PW QC Posting Status"; Rec."AMC PW QC Posting Status")
            {
                ApplicationArea = All;
            }
            field("AMC PW QC Status"; Rec."AMC PW QC Status")
            {
                ApplicationArea = All;
            }
            field("AMC Item Calculation Nos."; Rec."AMC Item Calculation Nos.")
            {
                ApplicationArea = All;
            }
            field("AMC Item Update Request Nos."; Rec."AMC Item Update Request Nos.")
            {
                ApplicationArea = All;
            }
            field("AMC Default Item Budget Inst."; Rec."AMC Default Item Budget Inst.")
            {
                ApplicationArea = All;
            }
        }
        addlast(content)
        {
            group(AMCKJ)
            {
                Caption = 'KJ';

                field("AMC Item KJ Location"; Rec."AMC Item KJ Location")
                {
                    ApplicationArea = All;
                }
                field("AMC Item KJ Quantity [szt]"; Rec."AMC Item KJ Quantity [szt]")
                {
                    ApplicationArea = All;
                }
                field("AMC Item KJ Source Location"; Rec."AMC Item KJ Source Location")
                {
                    ApplicationArea = All;
                }
                field("AMC Item KJ Weight [kg]"; Rec."AMC Item KJ Weight [kg]")
                {
                    ApplicationArea = All;
                }
                field("AMC Use Item KJ Registry"; Rec."AMC Use Item KJ Registry")
                {
                    ApplicationArea = All;
                }
                field("AMC Item Type for KJ"; Rec."AMC Item Type for KJ")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
