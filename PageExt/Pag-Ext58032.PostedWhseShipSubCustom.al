pageextension 58032 PostedWhseShipSubCustom extends "Posted Whse. Shipment Subform"
{
    layout
    {
        addfirst(Control1)
        {
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(CustomerName; CustomerName)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

    }

    trigger OnAfterGetRecord()
    begin
        // TECKR
        RecCustomer.RESET;
        IF RecCustomer.GET(Rec."Destination No.") THEN
            "CustomerName" := RecCustomer.Name;
        // TECKR        
    end;

    var
        RecCustomer: Record Customer;
        CustomerName: Text[100];
}
