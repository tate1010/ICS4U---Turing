% Program: Check name
%  Author: Tate Cheng
%    Date:2/2/2016
% Purpose:Check for the name in file

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


    var Name : string
    var count : int
    count := getNumberOfNames (spFileName)
    % insert procedure body here
    var stream : int
    open : stream, spFileName, get



    if stream > 0 then

	for i : 1 .. count
	    get : stream, skip
	    exit when eof (stream)

	    get : stream, Name : *
	    spNamesArray (i) := Name

	end for

	close : stream

    else
	put "\n  Unable to load name into array 2- ", spFileName, " - Press any key to continue.... " ..
	var anyKey : string (1)
	getch (anyKey)

    end if

end loadArrayFromFile

function binSearch (spSearchArray : array 1 .. * of string (10), spSearchName : string (10), low : int, high : int) : int

    % purpose: uses a binary search to locate spSearchName in spSearchArray having
    %          ipNumNames names; returns the subscript if found or zero if not
    %          found



    var mid : int

    if high < low then
	result 0
    elsif high > low then
	result 0
    else
	mid := (high + low) div 2




	if spSearchName = spSearchArray (mid) then
	    result mid
	elsif spSearchName < spSearchArray (mid) then
	    result binSearch (spSearchArray , spSearchName, low, mid - 1 ) 

	elsif spSearchName > spSearchArray (mid) then
	    result binSearch (spSearchArray, spSearchName, mid - 1, high) 

	end if

    end if



    % insert function body here

end binSearch



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Main Program
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get number of names from text file
const FileName := "Names.srt"
var NumOfNames : int := getNumberOfNames (FileName)


if NumOfNames >= 1 then

    % DYNAMICALLY declare an array to hold all the names from the file
    var SearchArray : array 1 .. NumOfNames of string (10)

    % load the array with the names from the file
    loadArrayFromFile (FileName, SearchArray)


    var Name : string
    var pos : int

    loop
	put "Enter Name  (Q or q to quit): " ..
	get Name : *
	exit when Name = "Q" or Name = "q"

	pos := binSearch (SearchArray, Name, 1, NumOfNames)

	if pos > 0 then
	    put Name, " is located in position ", pos
	else
	    put Name, " not found!"
	end if

	put "\n\n=========================================="
    end loop
else

    put "\n      Unable to load names into array.  "

end if
