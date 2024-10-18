pageextension 58023 PostedPurchInvoiceCustom extends "Posted Purchase Invoice"
{
    layout
    {
        //############ GENERAL ##################
        modify("Buy-from County")
        {
            Visible = false;
        }
        addafter("No.")
        {
            field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        moveafter("Buy-from Vendor No."; "Buy-from Contact No.")
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
        modify("Vendor Posting Group")
        {
            Editable = true;
        }
        moveafter("Buy-from Post Code"; "Buy-from Contact", "Vendor Posting Group")
        moveafter("Posting Date"; "Document Date", "Vendor Order No.", "Vendor Invoice No.", "Order Address Code", "Purchaser Code", "Responsibility Center")
        //####### Invoice Details ##############
        addfirst("Invoice Details")
        {
            field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Pay-to Contact No.")
        {
            Visible = true;
        }
        modify("Pay-to Address")
        {
            Visible = true;
        }
        modify("Pay-to Address 2")
        {
            Visible = true;
        }
        modify("Pay-to Post Code")
        {
            Visible = true;
        }
        modify("Pay-to City")
        {
            Visible = true;
        }
        modify("Pmt. Discount Date")
        {
            Visible = true;
        }


        moveafter("Pay-to Vendor No."; "Pay-to Contact No.", "Pay-to Name", "Pay-to Address", "Pay-to Address 2", "Pay-to Post Code", "Pay-to City", "Pay-to Contact", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Payment Terms Code", "Due Date", "Payment Discount %", "Pmt. Discount Date", "Payment Method Code")
        modify("Tax Liable")
        {
            Visible = false;
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }
        //######## Shipping ####################
        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }
        modify("Remit-to Code")
        {
            Visible = false;
        }
        movefirst("Shipping and Payment"; "Ship-to Name")
        moveafter("Ship-to Name"; "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City", "Ship-to Contact", "Location Code", "Shipment Method Code", "Expected Receipt Date")
        //###### Foreign Trade ####################
        modify(Corrective)
        {
            Visible = false;
        }
        modify(Cancelled)
        {
            Visible = false;
        }
        moveafter("Document Date"; "Order No.", "Pre-Assigned No.", "Vendor Order No.", "Vendor Invoice No.")

        modify("Quote No.")
        {
            Visible = false;
        }
        addafter("Shipping and Payment")
        {
            group(ForeignTrade)
            {
                Caption = '해외무역';
            }
        }
        movefirst(ForeignTrade; "Currency Code")
        modify("Pay-to")
        {
            Visible = false;
        }
        modify("Remit-to")
        {
            Visible = false;
        }
        modify("Order Address Code")
        {
            Visible = false;
        }
        modify("Ship-to")
        {
            Visible = false;
        }
    }
}
