pageextension 50100 "Item List AJK" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Perishable AJK"; "Perishable AJK") { ApplicationArea = All; }
            field("Food Category AJK"; "Food Category AJK") { ApplicationArea = All; }
        }
    }
}