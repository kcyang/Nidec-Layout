pageextension 58029 PostedPurchCrMemoSubCustom extends "Posted Purch. Cr. Memo Subform"
{
    layout
    {
        modify("Item Reference No.")
        {
            Visible = false;
        }
        moveafter("Line Amount"; "Line Discount %")
        modify("Deferral Code")
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
        modify("ShortcutDimCode[3]")
        {
            Visible = false;
        }
        modify("ShortcutDimCode[4]")
        {
            Visible = false;
        }
    }
}
