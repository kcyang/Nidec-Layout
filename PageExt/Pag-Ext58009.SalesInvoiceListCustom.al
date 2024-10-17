pageextension 58009 SalesInvoiceListCustom extends "Sales Invoice List"
{
    layout
    {
        modify("Posting Date")
        {
            Visible = true;
        }
        modify("No.")
        {
            trigger OnDrillDown()
            var
                SH: Record "Sales Header";
                SalesOrder: Page "Sales Invoice";
            begin
                SH := Rec;
                SalesOrder.SetRecord(SH);
                SalesOrder.Run();
            end;
        }
        movebefore("No."; "Posting Date")
        moveafter("No."; "External Document No.")
        addafter("Sell-to Customer Name")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
                Caption = '일자';
            }
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
        }
        moveafter("Order Date"; "Shortcut Dimension 1 Code")
        addafter("Shortcut Dimension 1 Code")
        {
            field("Dimension 1 Name"; Rec."Dimension 1 Name")
            {
                ApplicationArea = All;
                Caption = '매출처 그룹명';
            }
        }
        moveafter("Dimension 1 Name"; "Shortcut Dimension 2 Code")
        addafter("Shortcut Dimension 2 Code")
        {
            field("Dimension 2 Name"; Rec."Dimension 2 Name")
            {
                ApplicationArea = All;
                Caption = '품목 그룹명';
            }
        }
        addafter("Location Code")
        {
            field(Invoice; Rec.Invoice)
            {
                ApplicationArea = All;
                Caption = '송장';
            }
        }
        modify("Document Date")
        {
            Visible = false;
        }
        modify(Status)
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = true;
        }

        moveafter(Amount; "Currency Code")
        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                ApplicationArea = All;
            }
            field(CurrRate; CurrRate)
            {
                ApplicationArea = All;
                DecimalPlaces = 2 : 5;
                Caption = '환율';
            }
            field("Amount (LCY)"; "Amount (LCY)")
            {
                ApplicationArea = All;
                DecimalPlaces = 2 : 5;
                Caption = '금액 (원화)';
            }
            field("Created By Name"; Rec."Created By Name")
            {
                ApplicationArea = All;
                Caption = '작성자명';
            }
        }

        modify("Due Date")
        {
            Visible = false;
        }
    }

    trigger OnAfterGetRecord()
    begin
        //>> TKR Brandon 23APR09
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
