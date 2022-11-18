-- Authors: Spencer Hirsch, shirsch2020@my.fit.edu
--          Tyler Gutowski, tgutowski2020@my.fit.edu
-- Course:  CSE 4250, Fall 2022
-- Project: Project 3, Can you HEAR me now?

-- NECESSARY IMPORTS
WITH ADA.TEXT_IO;
WITH ADA.CONTAINERS.DOUBLY_LINKED_LISTS;
WITH ADA.STRINGS.UNBOUNDED;
USE ADA.STRINGS.UNBOUNDED;


-- PRIVATE ATTRIBUTE OF THE GRAPH PACKAGE, LAYS OUT ALL OF THE PROCEDURES
-- AND FUNCTIONS USED IN THE BODY OF THE PACKAGE.

-- INITIALIZES THE LIST AND THE TYPES USED
-- DEFINES THE PARAMETERS PASSED INTO THE FUNCTIONS USED FOR THE GRAPH
PACKAGE GRAPH IS
	ALREADY_PRINTED_DFS: BOOLEAN;				-- DECLARE
	TYPE TOWERS;                                -- DECLARE TYPE
	TYPE TOWERS_ACCESS IS ACCESS TOWERS;        -- REFERNCE TO THE TYPE

	-- INITIALIZE DOUBLY LINKED LIST OF TYPE TOWER_ACCESS
	PACKAGE LINKS IS NEW ADA.CONTAINERS.DOUBLY_LINKED_LISTS(TOWERS_ACCESS);
	USE LINKS;

	-- TYPE THAT STORES THE NECESSARY DATA FOR EACH TOWER
	-- EACH TOWER HAS A SOURCE AND A LIST OF CONNECTING TOWERS
	TYPE TOWERS IS RECORD
    SOURCE : UNBOUNDED_STRING;
    LINK : LIST;                            -- LIST OF TOWER_ACCESS
    CHECKED : BOOLEAN := FALSE;				-- HAS TOWER BEEN CHECKED?
	END RECORD; 

	-- DECLARE LIST WITHIN SCOPE OF MAIN PROCEDURE
	SOURCES : LIST;							-- STORES ALL OF THE SOURCE TOWERS
											-- AND THE TOWERS RECORD FOR EACH

	-- LAYS OUT ALL FUNCTIONS USED IN THE BODY OF THE PACKAGE
	FUNCTION EXISTS_IN_SOURCE (TOWER_FIRST_NAME : STRING) RETURN BOOLEAN;
	-- CHECKS IF TOWER EXISTS IN THE SOURCE LIST

	FUNCTION GET_FROM_SOURCE ( TOWER_FIRST_NAME : STRING ) RETURN TOWERS_ACCESS;
	-- RETRIEVES THE ELEMENT TYPE FROM THE SOURCE LIST

	PROCEDURE DFS (TOWER_FIRST_NAME : STRING; TOWER_SECOND_NAME : STRING; TRUE_TOWER_FIRST_NAME : STRING);
	-- SEARCHES FOR CONNECTIONS IN THE GRAPH, CHECKS DEEPER THAN DIRECT CONNECTIONS

	FUNCTION CHECK_TOWER_LIST(TOWER_FIRST_NAME : STRING; TOWER_SECOND_NAME : STRING) RETURN BOOLEAN;
	-- CHECKS THE LIST OF CONNECTING TOWERS GIVEN A SOURCE, ONLY DIRECT CONNECTIONS.

	FUNCTION CHECK_ALL_POSSIBLE(TOWER_FIRST_NAME : STRING; TOWER_SECOND_NAME : STRING) RETURN BOOLEAN;
	-- CHECKS ALL POSSIBLE CONNECTIONS
	
	PROCEDURE RESET_CHECKED_SOURCES;
END GRAPH;
	

