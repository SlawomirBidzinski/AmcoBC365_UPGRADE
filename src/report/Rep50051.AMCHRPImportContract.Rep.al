report 50051 "Update Item Date"
{
    ApplicationArea = All;
    UsageCategory = Tasks;
    Caption = 'Update Item Data';
    ProcessingOnly = true;

    dataset
    {
        dataitem(INTEGER; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            trigger OnAfterGetRecord()
            begin
                Item.Reset();
                if Item.FindSet() then
                    repeat
                        If item."Item Tracking Code" = '' then begin
                            item."Item Tracking Code" := 'NR_PARTII';
                            item.Modify();
                        end;
                    until Item.Next() = 0;
            end;
        }
    }
    var
        Item: Record "Item";
}
