pageextension 58015 PurchCrMemos extends "Purchase Credit Memos"
{
    layout
    {
        addafter("Buy-from Vendor No.")
        {
            field("Vendor Shipment No."; Rec."Vendor Shipment No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Vendor Shipment No.")
        {
            field("Vendor Invoice No."; Rec."Vendor Invoice No.")
            {
                ApplicationArea = All;
            }
        }

        modify("Posting Date")
        {
            Visible = true;
        }
        modify("Vendor Authorization No.")
        {
            Visible = true;
        }
        moveafter("Vendor Authorization No."; "Posting Date")
        modify("Currency Code")
        {
            Visible = true;
        }
        moveafter("Location Code"; "Currency Code")
        addafter("Currency Code")
        {
            field(Receive; Rec.Receive)
            {
                ApplicationArea = All;
            }
            field("Completely Received"; Rec."Completely Received")
            {
                ApplicationArea = All;
            }
            field(Invoice; Rec.Invoice)
            {
                ApplicationArea = All;
            }
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Document Date")
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = false;
        }

        addafter(Amount)
        {
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = All;
            }
        }
        addafter("Amount Including VAT")
        {
            field(CurrRate; CurrRate)
            {
                ApplicationArea = All;
                Caption = '환율';
            }
            field("Amount (LCY)"; "Amount (LCY)")
            {
                ApplicationArea = All;
                Caption = '금액 (원화)';
            }
            field("Send EDI"; Rec."Send EDI")
            {
                ApplicationArea = All;
                Caption = 'EDI 전송';
            }
            field("Created By Name"; Rec."Created By Name")
            {
                ApplicationArea = All;
                Caption = '작성자명';
            }
        }
    }

    actions
    {
        addfirst(processing)
        {
            action(EXPEDI)
            {
                CaptionML = KOR = 'PO EDI 출력', ENU = 'Export PO EDI to Excel';
                Promoted = true;
                PromotedIsBig = true;
                Image = Excel;

                trigger OnAction()
                begin
                    ExportPOEDIToExcel();
                end;
            }
        }
    }

    local procedure ExportPOEDIToExcel()
    var
        ExcelFileName: Text;
    begin
        Clear(tmpPONo);
        Clear(LineNo);
        Clear(GlobalRowNo);

        TempExcelBuffer.DeleteAll();

        if Rec.Count > 0 then begin
            CreateInformation();
            CreateHeader();
            CreateDetail();

            TempExcelBuffer.CreateNewBook('Data');
            TempExcelBuffer.WriteSheet('Purchase Order', CompanyName, UserId);
            TempExcelBuffer.CloseBook();

            // OnPrem - Deprecated.
            // ExcelFileName := 'PO_EDI_Export_' + Format(CurrentDateTime, 0, '<Year4><Month,2><Day,2><Hours24,2><Minutes,2><Seconds,2>') + '.xlsx';
            // TempExcelBuffer.SetFriendlyFilename(ExcelFileName);
            // TempExcelBuffer.OpenExcel();

            TempBlob.CreateOutStream(OutStream);
            TempExcelBuffer.SaveToStream(OutStream, true);
            TempBlob.CreateInStream(InStream);
            ExcelFileName := 'PO_EDI_Export_' + Format(CurrentDateTime, 0, '<Year4><Month,2><Day,2><Hours24,2><Minutes,2><Seconds,2>') + '.xlsx';
            DownloadFromStream(InStream, 'Export', '', 'Excel Files(*.xlsx)|*.xlsx', ExcelFileName);

        end else
            Error('No data to export.');
    end;

    local procedure CreateInformation()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('NIDEC COPAL ELECTRONICS KOREA CORP.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Customer ： NIDEC COPAL ELECTRONICS KOREA CORP.', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Port　of　Discharege ： Incheon　International　airport', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Term　of　Price ： FOB　Japan', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreateHeader()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('PO NO.', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('LINE#', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Issued Date', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Remarks', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('ITEM CODE', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('ITEM', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('QTY', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('U/PRICE', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('AMOUNT', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('REQ.DATE', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
    end;

    local procedure CreateDetail()
    begin
        PurchaseHeader.RESET;
        PurchaseHeader.COPYFILTERS(Rec);
        if PurchaseHeader.FindSet() then
            repeat
                PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");

                if PurchaseLine.FindSet() then
                    repeat
                        LineNo += 1;
                        Postingdate := PurchaseHeader."Posting Date";

                        if Customer.Get(PurchaseHeader."Sell-to Customer No.") then
                            Remarks := Customer."Search Name2";

                        if tmpPONo <> PurchaseLine."Document No." then
                            LineNo := 0;

                        tmpPONo := PurchaseLine."Document No.";

                        TempExcelBuffer.NewRow();
                        TempExcelBuffer.AddColumn(PurchaseLine."Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(Format(LineNo + 1), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                        TempExcelBuffer.AddColumn(Format(Postingdate, 0, '<Year4>.<Month,2>.<Day,2>'), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(Remarks, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(PurchaseLine."No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(PurchaseLine.Description, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                        TempExcelBuffer.AddColumn(PurchaseLine.Quantity, false, '', false, false, false, '#,##0.###', TempExcelBuffer."Cell Type"::Number);
                        TempExcelBuffer.AddColumn(PurchaseLine."Direct Unit Cost", false, '', false, false, false, '#,##0.###', TempExcelBuffer."Cell Type"::Number);
                        TempExcelBuffer.AddColumn(PurchaseLine."Line Amount", false, '', false, false, false, '#,##0.###', TempExcelBuffer."Cell Type"::Number);
                        TempExcelBuffer.AddColumn(Format(PurchaseLine."Order Date", 0, '<Year4>.<Month,2>.<Day,2>'), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                    until PurchaseLine.Next() = 0;
            until PurchaseHeader.Next() = 0;
    end;

    trigger OnAfterGetRecord()
    begin
        CLEAR(CurrRate);
        CLEAR("Amount (LCY)");

        IF Rec."Currency Code" <> '' THEN
            IF Rec."Currency Factor" <> 0 THEN
                CurrRate := 1 / Rec."Currency Factor"
            ELSE
                CurrRate := 1
        ELSE
            CurrRate := 1;

        CurrRate := ROUND(CurrRate, 0.0000001, '=');

        "Amount (LCY)" := ROUND(Rec.Amount * CurrRate, 1, '<');
    end;

    var
        CurrRate: Decimal;
        "Amount (LCY)": Decimal;
        GlobalRowNo: Integer;
        Postingdate: Date;
        LineNo: Integer;
        Remarks: Text[250];
        PurchaseHeader: Record "Purchase Header";
        Customer: Record Customer;
        tmpPONo: Code[10];
        PurchaseLine: Record "Purchase Line";
        TempExcelBuffer: Record "Excel Buffer" temporary;
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;
}
