tableextension 50044 "AMC Inventory Setup" extends "Inventory Setup"
{
    fields
    {
        field(50000; "AMC RiD Item Nos."; Code[10])
        {
            Caption = 'Seria num. Zapasów RiD';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50001; "AMC Default Location Code"; Code[20])
        {
            Caption = 'Default Location Code';
            TableRelation = Location;
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Pallet Label Code"; Code[20])
        {
            Caption = 'Kod ektykiety palety';
            Description = 'AL.22Aug12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Item Label Code"; Code[20])
        {
            Caption = 'Item Label Code';
            Description = 'AL.22Aug12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Serial No. Label Code"; Code[20])
        {
            Caption = 'Serial Number Label Code';
            Description = 'AL.22Aug12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50005; "AMC AMC Pallete Item Code"; Code[20])
        {
            Caption = 'Kod Zapasu Palety';
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Default Item QC Status"; Code[20])
        {
            Caption = 'Domyślny Status KJ zapasu';
            Description = 'AL.19Nov12';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Term. New Colour"; Code[10])
        {
            Caption = 'Terminal - Nowy kolor';
            Description = 'AL.16Jul13';
            TableRelation = "AMC Colour".Code;
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Term. Started Colour"; Code[10])
        {
            Caption = 'Terminal - W trakice kolor';
            Description = 'AL.16Jul13';
            TableRelation = "AMC Colour".Code;
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Term. Finished Colour"; Code[10])
        {
            Caption = 'Terminal - Zakończ kolor';
            Description = 'AL.16Jul13';
            TableRelation = "AMC Colour".Code;
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Term. Overload Colour"; Code[10])
        {
            Caption = 'Terminal - Za dużo kolor';
            Description = 'AL.16Jul13';
            TableRelation = "AMC Colour".Code;
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Białko wsp. kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Białko wsp. kJ/g';
        }
        field(50012; "AMC Białko wsp. kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Białko wsp. kcal/g';
        }
        field(50013; "AMC Węglowodany wsp. kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Węglowodany wsp. kJ/g';
        }
        field(50014; "AMC Węglowodany wsp. kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Węglowodany wsp. kcal/g';
        }
        field(50015; "AMC Tłuszcz wsp. kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Tłuszcz wsp. kJ/g';
        }
        field(50016; "AMC Tłuszcz wsp. kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Tłuszcz wsp. kcal/g';
        }
        field(50017; "AMC Błonnik wsp.kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Błonnik wsp.kJ/g';
        }
        field(50018; "AMC Błonnik wsp.kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Błonnik wsp.kcal/g';
        }
        field(50019; "AMC Qty days of check Exp Date"; Integer)
        {
            Caption = 'Qty days of check Exp Date';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC alkohole wielow. wsp kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'alkohole wielow. wsp kJ/g';
        }
        field(50021; "AMC alkoholewielow. wsp kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'alkoholewielow. wsp kcal/g';
        }
        field(50022; "AMC AMC Salatrimy wsp kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'AMC Salatrimy wsp kJ/g';
        }
        field(50023; "AMC Salatrimy wsp kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Salatrimy wsp kcal/g';
        }
        field(50024; "AMC Alkohol (etanol) wsp kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Alkohol (etanol) wsp kJ/g';
        }
        field(50025; "AMC Alkohol(etanol) wsp kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Alkohol(etanol) wsp kcal/g';
        }
        field(50026; "AMC Kwasy organiczne wsp kJ/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Kwasy organiczne wsp kJ/g';
        }
        field(50027; "AMC Kwasyorganiczne wsp kcal/g"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Kwasyorganiczne wsp kcal/g';
        }
        field(50028; "AMC Pallet Label Code Add."; Code[20])
        {
            Caption = 'Kod ektykiety palety Dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50029; "AMC Item Label Code Add."; Code[20])
        {
            Caption = 'Item Label Code';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50030; "AMC Serial No. Label Code Add."; Code[20])
        {
            Caption = 'Serial Number Label Code';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50051; "AMC Opakowanie Marynaty 5kg"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Marynaty 5kg';
        }
        field(50052; "AMC Opakowanie Marynaty 10kg"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Marynaty 10kg';
        }
        field(50053; "AMC Opakowanie Worek 10kg"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Worek 10kg';
        }
        field(50054; "AMC Opakowanie Worek 20kg"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Worek 20kg';
        }
        field(50055; "AMC Opakowanie Przyprawy 2kg"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Przyprawy 2kg';
        }
        field(50056; "AMC Opakowanie BigBag"; Decimal)
        {
            Caption = 'Seria num. Zapasów RiD';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50057; "AMC Opakowanie Folia Saszetek"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Folia Saszetek';
        }
        field(50058; "AMC Opakowanie Folia Metaliz."; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Folia Metaliz.';
        }
        field(50059; "AMC Opakowanie Karton"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Karton';
        }
        field(50060; "AMC Opakowanie Trumna"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Trumna';
        }
        field(50061; "AMC Opakowanie Tacka"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Tacka';
        }
        field(50062; "AMC Opakowanie Worek Foliowy"; Decimal)
        {
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
            Caption = 'Opakowanie Worek Foliowy';
        }
    }
}