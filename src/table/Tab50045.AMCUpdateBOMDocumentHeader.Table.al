table 50045 "AMC Update BOM Document Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Nr Dokumentu';
        }
        field(2; "Document Create Date"; Date)
        {
            Caption = 'Data utworzenia dokumentu';
        }
        field(3; "User Create Date"; Code[20])
        {
            Caption = 'Kod użytkownika';
            TableRelation = User;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Data księgowania';
        }
        field(5; "BOM Filter"; Code[200])
        {
            Caption = 'Filtr BOMu';
            TableRelation = "Production BOM Header";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(6; "BOM Type Filter"; Enum "AMC BOM Type")
        {
            Caption = 'Filtr Typu BOMu';
        }
        field(7; "Item Filter"; Code[200])
        {
            Caption = 'Filtr Zapasów';
            TableRelation = Item;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8; "Document Date"; Date)
        {
            Caption = 'Data Dokumentu';
        }
        field(9; "Document Status"; Enum "AMC Document Status")
        {
            Caption = 'Status Dokumentu';
        }
        field(10; Registered; Boolean)
        {
            Caption = 'Zarejestrowane';
        }
        field(11; "BOM FlowFilter"; Code[200])
        {
            Caption = 'BOM FlowFilter';
            FieldClass = FlowFilter;
        }
        field(12; "Item FlowFilter"; Code[200])
        {
            Caption = 'Item FlowFilter';
            FieldClass = FlowFilter;
        }
        field(13; "BOM Type FlowFilter"; Enum "AMC BOM Type")
        {
            Caption = 'BOM Type FlowFilter';
        }
        field(21; "BOM Updated by User"; Code[20])
        {
            Caption = 'BOM zaktualizowany przez';
        }
        field(22; "Date Time BOM Updated"; DateTime)
        {
            Caption = 'Czas Godz. Aktualizacji';
        }
        field(50; "No. Series"; Code[20])
        {
            Caption = 'Nr Serii';
        }
        field(100; "Release for Updateting"; Boolean)
        {
            Caption = 'Zgłoszone do Aktualizacji';
        }
        field(101; "User ID Release for Updateting"; Code[20])
        {
            Caption = 'Kod użytk. zgłasz. aktualiz.';
        }
        field(102; "Date Time Release for Updatein"; DateTime)
        {
            Caption = 'Czas Godz. Zgłoszenia';
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

