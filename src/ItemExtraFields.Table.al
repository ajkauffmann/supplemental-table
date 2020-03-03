table 50100 "Item Extra Fields AJK"
{
    fields
    {
        field(1; Id; Guid)
        {
        }
        field(2; "Item No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup (Item."No." where(SystemId = field(id)));
        }
        field(3; "Perishable"; Boolean)
        {
            trigger OnValidate()
            begin
                if Perishable then
                    "Storage Temperature" := 4
                else
                    "Storage Temperature" := 0;
            end;
        }
        field(4; "Food Category"; Enum FoodCategory)
        {
        }
        field(5; "Storage Temperature"; Decimal)
        {
        }
    }

    keys
    {
        key(PK; Id) { }
    }
}