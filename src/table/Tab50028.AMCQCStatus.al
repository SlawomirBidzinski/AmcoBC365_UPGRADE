table 50028 "AMC QC Status"
{
    Caption = 'Status KJ';
    DataClassification = CustomerContent;
    LookupPageId = "AMC QC Statuses";
    DrillDownPageId = "AMC QC Statuses";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Kod';
        }
        field(2; Description; Text[40])
        {
            Caption = 'Opis';
        }
        field(3; Sales; Boolean)
        {
            Caption = 'Sprzedaż';
        }
        field(4; Consumption; Boolean)
        {
            Caption = 'Zużycie prod.';
        }
        field(5; Transfer; Boolean)
        {
            Caption = 'Przesunięcie';
        }
        field(6; Purchase; Boolean)
        {
            Caption = 'Purchase';
        }
        field(9; "Lot Blocking"; Boolean)
        {
            Caption = 'Blokada całej partii';
            Description = 'AL.21Nov12';
        }
        field(10; "Set For PW Test Item"; Boolean)
        {
            Caption = 'Domyślne - Przyjęcie Próbek';
        }
        field(11; "AMC QC Status"; Enum "AMC QC Status")
        {
            Caption = 'QC Status';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure GetStatusStyle(): Text
    var
        RecordStyle: Text;
    begin
        case Rec."AMC QC Status" of
            Rec."AMC QC Status"::" ":
                RecordStyle := Format(PageStyle::None);
            Rec."AMC QC Status"::Blocked:
                RecordStyle := Format(PageStyle::Attention);
            Rec."AMC QC Status"::Approved:
                RecordStyle := Format(PageStyle::Favorable);
            Rec."AMC QC Status"::Conditional:
                RecordStyle := Format(PageStyle::StandardAccent);
            Rec."AMC QC Status"::"Internal QC":
                RecordStyle := Format(PageStyle::Subordinate);
            Rec."AMC QC Status"::"Pending Approval":
                RecordStyle := Format(PageStyle::Ambiguous);
            Rec."AMC QC Status"::Qualified:
                RecordStyle := Format(PageStyle::StrongAccent);
            else
                RecordStyle := Format(PageStyle::Standard);
        end;

        exit(RecordStyle);
    end;
}

