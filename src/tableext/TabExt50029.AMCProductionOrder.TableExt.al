tableextension 50029 "AMC Production Order" extends "Production Order"
{
    
    fields
    {
        field(50001; "AMC Forecast Planning Year"; Integer)
        {
            Caption = 'Forecast Planning Year';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Forecast Planning Week"; Integer)
        {
            Caption = 'Forecast Planning Week';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Planning Creation User Id"; Code[20])
        {
            Caption = 'Planning Creation User Id';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Planning Creation Date"; Date)
        {
            Caption = 'Planning Creation Date';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Update End Time"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Forecast Order"; Boolean)
        {
            Caption = 'Planowanie Produkcji';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC For Demand"; Boolean)
        {
            Caption = 'Na w razie potrzeby';
            Description = 'AL.03Jun13';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Line Quantity"; Integer)
        {
            FieldClass = FlowField;
                      CalcFormula = count("Prod. Order Line" where (Status=field(Status),
                                                          "Prod. Order No."=field("No.")));
            Caption = 'Ilość wierszy';
            Editable = false;
            
        }
        field(50009; "AMC For Test Item"; Boolean)
        {
            Caption = 'Na Próby';
            DataClassification = CustomerContent;
        }
    
    }
    

}