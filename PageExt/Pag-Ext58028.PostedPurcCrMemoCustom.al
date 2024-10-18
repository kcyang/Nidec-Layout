pageextension 58028 PostedPurcCrMemoCustom extends "Posted Purchase Credit Memo"
{
    layout
    {
        //############ GENERAL ##################
        addafter("No.")
        {
            field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Buy-from Contact No.")
        {
            Visible = false;
        }
        modify("Vendor Cr. Memo No.")
        {
            Visible = true;
        }
        moveafter("Posting Date"; "Document Date", "Order Address Code", "Purchaser Code", "Responsibility Center")
        moveafter("Document Date"; "Pre-Assigned No.", "Vendor Cr. Memo No.")
        modify(Cancelled)
        {
            Visible = false;
        }
        modify("Buy-from County")
        {
            Visible = false;
        }
        modify("Buy-from Country/Region Code")
        {
            Visible = false;
        }
        modify("VAT Reporting Date")
        {
            Visible = false;
        }
        modify(BuyFromContactPhoneNo)
        {
            Visible = false;
        }
        modify(BuyFromContactMobilePhoneNo)
        {
            Visible = false;
        }
        modify(BuyFromContactEmail)
        {
            Visible = false;
        }
        moveafter("Buy-from Post Code"; "Buy-from Contact")

        //####### Invoice Details ##############
        addfirst("Invoice Details")
        {
            field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        moveafter("Pay-to Vendor No."; "Pay-to Name", "Pay-to Address", "Pay-to Address 2", "Pay-to Post Code", "Pay-to City", "Pay-to Contact", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")
        modify("Vendor Posting Group")
        {
            Visible = false;
        }
        modify(Corrective)
        {
            Visible = false;
        }
        modify(Correction)
        {
            Visible = false;
        }
        //######## Shipping ####################
        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }
        movefirst("Shipping and Payment"; "Ship-to Name")
        moveafter("Ship-to Name"; "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City", "Ship-to Contact", "Location Code")
        modify("Ship-to")
        {
            Visible = false;
        }
        modify("Pay-to")
        {
            Visible = false;
        }
        //###### Foreign Trade ####################
        addafter("Shipping and Payment")
        {
            group(ForeignTrade)
            {
                Caption = '해외무역';
            }
        }
        movefirst(ForeignTrade; "Currency Code")

    }
}
