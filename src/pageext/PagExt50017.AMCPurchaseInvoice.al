pageextension 50017 "AMC Purchase Invoice" extends "Purchase Invoice"
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
                    Rec.LookupITINosTemplateCode(Enum::"Purchase Document Type"::Invoice);
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Purchase Document Type"::Invoice);
                end;
            }
        }
    }
}
