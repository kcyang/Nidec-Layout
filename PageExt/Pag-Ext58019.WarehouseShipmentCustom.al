pageextension 58019 WarehouseShipmentCustom extends "Warehouse Shipment"
{
    actions
    {
        modify("Post and &Print")
        {
            Visible = false;
        }
        modify("Use Filters to Get Src. Docs.")
        {
            Visible = false;
        }
        addfirst(processing)
        {
            action("NDUse Filters to Get Src. Docs.")
            {
                ApplicationArea = Warehouse;
                Caption = '소스문서 불러낼필터사용';
                Ellipsis = true;
                Image = UseFilters;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    GetOutboundDocs(Rec);
                end;
            }
        }
    }

    local procedure GetOutboundDocs(var WhseShptHeader: Record "Warehouse Shipment Header")
    var
        WhseGetSourceFilter: Record "Warehouse Source Filter";
        WhseSourceFilterSelection: Page "NDFilters to Get Source Docs.";
    begin
        WhseShptHeader.Find();
        WhseSourceFilterSelection.SetOneCreatedShptHeader(WhseShptHeader);
        WhseGetSourceFilter.FilterGroup(2);
        WhseGetSourceFilter.SetRange(Type, WhseGetSourceFilter.Type::Outbound);
        WhseGetSourceFilter.FilterGroup(0);
        WhseSourceFilterSelection.SetTableView(WhseGetSourceFilter);
        WhseSourceFilterSelection.RunModal();
        UpdateShipmentHeaderStatus(WhseShptHeader);
    end;

    local procedure UpdateShipmentHeaderStatus(var WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        if WarehouseShipmentHeader.Find() then begin
            WarehouseShipmentHeader."Document Status" := WarehouseShipmentHeader.GetDocumentStatus(0);
            WarehouseShipmentHeader.Modify();
        end;
    end;
}
