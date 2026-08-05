tableextension 50051 "AMC User Setup" extends "User Setup"
{
    fields
    {
        field(50001; "AMC Salesperson Code"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
            Caption = 'Salesperson Code';
        }
        field(50002; "AMC Default Scan Mode"; Enum "AMC Default Scan Mode")
        {
            Caption = 'Domyślny tryb skanowania';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Startup Form ID"; Integer)
        {
            Caption = 'Formatka startowa';
            TableRelation = AllObj."Object ID" WHERE("Object Type" = CONST(Page));
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Name and Surname"; Text[50])
        {
            Caption = 'Name and Surname';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Superuser"; Boolean)
        {
            Caption = 'Super użytkownik';
            Description = 'AL.04Dec12';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Sales Item Permission"; Boolean)
        {
            Caption = 'Uprawnienie Zapasy Sprzedaży';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Purchase Items Permission"; Boolean)
        {
            Caption = 'Uprawnienie Zapasy Zakupu';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Sales Details Permission"; Boolean)
        {
            Caption = 'Uprawnienie Dane Sprzedażowe';
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Purchase Details Perm."; Boolean)
        {
            Caption = 'Uprawnienie Dane Zakupowe';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Terminal User"; Boolean)
        {
            Caption = 'Użytkownik terminala';
            Description = 'AL.11Jun13';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Change Dimension Perm."; Boolean)
        {
            Caption = 'Change Dimension Permission';
            Description = '29ABS 131113 007';
            DataClassification = CustomerContent;
        }
        field(50012; "AMC Dostęp Wszystkie Faktury"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Dostęp Wszystkie Faktury';
        }
        field(50013; "AMC Territory Code"; Code[10])
        {
            Caption = 'Territory Code';
            TableRelation = Territory;
            DataClassification = CustomerContent;
        }
        field(50014; "AMC Sales Person Persmisson"; Boolean)
        {
            Caption = 'Sales Person Persmisson';
            DataClassification = CustomerContent;
        }
        field(50015; "AMC EDI File Monitor"; Boolean)
        {
            Caption = 'EDI File Monitor';
            DataClassification = CustomerContent;
        }
        field(50016; "AMC CRM File Folder"; Text[250])
        {
            Caption = 'Folder Plików CRM';
            DataClassification = CustomerContent;
        }
        field(50017; "AMC Budget Admin"; Boolean)
        {
            Caption = 'Administr. Budżetu';
            DataClassification = CustomerContent;
        }
        field(50018; "AMC Budget MPK Filters"; Text[200])
        {
            Caption = 'Filtry MPK Budżetu';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('5 MPK'),
                                                          Blocked = CONST(false));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(50019; "AMC Manufacturing Order Open"; Boolean)
        {
            Caption = 'Otwieranie Zlec. Produk.';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Administrator R&D"; Boolean)
        {
            Caption = 'Administrator R&&D';
            DataClassification = CustomerContent;
        }
        field(50021; "AMC Production BOM"; Boolean)
        {
            Caption = 'BOM Produkcyjny';
            DataClassification = CustomerContent;
        }
        field(50022; "AMC Allow Budget Date From"; Date)
        {
            Caption = 'Bużdet Dozw. Data Od';
            DataClassification = CustomerContent;
        }
        field(50023; "AMC Allow Budget Date To"; Date)
        {
            Caption = 'Budżet Dozw. Data Do';
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Label Printer"; Enum "AMC Label Printer")
        {
            Caption = 'Drukarka Kodów Kreskowych';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC PermissionWebServRWOrders"; Enum "AMC PermissionWebServRWOrders")
        {
            Caption = 'Permission WebServ Contact';
            DataClassification = CustomerContent;
        }
        field(50032; "AMC Access for BOM Updateing"; Boolean)
        {
            Caption = 'Uprawnienie Aktualizacji BOM';
            DataClassification = CustomerContent;
        }
        field(50033; "AMC Item block setting"; Boolean)
        {
            Caption = 'Blokowanie Zapasu';
            DataClassification = CustomerContent;
        }
        field(50034; "AMC Set For Customer Limit"; Boolean)
        {
            Caption = 'Ustawienie Limitu Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50035; "AMC AutorisationForCust.Limits"; Boolean)
        {
            Caption = 'Autoryzacja Limitu Sprzedaży';
            DataClassification = CustomerContent;
        }
        field(50036; "AMC Use blocked item on Quote"; Boolean)
        {
            Caption = 'Używaj zablok. zapasów na ofercie';
            DataClassification = CustomerContent;
        }
        field(50037; "AMC Change Drawer on Quote"; Boolean)
        {
            Caption = 'Zmiana Wystawiającego na ofercie';
            DataClassification = CustomerContent;
        }
        field(50038; "AMC Sent ask for BOM Auth."; Boolean)
        {
            Caption = 'Wysyłka Powiad. do Autoryz. BOMu';
            DataClassification = CustomerContent;
        }
        field(50039; "AMC Low PriceSales Limit Auth."; Boolean)
        {
            Caption = 'Low Price Sales Limit Auth.';
            DataClassification = CustomerContent;
        }
        field(50051; "AMC Optimalisation R&D"; Boolean)
        {
            Caption = 'Optimalisation R&D';
            DataClassification = CustomerContent;
        }
        field(50052; "AMC Optimalisation Trade"; Boolean)
        {
            Caption = 'Optimalisation Trade';
            DataClassification = CustomerContent;
        }
        field(50053; "AMC Optimalisation Purch."; Boolean)
        {
            Caption = 'Optimalisation Purch.';
            DataClassification = CustomerContent;
        }
        field(50054; "AMC Optimalisation KJ"; Boolean)
        {
            Caption = 'Optimalisation KJ';
            DataClassification = CustomerContent;
        }
    }
}