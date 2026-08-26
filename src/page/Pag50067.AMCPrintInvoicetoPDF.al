page 50067 "AMC Print Invoice to PDF"
{
    ApplicationArea = All;
    Caption = 'Print Invoice to PDF';
    PageType = Card;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ReportID; ReportID)
                {
                    ApplicationArea = All;
                    Caption = 'Report ID';
                    Editable = false;
                }
                field(ReportName; Object."Object Name")
                {
                    Caption = 'Report Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(InvoiceNo; InvoiceNo)
                {
                    ApplicationArea = All;
                    Caption = 'Invoice No.';
                }
                field(SavePDFAs; FileDirectory + FileName)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Save PDF as';
                }
                field(MakeAtestPDF; MakeAtestPDF)
                {
                    Caption = 'Make Atest PDF';
                    ApplicationArea = All;
                }
                field(AtestDirectory; AtestDirectory)
                {
                    Caption = 'Atest PDF Folder';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AtestReportID; AtestReportID)
                {
                    Caption = 'Atest Report ID';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ObjectAtestName; ObjectAtest."Object Name")
                {
                    Caption = 'Atest Report Name';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(MakeShipmtPDF; MakeShipmtPDF)
                {
                    Caption = 'Make Shipment PDF';
                    ApplicationArea = All;
                }
                field(ShipmentDirectory; ShipmentDirectory)
                {
                    Caption = 'Shipment Folder';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ShipmentReportID; ShipmentReportID)
                {
                    Caption = 'Shipment Report ID';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ObjectShipmentName; ObjectShipment."Object Name")
                {
                    Caption = 'Shipment Report Name';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                action(PrintPDF)
                {
                    ApplicationArea = All;
                    Caption = 'Print to PDF';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        PDFDoc: Record "AMC PDF Document";
                        PostedWhseShipmentHdr: Record "Posted Whse. Shipment Header";
                        DocumentLineNo: Integer;
                    begin
                        PDFDocuments.RESET();
                        PDFDocuments.SETRANGE("Document Type", PDFDocuments."Document Type"::"Posted Invoice");
                        PDFDocuments.SETRANGE("Document No", SalesInvHeader."No.");
                        IF PDFDocuments.FINDLAST() THEN
                            DocumentLineNo := PDFDocuments."Entry No";
                        DocumentLineNo += 1;

                        PDFDocuments.INIT();
                        PDFDocuments."Document Type" := PDFDocuments."Document Type"::"Posted Invoice";
                        PDFDocuments."Document No" := SalesInvHeader."No.";
                        PDFDocuments."Entry No" := DocumentLineNo;
                        PDFDocuments."PDF Document Type" := PDFDocuments."PDF Document Type"::"Sales Invoice";
                        PDFDocuments."PDF Document No" := SalesInvHeader."No.";
                        PDFDocuments."PDF File Link" := STRSUBSTNO('%1%2', FileDirectory, FileName);
                        PDFDocuments."Customer Code" := SalesInvHeader."Bill-to Customer No.";
                        PDFDocuments."User ID" := USERID;
                        PDFDocuments."Generation Date" := CREATEDATETIME(WORKDATE(), TIME);
                        PDFDocuments."Date of Last Send" := CREATEDATETIME(WORKDATE(), TIME);

                        PDFDoc.Reset();
                        PDFDoc.SetRange("Document Type", PDFDoc."Document Type"::"Posted Invoice");
                        PDFDoc.SetRange("Document No", SalesInvHeader."No.");
                        PDFDoc.SetRange("PDF Document Type", PDFDoc."PDF Document Type"::"Sales Invoice");
                        if not PDFDoc.IsEmpty() then begin
                            PDFDocuments."Document Duplicate" := true;
                            PDFDocuments."Duplicate Date" := WorkDate();
                        end;

                        PDFDocuments.INSERT();
                        DocumentLineNo += 1;
                        
                        Report.RunModal(Report::"AMC Posted Sales Invoice", false, false, SalesInvHeader);

                        IF MakeAtestPDF THEN BEGIN
                            ValueEntry.RESET();
                            ValueEntry.SETCURRENTKEY("Document No.", "Posting Date");
                            ValueEntry.SETRANGE("Document No.", SalesInvHeader."No.");
                            IF ValueEntry.FINDSet() THEN
                                REPEAT
                                    ItemLedgerEntry.RESET();
                                    ItemLedgerEntry.SETRANGE("Entry No.", ValueEntry."Item Ledger Entry No.");
                                    IF ItemLedgerEntry.FINDFIRST() THEN BEGIN
                                        PostedWhseShipmentLine.RESET();
                                        PostedWhseShipmentLine.SETRANGE("Posted Source No.", ItemLedgerEntry."Document No.");
                                        PostedWhseShipmentLine.SETRANGE("Posted Source Document",
                                                                         PostedWhseShipmentLine."Posted Source Document"::"Posted Shipment");
                                        IF PostedWhseShipmentLine.FINDset() THEN
                                            REPEAT
                                                PDFDocuments.RESET();
                                                PDFDocuments.SETRANGE("Document Type", PDFDocuments."Document Type"::"Posted Invoice");
                                                PDFDocuments.SETRANGE("Document No", SalesInvHeader."No.");
                                                PDFDocuments.SETRANGE("PDF Document Type", PDFDocuments."PDF Document Type"::Atest);
                                                PDFDocuments.SETRANGE("PDF Document No", PostedWhseShipmentLine."No.");
                                                IF NOT PDFDocuments.FINDFIRST() THEN BEGIN
                                                    PDFDocuments.INIT();
                                                    PDFDocuments."Document Type" := PDFDocuments."Document Type"::"Posted Invoice";
                                                    PDFDocuments."Document No" := SalesInvHeader."No.";

                                                    DocumentLineNo := DocumentLineNo + 1;
                                                    PDFDocuments."Entry No" := DocumentLineNo;
                                                    PDFDocuments."PDF Document Type" := PDFDocuments."PDF Document Type"::Atest;
                                                    PDFDocuments."PDF Document No" := PostedWhseShipmentLine."No.";

                                                    PDFDocuments."Customer Code" := SalesInvHeader."Bill-to Customer No.";
                                                    PDFDocuments."User ID" := USERID;
                                                    PDFDocuments."Generation Date" := CREATEDATETIME(WORKDATE(), TIME);

                                                    PDFDoc.Reset();
                                                    PDFDoc.SetRange("Document Type", PDFDoc."Document Type"::"Posted Invoice");
                                                    PDFDoc.SetRange("Document No", SalesInvHeader."No.");
                                                    PDFDoc.SetRange("PDF Document Type", PDFDoc."PDF Document Type"::Atest);
                                                    if not PDFDoc.IsEmpty() then begin
                                                        PDFDocuments."Document Duplicate" := true;
                                                        PDFDocuments."Duplicate Date" := WorkDate();
                                                    end;

                                                    PDFDocuments.INSERT();
                                                    DocumentLineNo += 1;
                                                END;
                                            UNTIL PostedWhseShipmentLine.NEXT() = 0;
                                    END;
                                UNTIL ValueEntry.NEXT() = 0;
                        end;

                        IF MakeShipmtPDF THEN BEGIN
                            ValueEntry.RESET();
                            ValueEntry.SETCURRENTKEY("Document No.", "Posting Date");
                            ValueEntry.SETRANGE("Document No.", SalesInvHeader."No.");
                            IF ValueEntry.FINDset() THEN
                                REPEAT
                                    ItemLedgerEntry.RESET();
                                    ItemLedgerEntry.SETRANGE("Entry No.", ValueEntry."Item Ledger Entry No.");
                                    IF ItemLedgerEntry.FINDFIRST() THEN BEGIN
                                        PostedWhseShipmentLine.RESET();
                                        PostedWhseShipmentLine.SETRANGE("Posted Source No.", ItemLedgerEntry."Document No.");
                                        PostedWhseShipmentLine.SETRANGE("Posted Source Document",
                                                                         PostedWhseShipmentLine."Posted Source Document"::"Posted Shipment");
                                        IF PostedWhseShipmentLine.FindSet() THEN
                                            REPEAT
                                                PDFDocuments.RESET();
                                                PDFDocuments.SETRANGE("Document Type", PDFDocuments."Document Type"::"Posted Invoice");
                                                PDFDocuments.SETRANGE("Document No", SalesInvHeader."No.");
                                                PDFDocuments.SETRANGE("PDF Document Type", PDFDocuments."PDF Document Type"::"Warehause Shipment");
                                                PDFDocuments.SETRANGE("PDF Document No", PostedWhseShipmentLine."No.");
                                                IF NOT PDFDocuments.FINDFIRST() THEN BEGIN
                                                    PDFDocuments.INIT();
                                                    PDFDocuments."Document Type" := PDFDocuments."Document Type"::"Posted Invoice";
                                                    PDFDocuments."Document No" := SalesInvHeader."No.";
                                                    ShipmentFileName := PostedWhseShipmentLine."No." + '.pdf';
                                                    PDFDocuments."PDF File Link" := STRSUBSTNO('%1%2', ShipmentDirectory, ShipmentFileName);
                                                    DocumentLineNo := DocumentLineNo + 1;
                                                    PDFDocuments."Entry No" := DocumentLineNo;
                                                    PDFDocuments."PDF Document Type" := PDFDocuments."PDF Document Type"::"Warehause Shipment";
                                                    PDFDocuments."PDF Document No" := PostedWhseShipmentLine."No.";

                                                    PDFDocuments."Customer Code" := SalesInvHeader."Bill-to Customer No.";
                                                    PDFDocuments."User ID" := USERID;
                                                    PDFDocuments."Generation Date" := CREATEDATETIME(WORKDATE(), TIME);

                                                    PDFDoc.Reset();
                                                    PDFDoc.SetRange("Document Type", PDFDoc."Document Type"::"Posted Invoice");
                                                    PDFDoc.SetRange("Document No", SalesInvHeader."No.");
                                                    PDFDoc.SetRange("PDF Document Type", PDFDoc."PDF Document Type"::"Warehause Shipment");
                                                    if not PDFDoc.IsEmpty() then begin
                                                        PDFDocuments."Document Duplicate" := true;
                                                        PDFDocuments."Duplicate Date" := WorkDate();
                                                    end;
                                                    PDFDocuments.INSERT();
                                                    PostedWhseShipmentHdr.Reset();
                                                    PostedWhseShipmentHdr.SetRange("No.", PostedWhseShipmentLine."No.");
                                                    Report.RunModal(Report::"AMC Whse. - Posted Shipment", true, false, PostedWhseShipmentHdr);
                                                END;
                                            UNTIL PostedWhseShipmentLine.NEXT() = 0;
                                    END;
                                UNTIL ValueEntry.NEXT() = 0;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin

        IF ReportID = 0 THEN BEGIN
            ReportID := REPORT::"AMC Posted Sales Invoice";
            IF Object.GET(Object."Object Type"::Report, ReportID) THEN;
        END;

        IF ShipmentReportID = 0 THEN BEGIN
            ShipmentReportID := REPORT::"Whse. - Posted Shipment";
            IF ObjectShipment.GET(Object."Object Type"::Report, ShipmentReportID) THEN;
        END;
        SaleRecevSetup.GET();
        FileDirectory := SaleRecevSetup."AMC Invoice PDF Catalog";
        AtestDirectory := SaleRecevSetup."AMC Invoice PDF Catalog";
        ShipmentDirectory := SaleRecevSetup."AMC Invoice PDF Catalog";
    end;

    procedure SetInvoiceNo(InvNo: Code[20])
    begin
        ReportID := REPORT::"AMC Posted Sales Invoice";
        IF Object.GET(Object."Object Type"::Report, ReportID) THEN;

        SetDocumentType := SetDocumentType::Invoice;
        InvoiceNo := InvNo;

        FileName := CONVERTSTR(InvoiceNo, '/', '_');

        SalesInvHeader.Reset();
        SalesInvHeader.SetRange("No.", InvoiceNo);
        IF SalesInvHeader.FindFirst() THEN BEGIN
            CustCode := CONVERTSTR(SalesInvHeader."Bill-to Customer No.", '/', '_');
            IF CustRec.GET(SalesInvHeader."Bill-to Customer No.") THEN BEGIN
                CustName := COPYSTR(CustRec."Search Name", 1, 10);
                CustName := CONVERTSTR(CustName, '\/'' .', '_____');
                CustName := CONVERTSTR(CustName, '"', '_');
            END;
        END;
        FileName := STRSUBSTNO('%1-%2-%3.pdf', FileName, CustCode, CustName);
    end;

    var
        SaleRecevSetup: Record "Sales & Receivables Setup";
        SalesInvHeader: Record "Sales Invoice Header";
        CustRec: Record Customer;
        PDFDocuments: Record "AMC PDF Document";
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        PostedWhseShipmentLine: Record "Posted Whse. Shipment Line";
        Object: Record AllObj;
        ObjectAtest: Record AllObj;
        ObjectShipment: Record AllObj;
        FileDirectory: Text[100];
        FileName: Text[100];
        ShipmentFileName: Text[100];
        AtestDirectory: Text[100];
        ShipmentDirectory: Text[100];
        CustCode: Text[50];
        CustName: Text[50];
        InvoiceNo: Code[20];
        ReportID: Integer;
        AtestReportID: Integer;
        ShipmentReportID: Integer;
        SetDocumentType: Option Order,Invoice,"Credit Memo";
        MakeAtestPDF: Boolean;
        MakeShipmtPDF: Boolean;
        CompletionLbl: Label 'The documents have been created';
}
