-- Author: Spencer Hirsch, shirsch2020@my.fit.edu, Ty Gutowski, 
--    tgutowski@my.fit.edu
-- Course: CSE 4250, Fall 2022
-- Project: Project 3, Can you hear me now?

WITH ADA.CONTAINERS.DOUBLY_LINKED_LISTS;
WITH ADA.CONTAINERS.VECTORS;
WITH ADA.STRINGS.UNBOUNDED; USE ADA.STRINGS.UNBOUNDED;

--generic
--    type Node is range <>;
--package Graph is
--    type Cell_Towers is new Ada.Containers.Doubly_Linked_Lists;
--    type Tower is record
--        To : Node;
--        From : Node;
--    end record;
--    package Node_Maps is new Vectors (Node, Node);
--    package Adjacency_List is new Doubly_Linked_Lists (Tower);
--    use Adjacency_Lists;
--    package Graphs is new Vectors (Node, Adjacency_Lists.List);
--    package Paths is new Doubly_Linked_Lists (Node);
-- end Graph;



PROCEDURE GRAPH_INTERSECTION(INITIAL : STRING; CONNECTED : STRING; DETERMINANT : STRING) IS
    package Links is new Ada.Conatiners.Doubly_Linked_Lists(String);
    use Links;
    
    TYPE TOWERS IS RECORD
        SOURCE : STRING;
        LINK : LINKS;
    END RECORD;

    package Tower_List is new Ada.Conatiners.Doubly_Linked_Lists(Towers);
    use Tower_List;

    Adj_List : List;
    TOWER : TOWER;

    FUNCTION CONNECTION_EXISTS(INITIAL : STRING; CONNECTED ; STRING) IS
        DOES_EXIST : BOOLEAN;
    BEGIN
        -- SEARCH THE STRUCTURE TO SEE IF THE CONNECTION EXISTS
        RETURN DOES_EXIST;
    END CONNECTION_EXISTS;

    PROCEDURE OUTPUT(INITIAL : STRING; CONNECTED : STRING) IS
        DOES_EXIST : BOOLEAN;
        OUTPUT_STRING : STRING := INITIAL & " " & CONNECTED;  
    BEGIN
        DOES_EXIST := CONNECTION_EXISTS(INITIAL, CONNECTED);
        IF DOES_COMMENT_EXIST THEN
            ADA.TEXT_IO.PUT_LINE("+ " & NATURAL'IMAGE(OUTPUT_STRING));
        ELSE
            ADA.TEXT_IO.PUT_LINE("- " & NATURAL'IMAGE(OUTPUT_STRING));
        END IF;
    END OUTPUT;
    
BEGIN
    
END GRAPH_INTERSECTION;

-- Need to create a function that determines if the values will be stored in the graph
-- Need to create a function that determines if the input is a query of wether or not the
-- the connection is valid.
    
