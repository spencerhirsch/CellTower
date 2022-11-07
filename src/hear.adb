with Ada.Text_IO;
with Ada.Strings;
with Ada.Integer_Text_IO;
-- with Ada.Strings.Fixed;
--with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Hear is
    --Input : Unbounded_String;
    Input : String(1..80);
    Last : Natural;
    Forever: Boolean := True;
    -- Cnt : Natural;
    Last_Index : Integer;
begin
    while Forever loop
        -- Cnt := Ada.Strings.Fixed.Count;
        Ada.Text_IO.Get_Line(Item => Input, Last => Last);
        -- Ada.Strings.Fixed.Trim(Source => Input);
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


            
        
