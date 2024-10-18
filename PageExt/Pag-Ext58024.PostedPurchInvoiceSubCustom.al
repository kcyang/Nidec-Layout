pageextension 58024 PostedPurchInvoiceSubCustom extends "Posted Purch. Invoice Subform"
{
    layout
    {
        modify("Item Reference No.")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        movelast(Control1; "Line Discount %")
        modify("Job No.")
        {
            Visible = false;
        }
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
