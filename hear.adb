-- Authors: Spencer Hirsch, shirsch2020@my.fit.edu
--          Tyler Gutowski, tgutowski2020@my.fit.edu
-- Course:  CSE 4250, Fall 2022
-- Project: Project 3, Can you hear me now?

with Ada.Text_IO;
with Ada.Strings;
with Ada.Integer_Text_IO;

procedure Hear is

    -- ########################################################################
    -- Function to return total number of spaces in a string.
    function Count (Input : String) return Natural is -- Returns integer [1, inf)
        Number_Of_Space : Integer := 0;
    begin
        for I in Input'Range loop -- For each character in Input
            if Input(I) = ' ' then -- If its a space, increase word count
                Number_Of_Space := Number_Of_Space + 1;
            end if;
        end loop;
        return Number_Of_Space; -- Returns number of spaces
    end Count;

    -- ########################################################################
    -- Function to remove all spaces from a string
    function No_Space (Input : String ; White : Integer) return String is -- Returns a string
        New_String : String(1..Input'Length - White);
        Index : Integer := 1;
    begin
        for I in Input'Range loop -- For each character in Input
            if Input(I) /= ' ' then -- If the character is not a space
                New_String(Index) := Input(I); -- Add the character to New_String
                Index := Index + 1;
            end if;
        end loop;
        return New_String; -- Returns the string without spaces
    end No_Space;

    -- ########################################################################
    -- Function to remove comments from a string.
    function Fuck_Comments (Input : String ; Comment : Integer) return String is
        New_String : String(1..Input'Length - Comment) := "";
        Index : Integer := 1;
    begin
        for I in Input'Range loop -- For each character in Input
            if Input(I) = '#' then
                ada.Text_IO.Put_Line("THERE IS COMMENT!");
            end if;
        end loop;
        return New_String;
    end Fuck_Comments;

    -- ########################################################################
    -- Procedure to process strings
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

    -- ########################################################################
    -- Loop for user input
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