tableextension 50032 "AMC Transaction Specification" extends "Transaction Specification"
{
    fields
    {
        field(50000; "AMC Documenty Type"; Enum "AMC Tran. Spec. Doc. Typ")
        {
            Caption = 'Typ Dokumentu';
            DataClassification = CustomerContent;
        }
        field(50001; "AMC Document No"; Code[20])
        {
            Caption = 'Nr Dokumentu';
            TableRelation = if ("AMC Documenty Type"=const("Invoice Proforma")) "Sales Header"."No." where ("Document Type"=const(Order))
                            else if ("AMC Documenty Type"=const("Sales Invoice")) "Sales Invoice Header"."No."
                            else if ("AMC Documenty Type"=const("Credit Memo Invoice")) "Sales Cr.Memo Header"."No.";
            DataClassification = CustomerContent;                
        }
        field(50002; "AMC Customer Code"; Code[20])
        {
            Caption = 'Kod Nabywcy';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Customer Name"; Text[100])
        {
            Caption = 'Nazwa Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Electr. Form Invoice Agr"; Boolean)
        {
            Caption = 'Zgoda na Faktury Elektroniczne';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Invoice e-mail Address"; Text[100])
        {
            Caption = 'Adres e-mail dla Faktur';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Attachement File"; Text[100])
        {
            Caption = 'Plik Faktury PDF';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Source E-maill Account"; Text[80])
        {
            Caption = 'Wysłano z konta E-mail';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Sent To E-mail"; Text[100])
        {
            Caption = 'Wysłano Do';
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Set to E-mail CC"; Text[100])
        {
            Caption = 'Wysłano Dw';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Transaction Type"; Enum "AMC Tran. Spec. Tran. Type")
        {
            Caption = 'Typ transakcji';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Ext Doc. No"; Text[20])
        {
            Caption = 'Nr Dokumentu Zewnętrznego';
            DataClassification = CustomerContent;
        }
        field(50015; "AMC E-mail Sent Date"; Date)
        {
            Caption = 'Data wysłania E-mail';
            DataClassification = CustomerContent;
        }
        field(50016; "AMC E-mail Sent Time"; Time)
        {
            Caption = 'Czas wysłania E-mail';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC User ID"; Code[20])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(50023; "AMC Firm Name"; Text[100])
        {
            Caption = 'Nazwa Kontrahenta';
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Firm Address"; Text[50])
        {
            Caption = 'Adres Kontrahenta';
            DataClassification = CustomerContent;
        }
        field(50025; "AMC Firm Post Code"; Code[20])
        {
            Caption = 'Kod Pocztowy';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(50026; "AMC Firm City"; Text[30])
        {
            Caption = 'Miasto Kontrahenta';
            DataClassification = CustomerContent;
        }
        field(50050; "AMC Secretary Entry No"; Code[20])
        {
            Caption = 'Nr Zapisu Rejestru Sekretariat';
            DataClassification = CustomerContent;
        }
        field(50051; "AMC Secretary Pos"; Code[10])
        {
            Caption = 'Pozycja zapisu';
            DataClassification = CustomerContent;
        }
        field(50052; "AMC Registry Date"; Date)
        {
            Caption = 'Data Zarejestrowania';
            DataClassification = CustomerContent;
        }
        field(50053; "AMC Need Confirmation"; Boolean)
        {
            Caption = 'Wymaga potwierdzenia zwrotn.';
            DataClassification = CustomerContent;
        }
        field(50054; "AMC Date of Return Conf"; Date)
        {
            Caption = 'Data Otrzymania Potwierdzenia';
            DataClassification = CustomerContent;
        }
        field(50055; "AMC Division Name"; Text[50])
        {
            Caption = 'Nazwa Działu';
            DataClassification = CustomerContent;
        }
    }
    
}