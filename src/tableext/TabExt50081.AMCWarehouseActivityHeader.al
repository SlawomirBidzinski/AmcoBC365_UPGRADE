tableextension 50081 "AMC Warehouse Activity Header" extends "Warehouse Activity Header"
{
    fields
    {
        field(50001; "AMC Order No"; Code[20])
        {
            CalcFormula = Lookup("Warehouse Activity Line"."Source No." WHERE("Activity Type"=FIELD(Type),
                                                                               "No."=FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "AMC Zone Code"; Code[10])
        {
            Caption = 'Strefa';
            DataClassification = CustomerContent;
            Description = 'AL.07Jan13';
            Editable = false;
        }
        field(50003; "AMC Terminal Confirmed"; Boolean)
        {
            Caption = 'Potwierdzony na terminalu';
            DataClassification = CustomerContent;
            Description = 'AL.18Jul13';
        }
        field(50004; "AMC Terminal User"; Code[10])
        {
            Caption = 'Użytkownik terminala';
            DataClassification = CustomerContent;
            Description = 'AL.18Jul13';
        }
        field(50005; "AMCTerminal Confirm Date"; Date)
        {
            Caption = 'Data zatwierdzenia';
            DataClassification = CustomerContent;
            Description = 'AL.18Jul13';
        }
        field(50006; "AMC Terminal Confirm Time"; Time)
        {
            Caption = 'Czas zatwierdzenia';
            DataClassification = CustomerContent;
            Description = 'AL.18Jul13';
        }
        field(50007; "AMC From Bin Code"; Code[20])
        {
            Caption = 'Pojemnik źródłowy';
            DataClassification = CustomerContent;
            Description = 'AL.23Aug13';
        }
        field(50008; "AMC To Bin Code"; Code[20])
        {
            Caption = 'Pojemnik docelowy';
            DataClassification = CustomerContent;
            Description = 'AL.23Aug13';
        }
        field(50009; "AMC Total Quantity"; Decimal)
        {
            CalcFormula = Sum("Warehouse Activity Line"."Qty. (Base)" WHERE ("Activity Type"=FIELD(Type),
                                                                             "No."=FIELD("No."),
                                                                             "Action Type"=CONST(Place)));
            Caption = 'Ilość calkowita';
            Description = 'AL.02Dec13';
            Editable = false;
            FieldClass = FlowField;
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
        myInt: Integer;
}