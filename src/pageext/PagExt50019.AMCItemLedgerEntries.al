pageextension 50019 "AMC Item Ledger Entries" extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("AMC QC Status"; Rec."AMC QC Status")
            {
                ApplicationArea = All;
                StyleExpr = QCStyle;
            }
        }
        modify("Lot No.")
        {
            Visible = false;
        }
    }

    trigger OnAfterGetRecord()
    var
        QCStatus: Record "AMC QC Status";
    begin
        QCStyle := Format(PageStyle::None);
        if QCStatus.Get(Rec."AMC QC Status") then
            QCStyle := QCStatus.GetStatusStyle();
    end;

    var
        QCStyle: Text;
}
