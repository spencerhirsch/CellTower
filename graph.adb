-- Author: Spencer Hirsch, shirsch2020@my.fit.edu, Ty Gutowski, 
--    tgutowski@my.fit.edu
-- Course: CSE 4250, Fall 2022
-- Project: Project 3, Can you hear me now?

with Ada.Containers.Doubly_Linked_Lists;
with Ada.Containers.Vectors;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

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



procedure Graph_Insertion(Initial : String; Connected : String; Determinant : String) is
    package Links is new Ada.Conatiners.Doubly_Linked_Lists(String);
    use Links;
    
    type Towers is record
        To : String;
        Link : Links;
    end record;

    package Tower_List is new Ada.Conatiners.Doubly_Linked_Lists(Towers);
    use Tower_List;

    Adj_List : List;
    Tower : Tower;
begin
    
end Graph_Insertion;
    
