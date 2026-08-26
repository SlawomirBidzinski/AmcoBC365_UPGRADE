tableextension 50079 "AMC Warehouse Receipt Header" extends "Warehouse Receipt Header"
{
    fields
    {
        field(50000; "AMC FirmType"; Enum "AMC FirmType")
        {
            DataClassification = CustomerContent;
            Caption = 'Firm Type';

            trigger OnValidate()
            begin
                if xRec."AMC FirmType" <> Rec."AMC FirmType" then begin
                    "AMC Vendor Code" := '';
                    "AMC Vendor Name" := '';
                    "AMC Vendor Address" := '';
                    "AMC Vendor post code" := '';
                    "AMC Vendor City" := '';
                end;
            end;
        }
        field(50001; "AMC Vendor Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor Code';
            TableRelation = if ("AMC FirmType" = const(Vendor)) Vendor else if ("AMC FirmType" = const(Customer)) Customer;

            trigger OnValidate()
            begin

                case "AMC FirmType" of
                    "AMC FirmType"::Vendor:
                        if VendorRec.GET("AMC Vendor Code") then begin
                            "AMC Vendor Name" := VendorRec.Name;
                            "AMC Vendor Address" := VendorRec.Address;
                            "AMC Vendor post code" := VendorRec."Post Code";
                            "AMC Vendor City" := VendorRec.City;
                        end else begin
                            "AMC Vendor Name" := '';
                            "AMC Vendor Address" := '';
                            "AMC Vendor post code" := '';
                            "AMC Vendor City" := '';
                        end;


                    "AMC FirmType"::Customer:
                        if CustomerRec.GET("AMC Vendor Code") then begin
                            "AMC Vendor Name" := CustomerRec.Name;
                            "AMC Vendor Address" := CustomerRec.Address;
                            "AMC Vendor post code" := CustomerRec."Post Code";
                            "AMC Vendor City" := CustomerRec.City;
                        end else begin
                            "AMC Vendor Name" := '';
                            "AMC Vendor Address" := '';
                            "AMC Vendor post code" := '';
                            "AMC Vendor City" := '';
                        end;
                end;
            end;
        }
        field(50002; "AMC Vendor Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor Name';
        }
        field(50003; "AMC Vendor Address"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor Address';
        }
        field(50004; "AMC Vendor post code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor Post Code';
            TableRelation = "Post Code";
        }
        field(50005; "AMC Vendor City"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor City';
        }
        field(50006; "AMC Receipt Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt Date';
        }
        field(50020; "AMC Create by IdUser"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Create by Id User';
        }
        field(50021; "AMC Creation Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Creation Date';
        }
        field(50024; "AMC  Receipt Type"; Enum "AMC Receipt Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt Type';
        }
        field(50025; "AMC Notes"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Notes';
        }
        field(50026; "AMC Document ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document ID';
        }
        field(50027; "AMC Customer Search Name"; Code[100])
        {
            Caption = 'Customer Search Name';
            CalcFormula = lookup(Vendor."Search Name" where("No." = field("AMC Vendor Code")));
            FieldClass = FlowField;
        }

        field(50028; "AMC PW Transaction"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'PW Transaction';
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        VendorRec: Record Vendor;
        CustomerRec: Record Customer;
}