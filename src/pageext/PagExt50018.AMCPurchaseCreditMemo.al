pageextension 50018 "AMC Purchase Credit Memo" extends "Purchase Credit Memo"
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
                    Rec.LookupITINosTemplateCode(Enum::"Purchase Document Type"::"Credit Memo");
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Purchase Document Type"::"Credit Memo");
                end;
            }
        }
    }
}
