tableextension 50019 "AMC LocationExt" extends Location
{
    fields
    {
        field(50000; "AMC Break. in Inb. Prod. Bin"; Boolean)
        {
            Caption = 'Breakbulk in Inbound Prod. Bin'; //TODO 'Przepakowanie w pojemniku wejściowym produkcji';
            DataClassification = CustomerContent;
            Description = 'AL.19Nov12';
        }
        field(50001; "AMC Control Transfer-To"; Boolean)
        {
            Caption = 'Control Transfer-To'; //TODO 'Kontrola przesunięcia do';
            Description = 'AL.20Nov12';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Control Transfer-From"; Boolean)
        {
            Caption = 'Control Transfer-From'; //TODO 'Kontrola przesunięcia z';
            Description = 'AL.20Nov12';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Control Sales From"; Boolean)
        {
            Caption = 'Control Sales From'; //TODO 'Kontrola sprzedaży z';
            Description = 'AL.20Nov12';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Control Negative Adjmt."; Boolean)
        {
            Caption = 'Control Negative Adjmt.'; //TODO 'Kontrola zużycia / korekty in-minus';
            Description = 'AL.20Nov12';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Rem. Production Bin Code"; Code[20])
        {
            Caption = 'Remaining Production Bin Code'; //TODO 'Kod pojemnika nadmiarów pobrania';
            TableRelation = Bin.Code WHERE("Location Code"=FIELD(Code));
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Default Bin Code"; Code[20])
        {
            Caption = 'Default Bin Code'; //TODO 'Kod pojemnika próbki';
            TableRelation = Bin.Code WHERE ("Location Code"=FIELD(Code));
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Quality Item Test Loc."; Boolean)
        {
            Caption = 'Generate Test Item';
            DataClassification = CustomerContent;
        }
    }
}
