pageextension 58027 PostedPurchReceiptsCustom extends "Posted Purchase Receipts"
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
                PR: Record "Purch. Rcpt. Header";
                CardPage: Page "Posted Purchase Receipt";
            begin
                PR := Rec;
                CardPage.SetRecord(PR);
                CardPage.Run();
            end;
        }
        movebefore("No."; "Posting Date")
        addafter("No.")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
