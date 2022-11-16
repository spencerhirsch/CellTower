-- Authors: Spencer Hirsch, shirsch2020@my.fit.edu
--          Tyler Gutowski, tgutowski2020@my.fit.edu
-- Course:  CSE 4250, Fall 2022
-- Project: Project 3, Can you HEAR me now?

WITH ADA.TEXT_IO;
WITH ADA.STRINGS;
WITH ADA.STRINGS.FIXED;
WITH ADA.INTEGER_TEXT_IO;
WITH ADA.CONTAINERS.DOUBLY_LINKED_LISTS;
--WITH GRAPH;

PROCEDURE HEAR IS
TYPE TOWERS;
TYPE TOWERS_ACCESS IS ACCESS TOWERS; -- REFERNCE TO THE TYPE. WORK AROUND TO SAY WE HAVE DOUBLY LINKED LIST TO TYPE

PACKAGE LINKS IS NEW ADA.CONTAINERS.DOUBLY_LINKED_LISTS(TOWERS_ACCESS);
USE LINKS;

TYPE TOWERS IS RECORD
	SOURCE : STRING(1..150); -- NEED TO IMPLEMENT SIZE OF THE STRING
	--PACKAGE CONNECTED IS NEW ADA.CONTAINERS.DOUBLY_LINKED_LISTS(STRING);
	--USE CONNECTED;
	LINK : LIST;
END RECORD;


SOURCES : LIST;
--USE GRAPH;
SUBTYPE POSITION IS INTEGER RANGE 0 .. 150;

	--PROCEDURE FIND_TOWER(TOWER_FIRST_NAME : STRING; TOWER_SECOND_NAME : STRING) IS
	--IF SOURCES.CONTAINS(TOWER_FIRST_NAME) THEN


	--BEGIN

	--END FIND_TOWER;

    -- ########################################################################
    -- OUTPUTS PARSED STRING TO COMMAND LINE

	-- FUNCTION USED TO CHECK TO SEE IF A SOURCE TOWER IS FOUND WITHIN THE SOURCES LIST
	PROCEDURE FIND_SOURCE (TOWER_FIRST_NAME) IS
	BEGIN
		CURRENT := SOURCES.FIRST_ELEMENT();
		FOR I IN RANGE 0..SOURCES.LENGTH(TOWER_ACCESS) LOOP
			IF CURRENT.SOURCE == TOWER_FIRST_NAME THEN
				-- ELEMENT FOUND
			ELSE
				CURRENT := SOURCES.ELEMENT(I);
			END IF;
		END LOOP;
	END FIND_SOURCE;

    PROCEDURE PROCESS_STRING( TOWER_FIRST_NAME : STRING; TOWER_SECOND_NAME : STRING; COMMAND : CHARACTER ) IS
	TOWER_SOURCE : TOWERS_ACCESS := NEW TOWERS;
	TOWER_CONNECTED : TOWERS_ACCESS := NEW TOWERS;
	SOURCE : INTEGER;
	BEGIN
		IF COMMAND = '.' THEN

			TOWER_SOURCE.SOURCE := TOWER_FIRST_NAME;

		    IF SOURCES.CONTAINS(TOWER_SOURCE.SOURCE) THEN

				TOWER_CONNECTED.SOURCE(TOWER_SECOND_NAME);
				IF SOURCES.CONTAIN(TOWER_CONNECTED.SOURCE) THEN
					-- COPY ELEMENTS FROM EXISTING TOWER INTO CONNECTED
					-- APPEND CONNECTED TO TOWER_SOURCE LIST
					-- UPDATE TOWER_SOURCE IN LIST
				CURSOR := SOURCES.FIND(TOWER_SOURCE.SOURCE);

				TOWER_CONNECTED.SOURCE := TOWER_SECOND_NAME;
				TOWER_CONNECTED.LINK.APPEND(TOWER);
				ELSE
					TOWER_SOURCE.APPEND(TOWER_CONNECTED);
					-- UPDATE ELEMENT IN SOURCES LIST
				END IF;
			ELSE
				--ADA.TEXT_IO.PUT_LINE("LINK  : " & TOWER_FIRST_NAME & " TO " & TOWER_SECOND_NAME);
				--TOWER_SOURCE.SOURCE := TOWER_FIRST_NAME;
				--TOWER_CONNECTED.SOURCE := TOWER_SECOND_NAME;
				--TOWER_SOURCE.LINK.APPEND(TOWER_CONNECTED);
				TOWER_SOURCE.SOURCE(TOWER_FIRST_NAME);
				TOWER_CONNECTED.SOURCE(TOWER_SECOND_NAME);
				IF SOURCES.CONTAINS(TOWER_CONNECTED.SOURCE) THEN
					-- COPY INFO FROM ELEMENT
					-- APPEND INFO TO TOWER_CONNECTED LIST
					--TOWER_SOURCE.LINK.APPEND(TOWER_SECOND_NAME);
					SOURCES.APPEND(TOWER_SOURCE);
				ELSE
					TOWER_SOURCE.APPEND(TOWER_CONNECTED);
					-- UPDATE ELEMENT IN SOURCES LIST
				END IF;
			END IF;
			--GRAPH.ADD(TOWER_FIRST_NAME, TOWER_SECOND_NAME);
		ELSIF COMMAND = '?' THEN
			ADA.TEXT_IO.PUT_LINE("QUERY : " & TOWER_FIRST_NAME & " TO " & TOWER_SECOND_NAME);
			--IF SOURCES.CONTAINS(TOWER_FIRST_NAME) THEN

			--ELSE
				-- OUTPUT FALSE CONNECTION
			--END IF;
			--GRAPH.OUTPUT(TOWER_FIRST_NAME, TOWER_SECOND_NAME);
		END IF;
    END PROCESS_STRING;


    -- ########################################################################
    -- RETURNS THE INDEX OF WHERE A TOWER STARTS
	FUNCTION GET_TOWER_START( INPUT : STRING; START_INDEX : POSITION) RETURN INTEGER IS
	BEGIN
		FOR I IN START_INDEX..150 LOOP
			IF INPUT(I) /= ' ' THEN
				RETURN I;
			END IF;
		END LOOP;
	RETURN 0;
	END GET_TOWER_START;
	
	
    -- ########################################################################
    -- RETURNS THE INDEX OF WHERE A TOWER ENDS
	FUNCTION GET_TOWER_END( INPUT : STRING; START_INDEX : POSITION) RETURN INTEGER IS
	BEGIN
		FOR I IN START_INDEX..150 LOOP
			IF INPUT(I) = ' ' THEN
				RETURN (I - 1);
			ELSIF INPUT(I) = '.' THEN
				RETURN (I - 1);
			ELSIF INPUT(I) = '?' THEN
				RETURN (I - 1);
			END IF;
		END LOOP;
	RETURN 0;
	END GET_TOWER_END;


    -- ########################################################################
    -- RETURNS THE INDEX OF A ? OR A ., IF IT EXISTS. IF IT DOESNT EXIST, RETURN 0
	FUNCTION GET_COMMAND_POSITION( INPUT : STRING; START_INDEX : POSITION; END_INDEX : INTEGER) RETURN INTEGER IS
	BEGIN
		FOR I IN START_INDEX..END_INDEX LOOP
			IF INPUT(I) = '.' THEN
				RETURN (I);
			ELSIF INPUT(I) = '?' THEN
				RETURN (I);
			ELSIF INPUT(I) = '#' THEN
				RETURN 0;
			END IF;
		END LOOP;
	RETURN 0;
	END GET_COMMAND_POSITION;


	-- ########################################################################
    -- RETURNS CHARACTER AT AN INDEX
	FUNCTION GET_CHAR_AT_INDEX( INPUT : STRING; INDEX : POSITION) RETURN CHARACTER IS
	BEGIN
		RETURN INPUT(INDEX);
	END GET_CHAR_AT_INDEX;
	
	
	FUNCTION GET_TOWER_NAME( INPUT : STRING; START_INDEX : POSITION; END_INDEX : POSITION ) RETURN STRING IS
	TOWER_NAME : STRING(1..(END_INDEX - START_INDEX + 1));
	BEGIN
		TOWER_NAME := INPUT(START_INDEX..END_INDEX);
		RETURN TOWER_NAME;
	END GET_TOWER_NAME;

IS_VALID_INPUT     : BOOLEAN                 := TRUE;
LAST               : NATURAL;
FOREVER            : BOOLEAN                 := TRUE;
ARRAY_SIZE         : INTEGER                 := 150;
INPUT              : STRING(1..ARRAY_SIZE);
TOWER_FIRST_START  : POSITION; -- A
TOWER_FIRST_END    : POSITION; -- B
TOWER_SECOND_START : POSITION; -- C
TOWER_SECOND_END   : POSITION; -- D
COMMAND_INDEX      : POSITION; -- E

COMMAND            : CHARACTER;
BEGIN
    WHILE FOREVER LOOP
		IS_VALID_INPUT := TRUE;
        ADA.TEXT_IO.GET_LINE(ITEM => INPUT, LAST => LAST); -- Get input
		
		TOWER_FIRST_START := GET_TOWER_START(INPUT, 1);
		TOWER_FIRST_END := GET_TOWER_END(INPUT, TOWER_FIRST_START);
		TOWER_SECOND_START := GET_TOWER_START(INPUT, TOWER_FIRST_END + 1);
		TOWER_SECOND_END := GET_TOWER_END(INPUT, TOWER_SECOND_START);
		COMMAND_INDEX := GET_COMMAND_POSITION(INPUT, TOWER_SECOND_END + 1, 150);
		
		IF COMMAND_INDEX /= 0 THEN
			COMMAND := GET_CHAR_AT_INDEX(INPUT, COMMAND_INDEX);
		ELSE
			IS_VALID_INPUT := FALSE;
		END IF;
		
		IF IS_VALID_INPUT THEN
			PROCESS_STRING(GET_TOWER_NAME(INPUT,TOWER_FIRST_START,TOWER_FIRST_END),
						   GET_TOWER_NAME(INPUT,TOWER_SECOND_START,TOWER_SECOND_END),
						   COMMAND);
		END IF;
    END LOOP;
END HEAR;
