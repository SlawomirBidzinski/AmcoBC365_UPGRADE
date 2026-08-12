pageextension 50042 "AMC Order Proc. Role Center" extends "Order Processor Role Center"
{
    actions
    {
        addlast(Action63)
        {
            group(AMCItemCalc1)
            {
                Caption = 'Item Calculation';

                action(AMCCalc2)
                {
                    Caption = 'Item Budget Instance';
                    ApplicationArea = All;
                    RunObject = page "AMC Item Budget Instance";
                }
                action(AMCCalc3)
                {
                    Caption = 'Item Budget Specification';
                    ApplicationArea = All;
                    RunObject = page "AMC Item Budget Specification";
                }

                action(AMCCalc1)
                {
                    Caption = 'Item Calculations';
                    ApplicationArea = All;
                    RunObject = page "AMC Item Calculation List";
                }
                action(AMCCalc4)
                {
                    Caption = 'Item Calculations Card';
                    ApplicationArea = All;
                    RunObject = page "AMC Item Calculation Card";
                }
                action(AMCNewItem)
                {
                    ApplicationArea = All;
                    Caption = 'Generate New Item';
                    Image = Item;

                    RunObject = Page "AMC New Item Generate";
                }
            }
        }
        addlast(Action76)

        {
            group(AMCItemForecat)
            {
                Caption = 'Item Production Plannig';

                action(AMCForecast)
                {
                    Caption = 'Item Forecast';
                    ApplicationArea = All;
                    RunObject = page "AMC Item Forecast Planning";
                }
            }
        }
        addafter("Item Reclassification Journals")
        {
            Action(AMCItemTransferCard)
            {
                Caption = 'Item Iternal Transfer List';
                ApplicationArea = All;
                RunObject = page "AMC Internal Transfer List";
            }
        }
        addafter(Action93)
        {
            action(AMCAction93)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Salespersons';
                Image = Item;
                RunPageMode = Edit;
                RunObject = Page "AMC Item Salesperson List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
        }
        addafter(SalesOrders)
        {
            action(AMCInternalTransfer)
            {
                ApplicationArea = All;
                Caption = 'Internal Transfers';
                Image = TransferFunds;
                RunObject = page "AMC Internal Transfer List";
            }
            action(AMCDicountInv)
            {
                ApplicationArea = All;
                Caption = 'Discount Correction Inv.';
                Image = "Order";
                RunObject = Page "AMC Discount Corr. Inv. List";
            }
        }
        addafter("Sales &Order")
        {
            action(AMCDicountInv1)
            {
                ApplicationArea = All;
                Caption = 'Discount Correction Inv.';
                Image = "Order";
                RunObject = Page "AMC Discount Corr. Inv. List";
            }
        }
        addlast("Posted Documents")
        {
            action(AMCPostedShpt)
            {
                ApplicationArea = All;
                Caption = 'Posted Whse. Shipments';
                Image = PostedShipment;
                RunObject = Page "Posted Whse. Shipment List";
            }
            action(AMCPostedRcpt)
            {
                ApplicationArea = All;
                Caption = 'Posted Whse. Receiptss';
                Image = PostedReceipts;
                RunObject = Page "Posted Whse. Receipt List";
            }
        }
        addafter("Posted Documents")
        {
            group(AMCArchivedDocuments)
            {
                Caption = 'Archived Documents';
                Image = FiledPosted;
                action(AMCArchivedSalesOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Archived Sales Orders';
                    Image = Archive;
                    RunObject = Page "Sales Order Archives";
                }
                action(AMCArchivedSalesQuotes)
                {
                    ApplicationArea = All;
                    Caption = 'Archived Sales Quotes';
                    Image = Archive;
                    RunObject = Page "Sales Quote Archives";
                }
                action("AMCSales Return Order Archives")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Return Order Archives';
                    RunObject = page "Sales Return List Archive";
                }
                action("AMCBlanket Sales Order Archives")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Blanket Sales Order Archives';
                    RunObject = page "Blanket Sales Order Archives";
                }
                action(AMCArchivedPurchOrder)
                {
                    ApplicationArea = All;
                    Caption = 'Archived Purch. Orders';
                    Image = Archive;
                    RunObject = Page "Purchase Order Archives";
                }
                action(AMCArchivedPurchQuotes)
                {
                    ApplicationArea = All;
                    Caption = 'Archived Purch. Quotes';
                    Image = Archive;
                    RunObject = Page "Purchase Quote Archives";
                }
            }
        }
        modify("Sales Order Archive")
        {
            Visible = false;
        }
        modify("Sales Quote Archive")
        {
            Visible = false;
        }
        modify("Sales Return Order Archives")
        {
            Visible = false;
        }
        modify("Blanket Sales Order Archives")
        {
            Visible = false;
        }
    }
}
