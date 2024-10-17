pageextension 58001 PurchaseOrderCustom extends "Purchase Order"
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
        modify("Your Reference")
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
        modify("Invoice Received Date")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Quote No.")
        {
            Visible = false;
        }
        modify("Vendor Shipment No.")
        {
            Editable = false;
        }
        modify("Vendor Posting Group")
        {
            Editable = true;
        }
        modify(Prepayment)
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = true;
        }
        moveafter("Buy-from Vendor No."; "Buy-from Contact No.")
        moveafter("Buy-from Post Code"; "Buy-from Contact", "No. of Archived Versions", "Vendor Posting Group")
        addafter("Vendor Posting Group")
        {
            grid(CreatedByGrid)
            {
                ShowCaption = false;
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                    Caption = '작성자';
                }
                field("Created By Name"; Rec."Created By Name")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
        }
        moveafter("Posting Date"; "Order Date", "Document Date", "Vendor Order No.", "Vendor Shipment No.", "Vendor Invoice No.", "Order Address Code", "Purchaser Code", "Responsibility Center", Status)
        addafter(Status)
        {
            field("Send EDI"; Rec."Send EDI")
            {
                ApplicationArea = All;
                ShowCaption = true;
            }
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
        moveafter("Pay-to Vendor No."; "Pay-to Contact No.", "Pay-to Name", "Pay-to Address", "Pay-to Address 2", "Pay-to Post Code", "Pay-to City", "Pay-to Contact", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Payment Terms Code", "Due Date", "Payment Discount %", "Pmt. Discount Date", "Payment Method Code", "On Hold", "Prices Including VAT")
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
        modify(ShippingOptionWithLocation)
        {
            Visible = false;
        }
        modify("Ship-to Country/Region Code")
        {
            Visible = false;
        }
        modify(PayToOptions)
        {
            Visible = false;
        }
        modify("Remit-to Code")
        {
            Visible = false;
        }
        movefirst("Shipping and Payment"; "Ship-to Name")
        moveafter("Ship-to Name"; "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City", "Ship-to Contact", "Location Code", "Inbound Whse. Handling Time", "Shipment Method Code", "Lead Time Calculation", "Requested Receipt Date", "Promised Receipt Date", "Expected Receipt Date", "Sell-to Customer No.", "Ship-to Code")
        //###### Foreign Trade ####################
        moveafter("Currency Code"; "Transaction Type")
    }
}
