pageextension 58002 PurchaseOrderSubCustom extends "Purchase Order Subform"
{
    layout
    {
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        movefirst(Control1; "Gen. Prod. Posting Group")
        modify(Type)
        {
            Style = Attention;
        }
        modify("Line No.")
        {
            Visible = true;
        }
        moveafter(Type; "Line No.")
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
        modify("Item Charge Qty. to Handle")
        {
            Visible = false;
        }
        modify("Requested Receipt Date")
        {
            Visible = true;
        }
        modify("Order Date")
        {
            Visible = true;
        }
        moveafter("Qty. Assigned"; "Requested Receipt Date")
        moveafter("Promised Receipt Date"; "Order Date")
        modify("Planned Receipt Date")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
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
        modify("Over-Receipt Quantity")
        {
            Visible = false;
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
        }


    }
}
