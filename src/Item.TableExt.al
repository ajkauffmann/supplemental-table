tableextension 50100 "Item AJK" extends Item
{
    fields
    {
        field(50100; "Perishable AJK"; Boolean)
        {
            Caption = 'Perishable';
            FieldClass = FlowField;
            CalcFormula = lookup ("Item Extra Fields AJK".Perishable where(Id = field(SystemId)));
        }
        field(50101; "Food Category AJK"; Enum FoodCategory)
        {
            Caption = 'Food Category';
            FieldClass = FlowField;
            CalcFormula = lookup ("Item Extra Fields AJK"."Food Category" where(Id = field(SystemId)));
        }
        field(50102; "Storage Temperature AJK"; Decimal)
        {
            Caption = 'Storage Temperature';
            FieldClass = FlowField;
            CalcFormula = lookup ("Item Extra Fields AJK"."Storage Temperature" where(Id = field(SystemId)));
        }
    }

    var
        _ItemExtraFields: Record "Item Extra Fields AJK";

    procedure GetItemExtraFields(var ItemExtraFields: Record "Item Extra Fields AJK")
    begin
        ReadItemExtraFields();
        ItemExtraFields := _ItemExtraFields;
    end;

    procedure SetItemExtraFields(var ItemExtraFields: Record "Item Extra Fields AJK")
    begin
        _ItemExtraFields := ItemExtraFields;
    end;

    procedure SaveItemExtraFields()
    begin
        if not IsNullGuid(_ItemExtraFields.Id) then
            if not _ItemExtraFields.Modify() then
                _ItemExtraFields.Insert(false, true);
    end;

    procedure DeleteItemExtraFields()
    begin
        ReadItemExtraFields();
        if _ItemExtraFields.Delete() then;
    end;

    local procedure ReadItemExtraFields()
    begin
        if _ItemExtraFields.Id <> SystemId then
            if not _ItemExtraFields.Get(SystemId) then begin
                _ItemExtraFields.Init();
                _ItemExtraFields.Id := SystemId;
                _ItemExtraFields.SystemId := SystemId;
            end;
    end;
}