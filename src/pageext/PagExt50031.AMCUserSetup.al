pageextension 50031 "AMC User Setup" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("AMC Name and Surname"; Rec."AMC Name and Surname")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Sent ask for BOM Auth."; Rec."AMC Sent ask for BOM Auth.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC PermissionWebServRWOrders"; Rec."AMC PermissionWebServRWOrders")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC CRM File Folder"; Rec."AMC CRM File Folder")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Superuser"; Rec."AMC Superuser")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Set For Customer Limit"; Rec."AMC Set For Customer Limit")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC AutorisationForCust.Limits"; Rec."AMC AutorisationForCust.Limits")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Low PriceSales Limit Auth."; Rec."AMC Low PriceSales Limit Auth.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Access for BOM Updateing"; Rec."AMC Access for BOM Updateing")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Production BOM"; Rec."AMC Production BOM")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Administrator R&D"; Rec."AMC Administrator R&D")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Manufacturing Order Open"; Rec."AMC Manufacturing Order Open")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Label Printer"; Rec."AMC Label Printer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Budget Admin"; Rec."AMC Budget Admin")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Budget MPK Filters"; Rec."AMC Budget MPK Filters")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Sales Person Persmisson"; Rec."AMC Sales Person Persmisson")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Terminal User"; Rec."AMC Terminal User")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Startup Form ID"; Rec."AMC Startup Form ID")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Default Scan Mode"; Rec."AMC Default Scan Mode")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC EDI File Monitor"; Rec."AMC EDI File Monitor")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Dostęp Wszystkie Faktury"; Rec."AMC Dostęp Wszystkie Faktury")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Item block setting"; Rec."AMC Item block setting")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Use blocked item on Quote"; Rec."AMC Use blocked item on Quote")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Change Drawer on Quote"; Rec."AMC Change Drawer on Quote")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Sales Item Permission"; Rec."AMC Sales Item Permission")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Purchase Items Permission"; Rec."AMC Purchase Items Permission")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Sales Details Permission"; Rec."AMC Sales Details Permission")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Purchase Details Permission"; Rec."AMC Purchase Details Perm.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Change Dimension Permission"; Rec."AMC Change Dimension Perm.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Optimalisation Trade"; Rec."AMC Optimalisation Trade")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Optimalisation R&D"; Rec."AMC Optimalisation R&D")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Optimalisation Purch."; Rec."AMC Optimalisation Purch.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Optimalisation KJ"; Rec."AMC Optimalisation KJ")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
        }
        addafter(Control1)
        {
            part(AMCSalesPersonTerritory; "AMC Salesp. Territory Setup")
            {
                ApplicationArea = All;
                SubPageLink = "Salesperson Code" = field("Salespers./Purch. Code");
            }
            part(AMCGroupSetup; "AMC R&D Groups Setting")
            {
                ApplicationArea = All;
                SubPageLink = "User ID" = field("User ID");
            }
        }
    }
}
