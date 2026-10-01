pageextension 50014 "AMC Sales Return Order" extends "Sales Return Order"
{
    layout
    {
        addfirst(General)
        {
            field("ITI Nos. Template Code"; Rec."ITI Nos. Template Code")
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    Rec.LookupITINosTemplateCode(Enum::"Sales Document Type"::"Return Order");
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Sales Document Type"::"Return Order");
                end;
            }
        }
    }
}
