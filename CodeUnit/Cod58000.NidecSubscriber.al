codeunit 58000 NidecSubscriber
{
    [EventSubscriber(ObjectType::Table, 5771, 'OnSetFiltersOnSourceTables', '', false, false)]
    local procedure OnSetFiltersOnSourceTables(var WarehouseSourceFilter: Record "Warehouse Source Filter"; var GetSourceDocuments: Report "Get Source Documents"; var WarehouseRequest: Record "Warehouse Request")
    begin
        WarehouseRequest.SetRange("Location Code");  // This clears the filter for Location Code
    end;
}
