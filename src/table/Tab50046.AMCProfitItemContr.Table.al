table 50046 "AMC Profit Item Contr."
{
    Caption = 'Profit Item Contr.';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(2; "Sales Order Line"; Integer)
        {
            Caption = 'Sales Order Line';
        }
        field(4; "Item Leger Entry No."; Integer)
        {
            Caption = 'Item Leger Entry No.';
        }
        field(5; "Item Code"; Code[20])
        {
            Caption = 'Nr Zapasu';
            TableRelation = Item;
        }
        field(6; "Item Description"; Text[50])
        {
            Caption = 'Nazwa Zapasu';
        }
        field(7; "Unit of Measure Code"; Code[20])
        {
            Caption = 'Kod Jedn. Miary';
        }
        field(8; "Lot No"; Code[20])
        {
            Caption = 'Nr Partii';
        }
        field(10; "Sales Shipment No"; Code[20])
        {
            Caption = 'Nr Wydania Sprzedaży';
            TableRelation = "Sales Shipment Header"."No.";
        }
        field(11; "Sales Shipment Line No"; Integer)
        {
            Caption = 'Nr Linii Wydania Sprzedaży';
        }
        field(12; "Quantity Shipment"; Decimal)
        {
            Caption = 'Ilość Wydana';
        }
        field(13; "Quantity Verified to Invoice"; Decimal)
        {
            Caption = 'Ilość Zatwierdzona do Faktur.';
        }
        field(50; "Checked for Low Price"; Boolean)
        {
            Caption = 'Skontrolowano Próg Ceny';
        }
        field(51; "Profit Check UserId"; Code[20])
        {
            Caption = 'Kod Użytk. Kontroli';
            TableRelation = User;
            ValidateTableRelation = false;
        }
        field(52; "Profit Calc Date"; DateTime)
        {
            Caption = 'Data Kontroli';
        }
        field(53; "Profit % Level"; Decimal)
        {
            Caption = 'Próg Zysk [%]';
        }
        field(60; "Authorised User"; Code[20])
        {
            Caption = 'Użytk. Autoryzujący';
        }
        field(101; "Sales Amount"; Decimal)
        {
            Caption = 'Kwota Sprzedaży [PLN]';
        }
        field(102; "Cost Amout"; Decimal)
        {
            Caption = 'Koszt Sprzedaży [PLN]';
        }
        field(103; "Profit Calc Pers."; Decimal)
        {
            Caption = 'Skalulowany Zysk  [%]';
        }
        field(104; "Profit Status"; Option)
        {
            Caption = 'Status Kontroli';
            OptionCaption = ' ,W Normie,Poniżej Progu,Brak Kosztu Magazyn.';
            OptionMembers = " ","W Normie","Poniżej Progu","Brak Kosztu Magazyn.";
        }
        field(105; "Sales Unit Price"; Decimal)
        {
            Caption = 'Cena Jedn. Sprzedaży';
        }
        field(106; "Sales Unit Cost"; Decimal)
        {
            Caption = 'Koszt Jedn. Sprzedaży';
        }
    }
    keys
    {
        key(PK; "Sales Order No.", "Sales Order Line", "Item Leger Entry No.")
        {
            Clustered = true;
        }
    }
}
