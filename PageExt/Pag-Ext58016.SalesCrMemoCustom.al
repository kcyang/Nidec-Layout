pageextension 58016 SalesCrMemoCustom extends "Sales Credit Memo"
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
        //####### Invoice Detail ########
        addfirst("Credit Memo Details")
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
        movelast("Credit Memo Details"; "Prices Including VAT")
        movebefore("Prices Including VAT"; "Payment Method Code")
        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Customer Posting Group")
        {
            Visible = false;
        }
        modify(Correction)
        {
            Visible = false;
        }
        addafter("Credit Memo Details")
        {
            group(Shipping)
            {
                Caption = '출고';
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = All;
                }
                grid(POCITY)
                {
                    ShowCaption = false;
                    field("Ship-to Post Code"; Rec."Ship-to Post Code")
                    {
                        ApplicationArea = All;
                        Caption = '출고지 우편번호/도시';
                    }
                    field("Ship-to City"; Rec."Ship-to City")
                    {
                        ShowCaption = false;
                        ApplicationArea = All;
                    }
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = All;
                }
            }
        }
        movelast(Shipping; "Location Code", "Shipment Date")
        //####### Foreign Trade ##########
        modify("Currency Code")
        {
            Style = Unfavorable;
        }
        movefirst("Foreign Trade"; "Currency Code", "EU 3-Party Trade", "Transaction Type")
        modify("Rcvd-from Country/Region Code")
        {
            Visible = false;
        }
        addlast(content)
        {
            group(Application)
            {
                Caption = '적용';
            }
        }
        movefirst(Application; "Applies-to Doc. Type", "Applies-to Doc. No.", "Applies-to ID")
        modify("Applies-to Doc. No.")
        {
            Style = Unfavorable;
        }
        modify("Applies-to Doc. Type")
        {
            Style = Unfavorable;
        }
        modify("Applies-to ID")
        {
            Style = Unfavorable;
        }
        modify(Billing)
        {
            Visible = false;
        }

    }
    actions
    {
        modify(PostAndSend)
        {
            Visible = false;
            Enabled = false;
        }
    }
}
