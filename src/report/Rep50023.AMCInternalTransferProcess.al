report 50023 "AMC Internal Transfer Process"
{
    ApplicationArea = All;
    Caption = 'Internal Transfer Process';
    UsageCategory = Documents;
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/layout/AMC Internal Transfer.rdl';

    dataset
    {
        dataitem(AMCWhseIntTransferHeader; "AMC Whse. Int. Transfer Header")
        {
            DataItemTableView = SORTING("Document No.");
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyCodeCityStreet; CompanyCodeCityStreet) { }
            column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.") { }
            column(CompanyInfoPhoneNo; CompanyInfo."Phone No.") { }
            column(CompanyInfoFaxNo; CompanyInfo."Fax No.") { }
            column(DocumentName; DocumentName) { }
            column(PostedDocNo; PostedDocNo) { }
            column(DocumentNo; "Document No.") { }
            column(RepDate; FORMAT(TODAY, 0, 4)) { }
            column(UserID; UserID()) { }
            column(Document_Date; Format("Document Date")) { }
            column(Posting_Date; Format("Posting Date")) { }

            dataitem("AMC Whse. Int. Transfer Line"; "AMC Whse. Int. Transfer Line")
            {
                DataItemTableView = SORTING("Item No.");
                DataItemLink = "Document No." = FIELD("Document No."),
                               "Transaction Type" = FIELD("Transaction Type");

                column(ConsNo; LineNo) { }
                column(ItemNo; "Item No.") { }
                column(Item_Description; "Item Description") { }
                column(Lot_No_; "Lot No.") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Location_Code; "Location Code") { }
                column(Bin_Code; "Bin Code") { }
                column(New_Location_Code; "New Location Code") { }
                column(New_Bin_Code; "New Bin Code") { }
                column(LineNo; LineNo) { }

                trigger OnPreDataItem()
                begin
                    IF ShowPosted THEN
                        SETRANGE(Posted, TRUE);

                    LineNo := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    LineNo := LineNo + 1;
                    TotalQualQty := TotalQualQty + Quantity;
                end;
            }

            trigger OnPreDataItem()
            begin
                IF DocumentNoFilter <> '' THEN
                    SETFILTER("Document No.", DocumentNoFilter);

                IF DateTo = 0D THEN
                    DateTo := DMY2Date(31, 12, 9999);

                SETRANGE("Posting Date", DateFrom, DateTo);
            end;

            trigger OnAfterGetRecord()
            begin
                CASE "Transaction Type" OF
                    "Transaction Type"::"Internal Transfer":
                        RaportType := STRSUBSTNO('%1', Text001);
                END;

                FormatAddr.Company(CompanyAddr, CompanyInfo);
                CompanyCodeCityStreet := CompanyInfo."Post Code" + ' ' + CompanyInfo.City + ', ' + CompanyAddr[2];
                LineNo := 0;


                DocumentName := STRSUBSTNO(Text005, "Transaction Type");

                IF "Posted Document No." <> '' THEN
                    PostedDocNo := STRSUBSTNO(Text004, "Posted Document No.")
                ELSE
                    PostedDocNo := '';
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(DocumentNoFilter; DocumentNoFilter)
                    {
                        Caption = 'Document No. Filter';
                        ApplicationArea = All;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            CLEAR(WhseOrdList);
                            WhseOrdList.LOOKUPMODE(TRUE);
                            IF WhseOrdList.RUNMODAL() = ACTION::LookupOK THEN BEGIN
                                Text := WhseOrdList.GetSelectionFilter();
                                EXIT(TRUE);
                            END;
                        end;
                    }
                    field(DateFrom; DateFrom)
                    {
                        ApplicationArea = All;
                        Caption = 'Date from';
                    }
                    field(DateTo; DateTo)
                    {
                        ApplicationArea = All;
                        Caption = 'Date to';
                    }
                    field(ShowPosted; ShowPosted)
                    {
                        Caption = 'Show Posted Only';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    procedure SetDocNo(DocNo: Code[20])
    begin
        DocumentNoFilter := DocNo;
    end;

    trigger OnInitReport()
    begin
        CompanyInfo.GET();
        ShowPosted := TRUE;
    end;

    var
        CompanyInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        WhseOrdList: Page "AMC Internal Transfer List";
        DocumentName: Text[200];
        PostedDocNo: Text;
        CompanyAddr: array[8] of Text[100];
        CompanyCodeCityStreet: Text[100];
        DocumentNoFilter: Text[100];
        DateFrom: Date;
        DateTo: Date;
        ShowPosted: Boolean;
        RaportType: Text[100];
        TotalQualQty: Decimal;
        LineNo: Integer;
        Text001: Label 'Phys. Inventory';
        Text003: Label 'Page %1';
        Text004: Label 'Posted Doc No.: %1';
        Text005: Label 'Warehouse Document: %1';
}
