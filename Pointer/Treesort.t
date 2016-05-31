% % Name: TATE 
% %
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
setscreen ("graphics:800;1200")
var YourFullName : string := "TATE CHENG"
%  File students.rec was written using the following record structure
%  It must be used to input records from the file.
type StudentRecType :
    record
	studentNum : int
	surName : string (10)
	firstName : string (10)
	average : real
    end record

%  A student node type.
%  Must be used for implementing a binary tree.
type StudentNodeType :
    record
	studentNum : int
	surName : string (10)
	firstName : string (10)
	average : real
	ptrLess, ptrGtr : ^StudentNodeType
    end record

%  Declare a root to the list of StudentNodeType
var root : ^StudentNodeType := nil


fcn isEmpty : boolean

    if root = nil then
	result true
    else
	result false
    end if

end isEmpty


% diplays student is alpha order Recursive Method
%
proc RecursiveDisplay (student : ^StudentNodeType)
    if student -> ptrLess not= nil then %if there are more pointers to the left, then keep reading down the left
	RecursiveDisplay (student -> ptrLess)
    end if
    put "Student Number: ", student -> studentNum
    put "Student Surname: ", student -> surName
    put "Student First Name :", student -> firstName
    put "Student Average :", student -> average
    put ""
    if student -> ptrGtr not= nil then
	RecursiveDisplay (student -> ptrGtr) %if there is no more on the left, but there are more on the right, keep reading down the right
    end if
end RecursiveDisplay

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc displayAllTreeRecords %%procedure just to check if the tree is empty
    if isEmpty then
	put "The tree is empty"
    else
	RecursiveDisplay (root)
    end if
end displayAllTreeRecords

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% adds a new record to the tree
% ----requires parameters
proc addNewStudentToTree (var treeRoot : ^StudentNodeType, NewNode : ^StudentNodeType)

    if (isEmpty) then
	% root = nil same as isEmpty
	root := NewNode
    elsif (treeRoot = nil) then
	% treeRoot is nil
	treeRoot := NewNode
    elsif (NewNode -> studentNum < treeRoot -> studentNum) then
	% NewNode -> studentNum < treeRoot -> studentNum
	addNewStudentToTree (treeRoot -> ptrLess, NewNode)
    else
	% NewNode -> studentNum > treeRoot -> studentNum
	addNewStudentToTree (treeRoot -> ptrGtr, NewNode)
    end if


end addNewStudentToTree

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% loads data from a binary/record file and calls addNewStudentToTree to build the
% binary search tree
proc laodTreeFromFile

    var stream, c : int := 0
    open : stream, "students.rec", read

    var r : StudentRecType
    var rNode : ^StudentNodeType


    loop
	% input data from the record file
	exit when eof (stream)
	read : stream, r


	% instantiate a NEW node
	new rNode

	% set the data in the new node variable
	rNode -> studentNum := r.studentNum
	rNode -> surName := r.surName
	rNode -> firstName := r.firstName
	rNode -> average := r.average
	% don't forget to set the member pointers
	rNode -> ptrLess := nil
	rNode -> ptrGtr := nil


	% insert or add the node to the tree
	% Call procedure 'addNewStudentToTree'
	%  'addNewStudentToTree' will require parameters
	addNewStudentToTree (root, rNode)

    end loop


    close : stream


end laodTreeFromFile


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function findstudent (StudentIdKey : int, ID : ^StudentNodeType) : ^StudentNodeType

    if ID = nil then

	result nil

    elsif (StudentIdKey > ID -> studentNum) then

	result findstudent (StudentIdKey, ID -> ptrGtr)

    elsif (StudentIdKey < ID -> studentNum) then

	result findstudent (StudentIdKey, ID -> ptrLess)


    else
	result ID


    end if



end findstudent

proc findStudentAndDisplayStudentRecord (StudentIdKey : int)



    var s : ^StudentNodeType := findstudent (StudentIdKey, root)

    if s = nil then
	put "student not found"

    else
	put "Student Number: ", s -> studentNum
	put "Student Surname: ", s -> surName
	put "Student First Name :", s -> firstName
	put "Student Average :", s -> average
	put ""
    end if

end findStudentAndDisplayStudentRecord

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function findparents (child : ^StudentNodeType, ID : ^StudentNodeType, parents : ^StudentNodeType) : ^StudentNodeType
    if ID = nil then

	result nil

    elsif (child -> studentNum > ID -> studentNum) then

	result findparents (child, ID -> ptrGtr, ID)

    elsif (child -> studentNum < ID -> studentNum) then

	result findparents (child, ID -> ptrLess, ID)


    else
	result parents


    end if



end findparents


%%%
function findmostrightchilren (Base : ^StudentNodeType) : ^StudentNodeType

    if Base -> ptrGtr = nil then
	result Base
    elsif Base -> ptrGtr ~= nil then
	result findmostrightchilren (Base -> ptrGtr)
    end if


end findmostrightchilren
%%
proc removeStudentRecordFromTree (StudentIdKey : int, ID : ^StudentNodeType, parents : ^StudentNodeType)

    var left : boolean := false;
    %%
    if ID = nil then

	put "student does not exist"

    elsif (StudentIdKey > ID -> studentNum) then

	removeStudentRecordFromTree (StudentIdKey, ID -> ptrGtr, ID)
	left := true;
    elsif (StudentIdKey < ID -> studentNum) then

	removeStudentRecordFromTree (StudentIdKey, ID -> ptrLess, ID)
	left := false;

    else
	/*    %Delete tree if the student is only one in tree;
	 if ID = root and root -> ptrLess = nil and root -> ptrGtr = nil then

	 root := nil
	 end if

	 %% delete if bottom is nil  ;
	 if ID -> ptrGtr = nil and ID -> ptrLess = nil then
	 if left = false then
	 parents -> ptrGtr := nil
	 elsif left = true then
	 parents -> ptrLess := nil
	 end if
	 end if
	 %%delete if left exist ;
	 if ID -> ptrLess ~= nil then
	 if (findmostrightchilren (ID -> ptrLess) -> ptrLess ~= nil) then

	 findparents (findmostrightchilren (ID -> ptrLess) -> ptrGtr := findmostrightchilren (ID -> ptrLess) -> ptrLess

	 end if




	 findmostrightchilren (ID -> ptrLess) -> ptrLess := ID -> ptrLess
	 findmostrightchilren (ID -> ptrLess) -> ptrGtr := ID -> ptrGtr
	 if left = false then
	 parents -> ptrGtr := findmostrightchilren (ID -> ptrLess)
	 elsif left = true then
	 parents -> ptrLess := findmostrightchilren (ID -> ptrLess)
	 end if



	 end if
	 */
	if ID = root and root -> ptrLess = nil and root -> ptrGtr = nil then

	    root := nil
	end if
	if left = true then
	    parents -> ptrGtr := nil
	elsif left = false  then
	    parents -> ptrLess := nil
	end if
	if (ID -> ptrLess ~= nil) then
	    addNewStudentToTree (root, ID -> ptrLess)

	elsif (ID -> ptrGtr ~= nil) then
	    addNewStudentToTree (root, ID -> ptrGtr)

	end if
    end if

end removeStudentRecordFromTree

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  MIAN PROGRAM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var ch : string (1)
colorback (black)
color (white)

loop
    cls

    put "\n        BINARY TREE by  ", YourFullName
    put "\n=============================================\n"

    put "  1. Add a new student to the tree"
    put "  2. Load tree from record file"
    put "  3. List all records in the tree"
    put "  4. List a specific student"
    put "  5. Delete a student"
    put "  9. Exit"

    put "\n=============================================\n"

    put "  Enter your selection:  " ..
    getch (ch)
    put "\n\n"
    case (ch) of
	label "1" :
	    var NewNode : ^StudentNodeType
	    new NewNode

	    NewNode -> ptrLess := nil
	    NewNode -> ptrGtr := nil

	    put "Enter student number: " ..
	    get NewNode -> studentNum
	    put "Enter last name: " ..
	    get NewNode -> surName : *
	    put "Enter first name: " ..
	    get NewNode -> firstName : *
	    put "Enter average: " ..
	    get NewNode -> average

	    addNewStudentToTree (root, NewNode)
	label "2" :
	    laodTreeFromFile
	label "3" :
	    displayAllTreeRecords
	label "4" :
	    var StudentIdKey : int
	    put "\n Enter student ID (Student Number):  " ..
	    get StudentIdKey
	    findStudentAndDisplayStudentRecord (StudentIdKey)
	label "5" :
	    var StudentIdKey : int
	    put "\n Enter student ID (Student Number):  " ..
	    get StudentIdKey
	    removeStudentRecordFromTree (StudentIdKey, root, root)
	label "9" :
	    exit
	label :

	    put "\n\n   Don't understand - ", ch, " - Try again."

    end case
    put "\n\n     Enter any key to continue...." ..
    getch (ch)
end loop

