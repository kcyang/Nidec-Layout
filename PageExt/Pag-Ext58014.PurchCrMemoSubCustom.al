pageextension 58014 PurchCrMemoSubCustom extends "Purch. Cr. Memo Subform"
{
    layout
    {
        modify(Type)
        {
            Style = Attention;
        }
        modify("No.")
        {
            Style = Unfavorable;
        }
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
