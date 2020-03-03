codeunit 50100 "Item Subscribers AJK"
{
    SingleInstance = true;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnDelete(var Rec: Record Item)
    begin
        Rec.DeleteItemExtraFields();
    end;
}