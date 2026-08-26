pageextension 50051 "AMC Warehouse Entries" extends "Warehouse Entries"
{
    layout
    {
        movebefore("Entry Type"; "Registering Date")
        movebefore("Registering Date"; "Entry No.")
        modify("Bin Code")
        {
            Visible = true;
        }
        modify("Unit of Measure Code")
        {
            Visible = true;
        }
        modify("Registering Date")
        {
            Visible = true;
        }
        modify("Lot No.")
        {
            Visible = true;
        }
        modify(Quantity)
        {
            Visible = true;
        }
    }
}