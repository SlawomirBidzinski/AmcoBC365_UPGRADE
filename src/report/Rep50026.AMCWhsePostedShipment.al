report 50026 "AMC Whse. - Posted Shipment"
{
    ApplicationArea = All;
    Caption = 'AMC Whse. - Posted Shipment';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/layout/AMC Whse. Posted Shipment.rdl';

    dataset
    {
        dataitem("Posted Whse. Shipment Header"; "Posted Whse. Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(CompanyName; COMPANYPROPERTY.DisplayName())
                {
                }
                column(TodayFormatted; Format(Today, 0, 4))
                {
                }
                column(AssgndUID_PostedWhseShptHeader; "Posted Whse. Shipment Header"."Assigned User ID")
                {
                }
                column(LocCode_PostedWhseShptHeader; "Posted Whse. Shipment Header"."Location Code")
                {
                }
                column(No_PostedWhseShptHeader; "Posted Whse. Shipment Header"."No.")
                {
                }
                column(BinMandatoryShow1; not Location."Bin Mandatory")
                {
                }
                column(BinMandatoryShow2; Location."Bin Mandatory")
                {
                }
                column(AssgndUID_PostedWhseShptHeaderCaption; "Posted Whse. Shipment Header".FieldCaption("Assigned User ID"))
                {
                }
                column(LocCode_PostedWhseShptHeaderCaption; "Posted Whse. Shipment Header".FieldCaption("Location Code"))
                {
                }
                column(No_PostedWhseShptHeaderCaption; "Posted Whse. Shipment Header".FieldCaption("No."))
                {
                }
                column(ShelfNo_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Shelf No."))
                {
                }
                column(ItemNo_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Item No."))
                {
                }
                column(Desc_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption(Description))
                {
                }
                column(UOM_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Unit of Measure Code"))
                {
                }
                column(Qty_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption(Quantity))
                {
                }
                column(SourceNo_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Source No."))
                {
                }
                column(SourceDoc_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Source Document"))
                {
                }
                column(ZoneCode_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Zone Code"))
                {
                }
                column(BinCode_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Bin Code"))
                {
                }
                column(LocCode_PostedWhseShptLineCaption; "Posted Whse. Shipment Line".FieldCaption("Location Code"))
                {
                }
                column(CurrReportPAGENOCaption; CurrReportPAGENOCaptionLbl)
                {
                }
                column(WarehousePostedShipmentCaption; WarehousePostedShipmentCaptionLbl)
                {
                }
                column(CompanyPicture; CompanyInfo.Picture) { }
                column(DocumentDate; Format("Posted Whse. Shipment Line"."Shipment Date")) { }
                column(OrderDate; Format("Posted Whse. Shipment Line"."Shipment Date")) { }
                column(CompanyAddress1; CompanyAddr[1]) { }
                column(CompanyAddress2; CompanyAddr[2]) { }
                column(CompanyAddress3; CompanyAddr[4]) { }
                column(CompanyAddress4; CompanyAddr[3]) { }
                column(CustomerAddress1; "Posted Whse. Shipment Header"."AMC Customer Name") { }
                column(CustomerAddress2; "Posted Whse. Shipment Header"."AMC Customer Address") { }
                column(CustomerAddress3; "Posted Whse. Shipment Header"."AMC Customer post code") { }
                column(CustomerAddress4; "Posted Whse. Shipment Header"."AMC Customer City") { }
                column(VATRegistrationNo; Cust."VAT Registration No.") { }
                column(CompanyPhoneNo; CompanyInfo."Phone No.") { }
                column(CompanyEMail; CompanyInfo."E-Mail") { }
                column(BDO_Text; CompanyInfo."AMC BDO") { }
                column(ShipToAddress2; "Posted Whse. Shipment Header"."AMC Ship-to Name") { }
                column(ShipToAddress3; "Posted Whse. Shipment Header"."AMC Ship-to Post Code" + ' ' + "Posted Whse. Shipment Header"."AMC Ship-to City") { }
                column(CustVATRegNo; '') { }
                column(SetUserName; UserID) { }
                //column(TotalWeight; STRSUBSTNO('%1 %2', FORMAT(TotalWeight, 0, '<Precision,2:2><Integer Thousand><Decimals>'), 'kg')) { }
                column(TotalWeight; TotalWeight) { }

                dataitem("Posted Whse. Shipment Line"; "Posted Whse. Shipment Line")
                {
                    DataItemLink = "No." = field("No.");
                    DataItemLinkReference = "Posted Whse. Shipment Header";
                    DataItemTableView = sorting("No.", "Line No.");
                    column(ShelfNo_PostedWhseShptLine; "Shelf No.")
                    {
                    }
                    column(ItemNo_PostedWhseShptLine; "Item No.")
                    {
                    }
                    column(Desc_PostedWhseShptLine; Description)
                    {
                    }
                    column(UOM_PostedWhseShptLine; "Unit of Measure Code")
                    {
                    }
                    column(LocCode_PostedWhseShptLine; "Location Code")
                    {
                    }
                    column(SourceNo_PostedWhseShptLine; "Source No.")
                    {
                    }
                    column(SourceDoc_PostedWhseShptLine; "Source Document")
                    {
                    }
                    column(ZoneCode_PostedWhseShptLine; "Zone Code")
                    {
                    }
                    column(BinCode_PostedWhseShptLine; "Bin Code")
                    {
                    }
                    column(ConsNo; ConsNo) { }
                    column(Psc_Line_Qty; Psc_Line_Qty) { }
                    dataitem("Item Ledger Entry"; "Item Ledger Entry")
                    {
                        DataItemTableView = sorting("Entry No.");
                        DataItemLinkReference = "Posted Whse. Shipment Line";
                        DataItemLink = "Document No." = field("Posted Source No."), "Document Line No." = field("Source Line No.");
                        //xxx
                        column(ILEEntry_No_; "Entry No.") { }
                        column(Qty_PostedWhseShptLine; -Quantity) { }
                        column(SerialLineNo; STRSUBSTNO('%1.', "Serial No.")) { }
                        column(LotNo; "Lot No.") { }
                        column(ExpDate; FORMAT("Expiration Date", 0, '<month,2>-<Year4>')) { }
                        column(Quantity_Text; Quantity_Text) { }
                        column(Quantity_Pcs_Text; Quantity_Pcs_Text) { }

                        trigger OnAfterGetRecord()
                        begin
                            ConsNo += 1;

                            Quantity_Text := '';
                            Quantity_Pcs_Text := '';

                            IF NOT LotNoInfo.GET("Item No.", "Variant Code", "Lot No.") THEN
                                LotNoInfo.INIT();

                            IF "Lot No." <> '' THEN BEGIN
                                Quantity_Text := STRSUBSTNO('%1 (%2)', -Quantity, UnitOfMeasureName);
                                IF (Pack_Qty <> 0) AND (Customer_Pcs = TRUE) THEN BEGIN
                                    Lot_Pcs_Qty := -Quantity / Pack_Qty;
                                    Quantity_Pcs_Text := STRSUBSTNO('%1 (%2)', Lot_Pcs_Qty, 'szt');
                                END;
                            end;
                        end;
                    }
                    trigger OnAfterGetRecord()
                    var
                        SalesShipmentLine: Record "Sales Shipment Line";
                        ItemCrossReference: Record "Item Reference";
                        ItemRec: Record Item;
                        UnitOfMeasureRec: Record "Unit of Measure";
                    begin
                        GetLocation("Location Code");

                        Psc_Line_Qty := 0;
                        Pack_Qty := 0;

                        SalesShipmentLine.RESET();
                        SalesShipmentLine.SETRANGE("Document No.", "Posted Whse. Shipment Line"."Posted Source No.");
                        SalesShipmentLine.SETRANGE("Line No.", "Posted Whse. Shipment Line"."Source Line No.");
                        IF SalesShipmentLine.FINDFIRST() THEN BEGIN
                            Psc_Line_Qty := SalesShipmentLine."AMC Qty of Pieces";
                            Pack_Qty := SalesShipmentLine."AMC Pack Quantity";

                            CustItemRef := '';

                            ItemCrossReference.RESET();
                            ItemCrossReference.SETRANGE("Item No.", "Posted Whse. Shipment Line"."Item No.");
                            ItemCrossReference.SETRANGE("Reference Type", ItemCrossReference."Reference Type"::Customer);
                            ItemCrossReference.SETRANGE("Reference Type No.", SalesShipmentLine."Bill-to Customer No.");
                            IF ItemCrossReference.FINDFIRST() THEN
                                CustItemRef := STRSUBSTNO('(%1)', ItemCrossReference."Reference No.");
                        END;

                        IF Customer_Pcs THEN BEGIN
                            IF "Posted Whse. Shipment Line"."Unit of Measure Code" = 'KG' THEN
                                TotalWeight += "Posted Whse. Shipment Line".Quantity
                            ELSE
                                IF ItemRec.GET("Posted Whse. Shipment Line"."Item No.") THEN
                                    IF ItemRec."Net Weight" <> 0 THEN
                                        TotalWeight += ("Posted Whse. Shipment Line".Quantity) * ItemRec."Net Weight";

                            IF UnitOfMeasureRec.GET("Posted Whse. Shipment Line"."Unit of Measure Code") THEN
                                IF UnitOfMeasureRec."AMC Invoice Descr." <> '' THEN
                                    UnitOfMeasureName := UnitOfMeasureRec."AMC Invoice Descr."
                                ELSE
                                    UnitOfMeasureName := "Posted Whse. Shipment Line"."Unit of Measure Code";
                        END;
                    end;

                    trigger OnPreDataItem()
                    begin
                        ConsNo := 0;
                        TotalWeight := 0;
                    end;
                }
            }

            trigger OnAfterGetRecord()
            var
                CustomerRec: Record Customer;
            begin
                GetLocation("Location Code");

                Customer_Pcs := true;
                IF CustomerRec.GET("Posted Whse. Shipment Header"."AMC Customer Code") THEN
                    Customer_Pcs := CustomerRec."AMC Invoice per Pieces";
            end;
        }
    }

    requestpage
    {
        Caption = 'Warehouse Posted Shipment';

    }

    var
        Location: Record Location;
        Cust: Record Customer;
        LotNoInfo: Record "Lot No. Information";
        CurrReportPAGENOCaptionLbl: Label 'Page';
        WarehousePostedShipmentCaptionLbl: Label 'Warehouse Posted Shipment';
        ConsNo: Integer;
        Quantity_Pcs_Text: Text;
        Quantity_Text: Text;
        Psc_Line_Qty: Decimal;
        Pack_Qty: Decimal;
        Lot_Pcs_Qty: Decimal;
        CustItemRef: Text;
        UnitOfMeasureName: Text;
        Customer_Pcs: Boolean;
        TotalWeight: Decimal;

    local procedure GetLocation(LocationCode: Code[10])
    begin
        if LocationCode = '' then
            Location.Init()
        else
            if Location.Code <> LocationCode then
                Location.Get(LocationCode);
    end;

    local procedure FormatAddressFields()
    begin
        FormatAddr.Company(CompanyAddr, CompanyInfo);
    end;

    trigger OnInitReport()
    begin
        if not Cust.Get("Posted Whse. Shipment Header"."AMC Customer Code") then
            Cust.Init();

        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
        FormatAddressFields();
    end;

    var
        CompanyInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
}
