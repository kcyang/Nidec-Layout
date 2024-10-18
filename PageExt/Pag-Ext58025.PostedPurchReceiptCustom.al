pageextension 58025 PostedPurchReceiptCustom extends "Posted Purchase Receipt"
{
    layout
    {
        //GENERAL
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }
        movelast(General; "No. Printed")
        addafter("Buy-from Contact")
        {
            grid(CreatedByGrid)
            {
                ShowCaption = false;
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                    Caption = '작성자';
                    Editable = false;
                }
                field("Created By Name"; Rec."Created By Name")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
        }
        //INVOICE
        modify("Pay-to")
        {
            Visible = false;
        }
        moveafter("Pay-to Vendor No."; "Pay-to Name", "Pay-to Address", "Pay-to Address 2", "Pay-to Post Code", "Pay-to City", "Pay-to Contact")
        modify("Pay-to Contact no.")
        {
            Visible = false;
        }
        modify(PayToContactEmail)
        {
            Visible = false;
        }
        modify(PayToContactMobilePhoneNo)
        {
            Visible = false;
        }
        modify(PayToContactPhoneNo)
        {
            Visible = false;
        }
    }
}
