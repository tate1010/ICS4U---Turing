type stack :
    record
	value : int
	Next : ^stack
    end record

var top : ^stack := nil
function isempty : boolean
    if top = nil then
	result true
    else
	result false
    end if


end isempty
proc push (ID : ^stack)
    if top = nil then
	top := ID
    else
	ID -> Next := top
	top := ID
    end if

end push

proc pop
    top := top -> Next

end pop
proc list (var top : ^stack)
    if top = nil then
	put "the stack is empty"
    else
	put top -> value
	if top -> Next ~= nil then
	    list (top -> Next)
	end if
    end if
end list
proc peek
    if top = nil then
	put "the stack is empty"
    else
	put top -> value
    end if
end peek
proc finditem(var num : int)
var current : ^stack := top
for i:1..num-1 

current:= current->Next 


end for 
put current -> value
end finditem
var ch : string (1)
colorback (black)
color (white)
loop
    cls

    put "\n        STACK BY TATE"
    put "\n=============================================\n"

    put "  1. Push Item"
    put "  2. Pop Item"
    put "  3. List all item"
    put "  4. Peak"

    put "  9. Exit"

    put "\n=============================================\n"

    put "  Enter your selection:  " ..
    getch (ch)
    put "\n\n"
    case (ch) of
	label "1" :
	    var NewNode : ^stack
	    new NewNode

	    NewNode -> Next := nil
	    get NewNode -> value

	    push (NewNode)
	label "2" :
	    pop
	label "3" :
	    list (top)
	label "4" :
	    peek
	label "5" :
       var  a :int
	get a
	 finditem(a)



	label "9" :
	    exit
	label :

	    put "\n\n   Don't understand - ", ch, " - Try again."

    end case
    put "\n\n     Enter any key to continue...." ..
    getch (ch)
end loop
