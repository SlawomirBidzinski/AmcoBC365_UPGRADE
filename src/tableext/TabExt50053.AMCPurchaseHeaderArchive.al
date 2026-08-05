tableextension 50053 "AMC Purchase Header Archive" extends "Purchase Header Archive"
{
    fields
    {
        field(50004; "AMC Currancy Exchange Date"; Date)
        {
            Caption = 'Data Kursu Wymiany';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Exchange Rate"; Decimal)
        {
            Caption = 'Kurs Średni';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Vendor Invoice Date"; Date)
        {
            Caption = 'Vendor Invoice Date';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Vendor Service Date"; Date)
        {
            Caption = 'Vendor Service Date';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Create by IdUser"; Code[20])
        {
            Caption = 'Utworzone przez';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50021; "AMC Creation Date"; Date)
        {
            Caption = 'Data Utworzenia';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50022; "AMC Purchase Notes"; Text[50])
        {
            Caption = 'Purchase Notes';
            DataClassification = CustomerContent;
        }
        field(50023; "AMC Place of Transport"; Text[30])
        {
            Caption = 'Miejsce Załadunku/Rozładunku';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Purchase Order Status"; Option)
        {
            Caption = 'Status Zamówienia';
            OptionCaption = 'Wstępne,Wysłane,Potwierdzone,Zrealizowane,Zakończone,Anulowane';
            OptionMembers = "Wstępne","Wysłane",Potwierdzone,Zrealizowane,"Zakończone",Anulowane;
            DataClassification = CustomerContent;
        }
        field(50033; "AMC Purchase Planning Year"; Integer)
        {
            Caption = 'Forecast Planning Year';
            DataClassification = CustomerContent;
        }
        field(50034; "AMC Purchase Planning Week"; Integer)
        {
            Caption = 'Forecast Planning Week';
            DataClassification = CustomerContent;
        }
        field(50035; "AMC Planning Creation User Id"; Code[20])
        {
            Caption = 'Planning Creation User Id';
            DataClassification = CustomerContent;
        }
        field(50036; "AMC Planning Creation Date"; Date)
        {
            Caption = 'Planning Creation Date';
            DataClassification = CustomerContent;
        }
        field(50050; "AMC Approved Date"; Date)
        {
            Caption = 'Data Potwierdzenia';
            DataClassification = CustomerContent;
        }
        field(50051; "AMC Export Date"; Date)
        {
            Caption = 'Data Exportu';
            DataClassification = CustomerContent;
        }
        field(50052; "AMC Export Time"; Time)
        {
            Caption = 'Godz. Exportu';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC Tworca faktury"; Text[30])
        {
            Caption = 'Invoice creator';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Vendor Serach Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Vendor."Search Name" WHERE("Search Name" = FIELD("Buy-from Vendor No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;

        }
        field(50102; "AMC Agreement Date"; Date)
        {
            Caption = 'Agreement Date';
            DataClassification = CustomerContent;
        }
        field(50103; "AMC Receipt No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Warehouse Receipt Line"."No." WHERE("Source Document" = CONST("Purchase Order"),
                                                                     "Source No." = FIELD("No.")));
            Caption = 'Receipt No.';
            Editable = false;

        }
        field(50104; "AMC Posted Receipt No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Posted Whse. Receipt Line"."No." WHERE("Source No." = FIELD("No.")));
            Caption = 'Posted Receipt No.';
            Editable = false;

        }
        field(50105; "AMC Posted Receipt Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Posted Whse. Receipt Line"."Posting Date" WHERE("Source No." = FIELD("No.")));
            Caption = 'Data Przyjęcia Magazynowego';
            Editable = false;

        }
        field(50109; "AMC Drop Shipment"; Boolean)
        {
            Caption = 'Dostawa Bezpośrednia';
            DataClassification = CustomerContent;
        }
//FIXME 
/*       
        field(50201; "AMC Bank Transfer Template"; Code[20])
        {
            Caption = 'Bank Transfer Template';
            Description = 'ITEBA6/00';
            TableRelation = "Bank Transfer Template";
            DataClassification = CustomerContent;
        }
*/        
        field(50202; "AMC Vendor Bank Account Code"; Code[20])
        {
            Caption = 'Vendor Bank Account Code';
            Description = 'ITEBA6/00';
            TableRelation = "Vendor Bank Account".Code WHERE("Vendor No." = FIELD("Pay-to Vendor No."));
            DataClassification = CustomerContent;
        }
    }
}