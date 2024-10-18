pageextension 58031 PostedWhseShipmentCustom extends "Posted Whse. Shipment"
{
    layout
    {
        addlast(General)
        {
            field("Receipt Confirm"; Rec."Receipt Confirm")
            {
                Style = Unfavorable;
                Caption = '납품확인';
            }
        }
    }
}
