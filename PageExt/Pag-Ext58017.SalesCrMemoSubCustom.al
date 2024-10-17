pageextension 58017 SalesCrMemoSubCustom extends "Sales Cr. Memo Subform"
{
    layout
    {
        modify(Type)
        {
            Style = Strong;
        }
        modify("No.")
        {
            Style = Strong;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        moveafter("No."; "Gen. Prod. Posting Group")
        moveafter("Gen. Prod. Posting Group"; "VAT Bus. Posting Group", "VAT Prod. Posting Group")
        modify("Item Reference No.")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Style = Strong;
        }
        modify(Quantity)
        {
            Style = Strong;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        moveafter("Unit Price"; "Line Amount")
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Style = Strong;
        }
        modify("Unit Price")
        {
            Style = Unfavorable;
        }
        modify("Qty. Assigned")
        {
            Visible = true;
        }
        moveafter("Qty. to Assign"; "Qty. Assigned")
    }
}
