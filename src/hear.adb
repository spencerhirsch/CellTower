-- Author: Spencer Hirsch, shirsch2020@my.fit.edu, Ty Gutowski, 
--    tgutowski@my.fit.edu
-- Course: CSE 4250, Fall 2022
-- Project: Project 3, Can you hear me now?

with Ada.Text_IO;
with Ada.Strings;
with Ada.Integer_Text_IO;

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

    procedure String_Process(New_String : String) is
    Last_Index : Integer := New_String'Length;
    begin
        if New_String(Last_Index - 1) = '.' then
            -- Add structure to Graph
            --Ada.Text_IO.Put_Line(New_String(Last_Index));
            Ada.Text_IO.Put_Line(".");
        elsif New_String(Last_Index - 1) = '?' then
            -- Call function to check for link
            --Ada.Text_IO.Put_Line(New_String(Last_Index));
            Ada.Text_IO.Put_Line("?");
        else
            Ada.Text_IO.Put_Line("Invalid Input");
        end if;
    end String_Process;

    Input : String(1..80);
    Last : Natural;
    Forever: Boolean := True;
    Spaces : Integer;
begin
    while Forever loop
        Ada.Text_IO.Get_Line(Item => Input, Last => Last);
        Spaces := Count(Input => Input);
        -- Call new procedure to process string
        --New_String := No_Space(Input => Input, White => Spaces);
        String_Process(No_Space(Input => Input, White => Spaces));
    end loop;
end Hear;


