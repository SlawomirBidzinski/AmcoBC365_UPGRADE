tableextension 50050 "AMC Price List Line" extends "Price List Line"
{
    fields
    {
        field(50001; "AMC Item Long Description"; Text[70])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AMC Long Item Description" WHERE("No." = FIELD("Asset No.")));
            Caption = 'Item Long Description';
            Editable = false;
        }
        field(50002; "AMC Item Description"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Item.Description WHERE("No." = FIELD("Asset No.")));
            Caption = 'Opis Zapasu';
            Editable = false;
        }
        field(50003; "AMC Currency Base Price"; Boolean)
        {
            Caption = 'Cennik Walutowy';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Customer Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Source No.")));
            Caption = 'Nazwa Kontrahenta';
            Editable = false;
        }
        field(50005; "AMC Customer Quantity"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count(Customer WHERE("Customer Price Group" = FIELD("Source No.")));
            Caption = 'Ilość Nabywców';
            Editable = false;
        }
        field(50010; "AMC User ID"; Code[20])
        {
            Caption = 'UserID';
            TableRelation = User;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(50011; "AMCLast Change Date Time"; DateTime)
        {
            Caption = 'Last Change Date Time';
            DataClassification = CustomerContent;
        }
    }
}