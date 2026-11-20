tableextension 50013 "AMC Item Templ." extends "Item Templ."
{
    fields
    {
        field(50010; "AMC Sample Type"; Enum "AMC Sample Type")
        {
            Caption = 'Sample Type';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                ItemTemplate: Record "Item Templ.";
                ExistingRecErrLbl: Label 'The template with %1 already exists';
            begin
                if "AMC Sample Type" = "AMC Sample Type"::" " then
                    exit;

                ItemTemplate.Reset();
                ItemTemplate.SetRange("AMC Sample Type", Rec."AMC Sample Type");
                ItemTemplate.SetFilter(Code, '<>%1', Rec.Code);
                if not ItemTemplate.IsEmpty then
                    Error(ExistingRecErrLbl, Rec."AMC Sample Type");
            end;
        }
        field(50011; "AMC Location Code"; Code[20])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
    }
}
