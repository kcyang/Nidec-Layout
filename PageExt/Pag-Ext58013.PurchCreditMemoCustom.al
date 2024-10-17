pageextension 58013 PurchCreditMemoCustom extends "Purchase Credit Memo"
{
    layout
    {
        //############ GENERAL ##################
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
        modify("Assigned User ID")
        {
            Visible = false;
        }
        moveafter("Buy-from Vendor No."; "Buy-from Contact No.")
        moveafter("Buy-from Post Code"; "Buy-from Contact")
        moveafter("Posting Date"; "Document Date", "Order Address Code", "Purchaser Code", "Responsibility Center", Status)
        moveafter("Document Date"; "Vendor Authorization No.", "Vendor Cr. Memo No.")
        modify("Campaign No.")
        {
            Visible = false;
        }
        //####### Invoice Details ##############
        movefirst("Foreign Trade"; "Currency Code")
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        addfirst("Invoice Details")
        {
            field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Pay-to Vendor No."; "Pay-to Contact No.", "Pay-to Name", "Pay-to Address", "Pay-to Address 2", "Pay-to Post Code", "Pay-to City", "Pay-to Contact", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Payment Terms Code", "Due Date", "Payment Discount %", "Pmt. Discount Date", "Payment Method Code", "Prices Including VAT")
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Vendor Posting Group")
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
        moveafter("Ship-to Name"; "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City", "Ship-to Contact", "Location Code", "Expected Receipt Date")
        modify(ShipToOptions)
        {
            Visible = false;
        }
        modify("Ship-to")
        {
            Visible = false;
        }
        modify("Pay-to")
        {
            Visible = false;
        }
        //###### Foreign Trade ####################
        moveafter("Currency Code"; "Transaction Type")
    }
}
