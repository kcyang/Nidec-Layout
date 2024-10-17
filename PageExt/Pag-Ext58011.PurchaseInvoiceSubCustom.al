pageextension 58011 PurchaseInvoiceSubCustom extends "Purch. Invoice Subform"
{
    layout
    {
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        moveafter(Type; "Gen. Prod. Posting Group")
        modify(Type)
        {
            Style = Attention;
        }
        modify("No.")
        {
            Style = Unfavorable;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = true;
        }
        moveafter("No."; "VAT Bus. Posting Group")
        modify("Item Reference No.")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Style = StrongAccent;
        }
        modify("Bin Code")
        {
            Visible = false;
        }
        modify(Quantity)
        {
            Style = Strong;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Line Discount %")
        {
            Visible = true;
        }
        moveafter("Line Amount"; "Line Discount %")
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }

    }
}
