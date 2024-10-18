pageextension 58021 WhseShipmentSubExt extends "Whse. Shipment Subform"
{
    layout
    {
        modify("Location Code")
        {
            Visible = true;
        }
        movefirst(Control1; "Location Code")
        addafter("Source Document")
        {
            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = All;
                Caption = '부가세 제품전기그룹';
            }
        }
        addafter("Source No.")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
                Caption = '주문일자';
            }
            field("External doc. No."; Rec."External doc. No.")
            {
                ApplicationArea = All;
                Caption = '외부문서 번호';
            }
        }
        modify("Destination No.")
        {
            Visible = true;
        }
        moveafter("External doc. No."; "Destination No.")
        addafter(Description)
        {
            field("Unit Price"; Rec."Unit Price")
            {
                ApplicationArea = All;
                Caption = '단가';
            }
        }

    }
}
