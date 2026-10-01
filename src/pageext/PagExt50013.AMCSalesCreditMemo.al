pageextension 50013 "AMC Sales Credit Memo" extends "Sales Credit Memo"
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
                    Rec.LookupITINosTemplateCode(Enum::"Sales Document Type"::"Credit Memo");
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Sales Document Type"::"Credit Memo");
                end;
            }
        }
    }
}
