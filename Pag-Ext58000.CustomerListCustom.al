pageextension 58000 CustomerListCustom extends "Customer List"
{
    layout
    {
        modify("Credit Limit (LCY)")
        {
            Visible = true;
        }
        modify("Salesperson Code")
        {
            Visible = true;
        }
        modify(Contact)
        {
            Visible = true;
            ShowCaption = true;
            Caption = '<담당자>';
        }
        modify("Sales (LCY)")
        {
            Visible = false;
        }
        modify("Payments (LCY)")
        {
            Visible = false;
        }
        addafter("Salesperson Code")
        {
            field("Search Name2"; Rec."Search Name2")
            {
                ApplicationArea = All;
                ShowCaption = true;
                Caption = '영문명';
            }
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
                ShowCaption = true;
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                ShowCaption = true;
            }
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
                ShowCaption = true;
            }
        }
        moveafter(Name; "Credit Limit (LCY)", "Salesperson Code")
        moveafter("VAT Registration No."; "Balance (LCY)")
        addafter("Balance (LCY)")
        {
            field("Net Change (LCY)"; Rec."Net Change (LCY)")
            {
                ApplicationArea = All;
                ShowCaption = true;
            }
        }
        moveafter("Net Change (LCY)"; "Balance Due (LCY)")

        moveafter("Balance Due (LCY)"; "Responsibility Center", "Location Code", "Phone No.", Contact)
        addafter(Contact)
        {
            field("Business Level"; Rec."Business Level")
            {
                ApplicationArea = All;
                ShowCaption = true;
                Caption = '1차점 업계';
            }
            field("Business End User"; Rec."Business End User")
            {
                ApplicationArea = All;
                ShowCaption = true;
                Caption = 'END USER 업계';
            }
            field(Note; Rec.Note)
            {
                ApplicationArea = All;
                ShowCaption = true;
                Caption = '비고';
            }
        }
    }
}
