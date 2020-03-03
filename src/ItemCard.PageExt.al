pageextension 50101 "Item Card AJK" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group(FoodDetails)
            {
                Caption = 'Food Details';
                field(PerishableAJK; ItemExtraFields.Perishable)
                {
                    Caption = 'Perishable';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        ItemExtraFields.Validate(Perishable);
                        SetItemExtraFields(ItemExtraFields);
                    end;
                }
                field(FoodCategeryAJK; ItemExtraFields."Food Category")
                {
                    Caption = 'Food Category';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        SetItemExtraFields(ItemExtraFields);
                    end;

                }
                field(StorageTemperatureAJK; ItemExtraFields."Storage Temperature")
                {
                    Caption = 'Storage Temperature';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        SetItemExtraFields(ItemExtraFields);
                    end;
                }
            }
        }
    }

    var
        ItemExtraFields: Record "Item Extra Fields AJK";

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        SaveItemExtraFields();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        SaveItemExtraFields();
    end;

    trigger OnClosePage()
    begin
        SaveItemExtraFields();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetItemExtraFields(ItemExtraFields);
    end;
}