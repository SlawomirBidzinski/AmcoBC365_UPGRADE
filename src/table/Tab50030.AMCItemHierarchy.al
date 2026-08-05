table 50030 "AMC Item Hierarchy"
{
    Caption = 'Item hierarchy';
    DrillDownPageId = "AMC Hierarchies";
    LookupPageId = "AMC Hierarchies";
    DataClassification = CustomerContent;    

    fields
    {
        field(1; "Hierachy key"; Code[50])
        {
            Caption = 'User Name';
            DataClassification = CustomerContent;
        }
        field(2; "Description - Level 5"; Text[60])
        {
            Caption = 'Item No.';
            NotBlank = true;
            DataClassification = CustomerContent;
        }
        field(50001; "Description - Level 4"; Text[60])
        {
            Caption = 'Description 4'; //TODO 'Opis 4';
            DataClassification = CustomerContent;
        }
        field(50002; "Description - Level 3"; Text[60])
        {
            Caption = 'Description 3'; //TODO 'Opis 3';
            DataClassification = CustomerContent;
        }
        field(50003; "Description - Level 2"; Text[60])
        {
            Caption = 'Description 2'; //TODO 'Opis 2';
            DataClassification = CustomerContent;
        }
        field(50004; "Description - Level 1"; Text[60])
        {
            Caption = 'Description 1'; //TODO 'Opis 1';
            DataClassification = CustomerContent;
        }
        field(50005; Name; Text[60])
        {
            Caption = 'Name'; //TODO 'Nazwa';
            DataClassification = CustomerContent;
        }
        field(50006; "Hierarcy Notes"; Text[200])
        {
            Caption = 'Hierarchy Notes'; //TODO 'Uwagi';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Hierachy key")
        {
            Clustered = true;
        }
    }
}
