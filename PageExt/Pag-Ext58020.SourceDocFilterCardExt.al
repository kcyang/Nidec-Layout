pageextension 58020 SourceDocFilterCardExt extends "Source Document Filter Card"
{
    actions
    {
        modify(Run)
        {
            Visible = false;
        }

        addfirst(processing)
        {
            action(NewRun)
            {
                ApplicationArea = Warehouse;
                Caption = '실행';
                Image = Start;
                ToolTip = 'Get the specified source documents.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    GetSourceBatch: Report "Get Source Documents";
                begin
                    Rec."Planned Delivery Date" := CopyStr(Rec.GetFilter("Planned Delivery Date Filter"), 1, MaxStrLen(Rec."Planned Delivery Date"));
                    Rec."Planned Shipment Date" := CopyStr(Rec.GetFilter("Planned Shipment Date Filter"), 1, MaxStrLen(Rec."Planned Shipment Date"));
                    Rec."Sales Shipment Date" := CopyStr(Rec.GetFilter("Sales Shipment Date Filter"), 1, MaxStrLen(Rec."Sales Shipment Date"));
                    Rec."Planned Receipt Date" := CopyStr(Rec.GetFilter("Planned Receipt Date Filter"), 1, MaxStrLen(Rec."Planned Receipt Date"));
                    Rec."Expected Receipt Date" := CopyStr(Rec.GetFilter("Expected Receipt Date Filter"), 1, MaxStrLen(Rec."Expected Receipt Date"));
                    Rec."Shipment Date" := CopyStr(Rec.GetFilter("Shipment Date Filter"), 1, MaxStrLen(Rec."Shipment Date"));
                    Rec."Receipt Date" := CopyStr(Rec.GetFilter("Receipt Date Filter"), 1, MaxStrLen(Rec."Receipt Date"));

                    case RequestType of
                        RequestType::Receive:
                            begin
                                GetSourceBatch.SetOneCreatedReceiptHeader(WhseReceiptHeader);
                                Rec.SetFilters(GetSourceBatch, WhseReceiptHeader."Location Code");
                            end;
                        RequestType::Ship:
                            begin
                                GetSourceBatch.SetOneCreatedShptHeader(WhseShptHeader);
                                //Rec.SetFilters(GetSourceBatch, WhseShptHeader."Location Code");
                                Rec.SetFilters(GetSourceBatch, '');
                            end;
                    end;

                    GetSourceBatch.UseRequestPage(Rec."Show Filter Request");
                    GetSourceBatch.RunModal();
                    if GetSourceBatch.NotCancelled() then
                        CurrPage.Close();
                end;
            }
        }
    }
}
