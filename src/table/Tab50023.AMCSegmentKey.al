table 50023 "AMC Segment Key"
{
    Caption = 'My Customer';
    DataClassification = CustomerContent;
    LookupPageId = "AMC Segment Keys";
    DrillDownPageId = "AMC Segment Keys";
    
    fields
    {
        field(1; "Customer Segment Key"; Code[20])
        {
            Caption = 'Customer Segment Key';
        }
        field(2; "Customer Segment Name"; Text[50])
        {
            Caption = 'Customer Segment Name';
            NotBlank = true;
        }
        field(50000; "Customer BU Name"; Text[50])
        {
            Caption = 'Customer BU Name';
        }
    }

    keys
    {
        key(Key1; "Customer Segment Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}