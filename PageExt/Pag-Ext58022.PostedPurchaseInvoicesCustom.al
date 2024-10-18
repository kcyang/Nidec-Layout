pageextension 58022 PostedPurchaseInvoicesCustom extends "Posted Purchase Invoices"
{
    layout
    {
        modify("Posting Date")
        {
            Visible = true;
        }
        addafter("No.")
        {
            field("Order Date"; Rec."Order Date")
            {
                Visible = true;
            }
        }
        moveafter("Order Date"; "Posting Date")
        modify("Currency Code")
        {
            Visible = true;
        }
        moveafter("Buy-from Vendor Name"; "Currency Code")
        modify("Document Date")
        {
            Visible = false;
        }
        addafter("Amount Including VAT")
        {
            field(CurrRate; CurrRate)
            {
                ApplicationArea = All;
                Caption = '환율';
                DecimalPlaces = 2 : 4;
            }
            field("Amount (LCY)"; "Amount (LCY)")
            {
                ApplicationArea = All;
                Caption = '금액 (원)';
            }
            field("Send EDI"; Rec."Send EDI")
            {
                ApplicationArea = All;
                Caption = 'EDI 전송';
                Visible = false;
            }
            field("Created By Name"; Rec."Created By Name")
            {
                ApplicationArea = All;
                Caption = '작성자명';
                Visible = false;
            }
        }
        modify("Due Date")
        {
            Visible = false;
        }
        modify("Remaining Amount")
        {
            Visible = false;
        }
        modify(Closed)
        {
            Visible = false;
        }
        modify(Cancelled)
        {
            Visible = false;
        }
        modify(Corrective)
        {
            Visible = false;
        }
        moveafter("Amount Including VAT"; "Location Code", "No. Printed")
    }
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
}
