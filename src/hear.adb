with Ada.Text_IO;
with Ada.Strings;
with Ada.Integer_Text_IO;
-- with Ada.Strings.Fixed;
--with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Hear is
    function Count (Input : String) return Natural is
        Number_Of_Space : Integer;
    begin
        for I in Input'Range loop
            if Input(I) = ' ' then
                Number_Of_Space := Number_Of_Space + 1;
            end if;
        end loop;
        return Number_Of_Space;
    end Count;

    function No_Space (Input : String ; White : Integer) return String is
        New_String : String(1..Input'Length - White);
        Index : Integer := 1;
    begin
        for I in Input'Range loop
            if Input(I) /= ' ' then
                New_String(Index) := Input(I);
                Index := Index + 1;
            end if;
        end loop;
        return New_String;
    end No_Space;

    --Input : Unbounded_String;
    Input : String(1..80);
    Last : Natural;
    Forever: Boolean := True;
    -- Cnt : Natural;
    Last_Index : Integer;
    New_String : String(1..Input'Length);
    Spaces : Integer;
begin
    while Forever loop
        -- Cnt := Ada.Strings.Fixed.Count;
        Ada.Text_IO.Get_Line(Item => Input, Last => Last);
        Spaces := Count(Input => Input);
        New_String := No_Space(Input => Input, White => Spaces);
        --for I in Input'Range loop
        --    X := Input(I);
        --    if X = ' ';

        --    end if;
        --end loop;

        Last_Index := Input'Length;
        -- Ada.Integer_Text_IO.Put(Last_Index);
        if Input(Last_Index - 1) = '.' then
            -- Add structure to Graph
            --Ada.Text_IO.Put_Line(Input(Last_Index));
            Ada.Text_IO.Put_Line(".");
        elsif Input(Last_Index - 1) = '?' then
            -- Call function to check for link
            -- Ada.Text_IO.Put_Line(Input(Last_Index));
            Ada.Text_IO.Put_Line("?");
        else
            Ada.Text_IO.Put_Line("Invalid Input");
        end if;
    end loop;
end Hear;


            
        
