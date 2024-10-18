pageextension 58033 PostedWhseShipListCustom extends "Posted Whse. Shipment List"
{
    layout
    {
        addfirst(Control1)
        {
            field("Receipt Confirm"; Rec."Receipt Confirm")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Whse. Shipment No.")
        {
            field("Sell-to Customer No."; Rec."Sell-to Customer No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(CustomerName; CustomerName)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = '판매처명';
            }

        }

        modify("No.")
        {
            trigger OnDrillDown()
            var
                PWSH: Record "Posted Whse. Shipment Header";
                CardPage: Page "Posted Whse. Shipment";
            begin
                PWSH := Rec;
                CardPage.SetRecord(PWSH);
                CardPage.Run();
            end;
        }
    }

    trigger OnAfterGetRecord()
    begin
        // TECKR
        RecCustomer.RESET;
        IF RecCustomer.GET(Rec."Sell-to Customer No.") THEN
            "CustomerName" := RecCustomer.Name;
        // TECKR        
    end;

    var
        RecCustomer: Record Customer;
        CustomerName: Text[100];
}
