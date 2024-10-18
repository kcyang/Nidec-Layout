pageextension 58030 PostedPurchCrMemosCustom extends "Posted Purchase Credit Memos"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Cr. Memo No."; Rec."Vendor Cr. Memo No.")
            {
                ApplicationArea = All;
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
        modify(Paid)
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
    }
}
