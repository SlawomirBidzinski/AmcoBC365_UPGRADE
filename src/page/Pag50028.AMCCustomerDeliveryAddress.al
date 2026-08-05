page 50028 "AMC Customer Delivery Address"
{
    ApplicationArea = All;
    Caption = 'Customer Delivery Adrress';
    PageType = ListPart;
    SourceTable = "Ship-to Address";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a ship-to address code.';
                }
                field("AMC ILN Code"; Rec."AMC ILN Code")
                {
                    ToolTip = 'Specifies the value of the ILN Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name associated with the ship-to address.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the ship-to address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the city the items are being shipped to.';
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the state, province, or county as a part of the address.';
                }
            }
        }
    }
}
