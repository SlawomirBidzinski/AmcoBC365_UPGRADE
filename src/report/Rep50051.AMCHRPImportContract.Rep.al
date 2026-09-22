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
                        If item."Gen. Prod. Posting Group" = 'Z.WYROBY' then begin
                            item."AMC Item Type" := item."AMC Item Type"::Wyroby;
                            item."Warehouse Class Code" := 'MW';
                            item.Modify();
                        end;

                        If item."Gen. Prod. Posting Group" = 'Z.SUROW' then begin
                            item."AMC Item Type" := item."AMC Item Type"::Surowce;
                            item."Warehouse Class Code" := 'MS';
                            item.Modify();
                        end;

                        If item."Gen. Prod. Posting Group" = 'TOW.WIB' then begin
                            item."AMC Item Type" := item."AMC Item Type"::Towary;
                            item."Warehouse Class Code" := 'MW';
                            item.Modify();
                        end;

                        If item."Gen. Prod. Posting Group" = 'TOW.FRUT' then begin
                            item."AMC Item Type" := item."AMC Item Type"::Towary;
                            item."Warehouse Class Code" := 'MW';
                            item.Modify();
                        end;

                    until Item.Next() = 0;
            end;
        }
    }
    var
        Item: Record "Item";
}
