tableextension 50064 "AMC Warehouse Shipment Header" extends "Warehouse Shipment Header"
{

    fields
    {
        field(50001; "AMC Customer Code"; Code[20])
        {
            Caption = 'Kod nabywcy';
            DataClassification = CustomerContent;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if CustomerRec.GET("AMC Customer Code") then begin
                    "AMC Customer Name" := CustomerRec.Name;
                    "AMC Customer Address" := CustomerRec.Address;
                    "AMC Customer post code" := CustomerRec."Post Code";
                    "AMC Customer City" := CustomerRec.City;
                end;
            end;
        }
        field(50002; "AMC Customer Name"; Text[50])
        {
            Caption = 'Nazwa Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Customer Address"; Text[50])
        {
            Caption = 'Adres Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Customer post code"; Code[20])
        {
            Caption = 'Kod Pocztowy Nabywcy';
            DataClassification = CustomerContent;
            TableRelation = "Post Code";
        }
        field(50005; "AMC Customer City"; Text[30])
        {
            Caption = 'Miasto Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Ship-to Code"; Code[20])
        {
            Caption = 'Kod Adresu Dostawy';
            DataClassification = CustomerContent;

            trigger OnLookup()
            begin
                CLEAR(ShipAddressList);
                ShipToAddr.RESET();
                ShipToAddr.SETRANGE("Customer No.", "AMC Customer Code");
                if ShipToAddr.FINDFIRST() then begin
                    ShipAddressList.SETTABLEVIEW(ShipToAddr);
                    ShipAddressList.SETRECORD(ShipToAddr);
                    ShipAddressList.LOOKUPMODE(true);
                    if ShipAddressList.RUNMODAL() = ACTION::LookupOK then begin
                        ShipAddressList.GETRECORD(ShipToAddr);
                        "AMC Ship-to Code" := ShipToAddr.Code;
                        "AMC Ship-to Name" := ShipToAddr.Name;
                        "AMC Ship-to Adress" := ShipToAddr.Address;
                        "AMC Ship-to City" := ShipToAddr.City;
                        "AMC Ship-to Post Code" := ShipToAddr."Post Code";
                        "AMC Ship-to Phone" := ShipToAddr."Phone No.";
                        "AMC Ship-to Contact" := ShipToAddr.Contact;
                    end;
                end;
            end;

            trigger OnValidate()
            begin
                ShipToAddr.RESET();
                ShipToAddr.SETRANGE("Customer No.", "AMC Customer Code");
                ShipToAddr.SETRANGE(Code, "AMC Ship-to Code");
                if ShipToAddr.FINDFIRST() then begin
                    "AMC Ship-to Code" := ShipToAddr.Code;
                    "AMC Ship-to Name" := ShipToAddr.Name;
                    "AMC Ship-to Adress" := ShipToAddr.Address;
                    "AMC Ship-to City" := ShipToAddr.City;
                    "AMC Ship-to Post Code" := ShipToAddr."Post Code";
                    "AMC Ship-to Phone" := ShipToAddr."Phone No.";
                    "AMC Ship-to Contact" := ShipToAddr.Contact;
                end else begin
                    "AMC Ship-to Code" := '';
                    "AMC Ship-to Name" := '';
                    "AMC Ship-to Adress" := '';
                    "AMC Ship-to City" := '';
                    "AMC Ship-to Post Code" := '';
                    "AMC Ship-to Phone" := '';
                    "AMC Ship-to Contact" := '';
                end;
            end;
        }
        field(50007; "AMC Ship-to Adress"; Text[50])
        {
            Caption = 'Adres Dostawy';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Ship-to City"; Text[50])
        {
            Caption = 'Miejscowość Dostawy';
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Ship-to Post Code"; Code[20])
        {
            Caption = 'Kod Pocztowy Dostawy';
            DataClassification = CustomerContent;
            TableRelation = "Post Code";
        }
        field(50010; "AMC Ship-to Name"; Text[50])
        {
            Caption = 'Nazwa Odbiorcy Dostawy';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Ship-to Contact"; Text[50])
        {
            Caption = 'Ship-to Contact';
            DataClassification = CustomerContent;
        }
        field(50012; "AMC Ship-to Phone"; Text[30])
        {
            Caption = 'Ship-to Phone';
            DataClassification = CustomerContent;
        }
        field(50013; "AMC Remarks"; Text[100])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(50014; "AMC Pallet Quantity"; Integer)
        {
            Caption = 'Ilość palet';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "AMC Pallet Quantity" <> xRec."AMC Pallet Quantity" then begin
                    WarehShipmLine.RESET();
                    WarehShipmLine.SETRANGE("No.", "No.");
                    WarehShipmLine.SETRANGE("Item No.", "AMC Pallet Item Code");
                    if WarehShipmLine.FINDFIRST() then begin
                        WarehShipmLine.Quantity := "AMC Pallet Quantity";
                        WarehShipmLine."Qty. (Base)" := "AMC Pallet Quantity";
                        WarehShipmLine."Qty. Outstanding" := "AMC Pallet Quantity";
                        WarehShipmLine."Qty. Outstanding (Base)" := "AMC Pallet Quantity";
                        WarehShipmLine."Qty. to Ship" := "AMC Pallet Quantity";
                        WarehShipmLine.MODIFY();
                    end;

                    SalesLine.RESET();
                    SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
                    SalesLine.SETRANGE("Document No.", WarehShipmLine."Source No.");
                    SalesLine.SETRANGE("Line No.", WarehShipmLine."Source Line No.");
                    if SalesLine.FINDFIRST() then begin
                        SalesLine.Quantity := "AMC Pallet Quantity";
                        SalesLine."Outstanding Quantity" := "AMC Pallet Quantity";
                        SalesLine."Qty. to Ship" := "AMC Pallet Quantity";
                        SalesLine."Quantity (Base)" := "AMC Pallet Quantity";
                        SalesLine."Outstanding Qty. (Base)" := "AMC Pallet Quantity";
                        SalesLine."Qty. to Ship (Base)" := "AMC Pallet Quantity";
                        SalesLine.MODIFY();
                    end;
                end;
            end;
        }
        field(50015; "AMC Pallet Item Code"; Code[20])
        {
            Caption = 'Kod Zapasu palety';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(50020; "AMC Create by IdUser"; Code[50])
        {
            Caption = 'Utworzone przez';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50021; "AMC Creation Date"; Date)
        {
            Caption = 'Data Utworzenia';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50022; "AMC RW Transaction"; Boolean)
        {
            Caption = 'Rozliczenie RW';
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Shipment Type"; Enum "AMC Shipment Type")
        {
            Caption = 'Typ Wydania';
            DataClassification = CustomerContent;
        }
        field(50025; "AMC Customer Search Name"; Code[100])
        {
            CalcFormula = lookup(Customer."Search Name" where("No." = field("AMC Customer Code")));
            Caption = 'Customer Search Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50026; "AMC Your Reference"; Code[30])
        {
            Caption = 'Your Reference';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC PickUp Doc.No."; Code[20])
        {
            CalcFormula = lookup("Warehouse Activity Line"."No." where("Whse. Document Type" = const(Shipment),
                                                                      "Whse. Document No." = field("No.")));
            Caption = 'PickUp Doc.No.';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    fieldgroups
    {
        addlast(Brick; "No.", "AMC Customer Code", "Location Code", "Posting Date", "AMC RW Transaction") { }
    }

    var
        CustomerRec: Record Customer;
        ShipToAddr: Record "Ship-to Address";
        SalesLine: Record "Sales Line";
        WarehShipmLine: Record "Warehouse Shipment Line";
        ShipAddressList: Page "Ship-to Address List";
}