% Program:
%  Author:
%    Date:  Feb 2016
% Purpose:

% Write a Turing program that will use a binary search to check if a name read
% from the keyboard, which is 10 characters or less, is included in the sorted file, "names.srt".
% 
% You will have to read this file into a string array.  The array is dynamically declared so that it contains
% exactly the number of elements to store each name from the file.  Use array function 'upper' in the subprograms.
% Save as binsrch.t   Then search the array for a name.  Display either of the following messages:
% "Eric is at position 121" or "Eric is not in the list".  Include calls to the following subprograms:

fcn getNumberOfNames (FileName : string) : int
    % purpose: opens file FileName and count the number of names in the file
    %           USE LINE ORIENTED INPUT (  :*  )

    % insert function here
    var NameCount : int := 0

    % Declare file stream and open file Names.srt
    var stream : int
    open : stream, FileName, get

    if stream > 0 then % the file was successfully opened
	var NameInFile : string

	loop
	    get : stream, skip
	    exit when eof (stream)
	    get : stream, NameInFile : *
	    NameCount += 1
	end loop

	close : stream

    else % File Names.srt could not be opened

	put "\n  Unable to open file - ", FileName, " - Press any key to continue.... " ..
	var anyKey : string (1)
	getch (anyKey)

    end if

    result NameCount

end getNumberOfNames


procedure loadArrayFromFile (spFileName : string, var spNamesArray : array 1 .. * of string (10))

    %purpose: reads names from spFileName (text file) and returns the number
    %         of names in the file in ipNumNames; and an array of the names in
    %           spNamesArray

    % insert procedure body here

    % insert function here
    var NameCount : int := 0

    % Declare file stream and open file Names.srt
    var stream : int
    open : stream, spFileName, get

    if stream > 0 then % the file was successfully opened
	var NameInFile : string

	loop
	    get : stream, skip
	    exit when eof (stream)
	    get : stream, NameInFile : *
	    NameCount += 1

	    spNamesArray (NameCount) := NameInFile % ==== Load array ====

	end loop

	close : stream

    else % File Names.srt could not be opened

	put "\n  Unable to open file - ", spFileName, " - Press any key to continue.... " ..
	var anyKey : string (1)
	getch (anyKey)

    end if


end loadArrayFromFile

function binSearch (spSearchArray : array 1 .. * of string (10), spSearchName : string (10)) : int

    % purpose: uses a binary search to locate spSearchName in spSearchArray having
    %          ipNumNames names; returns the subscript if found or zero if not
    %          found

    % insert function body here
    var nameIsFound : boolean := false
    var Low : int := 1
    var High : int := upper (spSearchArray)
    var Mid : int

    loop
	exit when nameIsFound or Low > High % not found

	% Calculate a mid position in the list (array) give the current Low and High positions
	Mid := (Low + High) div 2


	if spSearchArray (Mid) > spSearchName then
	    High := Mid - 1  % The search name is lower
	elsif spSearchArray (Mid) < spSearchName then
	    Low := Mid + 1 % The search name is higher
	else
	    nameIsFound := true  % the search name is found in spSearchArray(Mid) ie it is element Mid
	end if


    end loop

    %  Was it found?
    if nameIsFound then
	result Mid
    else
	result 0
    end if
end binSearch



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Main Program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get number of names from file
const FileName := "Names.srt"
var NumOfNames : int := getNumberOfNames (FileName)

% DYNAMICALLY declare an array to hold all the names from the file
var SearchArray : array 1 .. NumOfNames of string (10)

% load the array from the file
loadArrayFromFile (FileName, SearchArray)


var Name : string
var pos : int
loop
    put "Enter Name  (Q or q to quit): " ..
    get Name : *
    exit when Name = "Q" or Name = "q"

    pos := binSearch (SearchArray, Name)

    
    if pos > 0 then
	put Name, " is located in position ", pos
    else
	put Name, " not found!"
    end if

    put "\n\n=========================================="
end loop
