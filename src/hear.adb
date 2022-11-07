with Ada.Text_IO;

procedure Main is
    Input : String(1 ... 80);
    Last : Natural;
    Forever: Boolean;
    begin
        Forever = True;
        while Forever loop
            Ada.Text_IO.Get_Line(Input, Last)
            for i in 1 ... Length(Input) loop
                if Element (Input, i) = '.' then
                 -- process accordingly
                elsif Element (Input, i) = '?' then
                    -- process accordingly
                else then
                    Ada.Text_IO.Put_Line("Invalid Input.");
                    break;
                
        end loop;


            
        
