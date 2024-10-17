pageextension 58007 SalesInvoiceCustom extends "Sales Invoice"
{
    layout
    {
        //####### GENERAL ###########
        moveafter("Sell-to Customer No."; "Sell-to Contact No.", "Sell-to Customer Name")
        modify("Sell-to Country/Region Code")
        {
            Visible = false;
        }
        moveafter("Sell-to Address 2"; "Sell-to Post Code")
        modify(SellToPhoneNo)
        {
            Visible = false;
        }
        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }
        modify(SellToEmail)
        {
            Visible = false;
        }
        modify("VAT Reporting Date")
        {
            Visible = false;
        }
        modify("Due Date")
        {
            Style = Strong;
        }
        modify("Your Reference")
        {
            Visible = false;
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        modify("Work Description")
        {
            Visible = false;
        }
        movebefore("External Document No."; "Posting Date", "Document Date")
        addafter("Document Date")
        {
            field("Export Permits No."; Rec."Export Permits No.")
            {
                ApplicationArea = All;
                Caption = '수출신고면장 번호';
            }
        }
        //####### Invoice Detail ########
        addfirst("Invoice Details")
        {
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                ApplicationArea = All;
                Style = Unfavorable;
            }
        }
        modify("Bill-to Contact No.")
        {
            Visible = true;
        }
        moveafter("Bill-to Customer No."; "Bill-to Contact No.", "Bill-to Name", "Bill-to Address", "Bill-to Address 2", "Bill-to Post Code", "Bill-to City", "Bill-to Contact")
        moveafter("Bill-to Contact"; "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Payment Terms Code", "Due Date")
        modify("Company Bank Account Code")
        {
            Visible = false;
        }
        movelast("Invoice Details"; "Prices Including VAT")
        movebefore("Prices Including VAT"; "Payment Method Code")
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }
        //####### Shipping ##########
        modify(ShippingOptions)
        {
            Visible = false;
        }
        movefirst("Shipping and Billing"; "Ship-to Code", "Ship-to Name", "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City", "Ship-to Contact", "Location Code", "Shipment Method Code", "Shipping Agent Code", "Shipping Agent Service Code", "Package Tracking No.", "Shipment Date")
        modify(BillToOptions)
        {
            Visible = false;
        }
        //####### Foreign Trade ##########
        modify("Currency Code")
        {
            Style = Unfavorable;
        }
        movefirst("Foreign Trade"; "Currency Code", "EU 3-Party Trade", "Transaction Type")

    }
    actions
    {
        modify(PostAndNew)
        {
            Visible = false;
            Enabled = false;
        }
        modify(PostAndSend)
        {
            Visible = false;
            Enabled = false;
        }
    }
    trigger OnOpenPage()
    begin
        // TECTURA KOREA
        Rec.FILTERGROUP(2);
        Rec.SETRANGE("Sales Type", Rec."Sales Type"::Sales);
        Rec.FILTERGROUP(0);
        // TECTURA KOREA        
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // TECTURA KOREA
        Rec."Sales Type" := Rec."Sales Type"::Sales;
        // TECTURA KOREA        
    end;
}
