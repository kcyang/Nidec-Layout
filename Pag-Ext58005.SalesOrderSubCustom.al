pageextension 58005 SalesOrderSubCustom extends "Sales Order Subform"
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
        modify("Qty. to Assemble to Order")
        {
            Visible = false;
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
        modify("Item Charge Qty. to Handle")
        {
            Visible = false;
        }
        addafter("Shipment Date")
        {
            field("PO NO."; Rec."PO NO.")
            {
                ApplicationArea = All;
            }
            field(Remark; Rec.Remark)
            {
                ApplicationArea = All;
            }
        }
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
    }
}
