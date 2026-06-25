pageextension 50033 AMCVendorCardExt extends "Vendor Card"
{
    layout
    {
        addlast("Address & Contact")
        {
            group(AMCEmergencyContact)
            {
                Caption = 'Emergency Contact';
                field("AMC Phone No."; Rec."AMC Alarm Phone No.")
                {
                    ApplicationArea = All;
                }
            }

            group(AMCEISDataExport)
            {
                Caption = 'EIS Data Export';

                field("AMC Set to Export"; Rec."AMC Set to Export")
                {
                    ApplicationArea = All;
                }
                field("AMC Vendor Type"; Rec."AMC Vendor Type")
                {
                    ApplicationArea = All;
                }
                field("AMC Export Date"; Rec."AMC Export Date")
                {
                    ApplicationArea = All;
                }
                field("AMC Export Time"; Rec."AMC Export Time")
                {
                    ApplicationArea = All;
                }
            }
        }

        addafter("Shipment Method Code")
        {
            field("AMC Place of Transport"; Rec."AMC Place of Transport")
            {
                ApplicationArea = All;
            }
        }
    }
}