type queue :
    record
	value : int
	Next : ^queue
    end record

var front : ^queue := nil
function isempty : boolean
    if front = nil then
	result true
    else
	result false
    end if

end isempty
proc enqueue (current : ^queue , ID : ^queue )
    if front = nil then
	front := ID
    elsif current -> Next = nil then
	current -> Next := ID

    else
	enqueue (current -> Next, ID)
    end if

end enqueue
proc dequeue

    front := front -> Next


end dequeue
proc display(current: ^queue  )
if current ~= nil then


put current->value, " " ..
display(current->Next)
end if 


end display 

function finditem(var num : int) : int
var current : ^queue:= front
for i:1..num-1 

current:= current->Next 
end for 

result current -> value
end finditem

proc deleteitem(num :int)
var current : ^queue:= front
for i:1..num-2

current:= current->Next 
end for 

current->Next := current->Next->Next

end deleteitem
var ch : string (1)
colorback (black)
color (white)
loop
    cls

    put "\n        STACK BY TATE"
    put "\n=============================================\n"

    put "  1. Enqueue Item"
    put "  2. Dequeue Item"
    put "  3. List all item"
    put "  4. List item at position : " 
    put "  5. Delete Item at position : "

    put "  9. Exit"

    put "\n=============================================\n"

    put "  Enter your selection:  " ..
    getch (ch)
    put "\n\n"
    case (ch) of
	label "1" :
	    var NewNode : ^queue 
	    new NewNode

	    NewNode -> Next := nil
	    get NewNode -> value

	   enqueue(front,NewNode)
	label "2" :
	  dequeue
	label "3" :
	    display(front)
	label "4" :
	var a : int
	get a 
	    put finditem(a)
	label "5" :
	"Enter position of item you wish to delete"
	  var a : int
	get a 
	    deleteitem(a)
   


	label "9" :
	    exit
	label :

	    put "\n\n   Don't understand - ", ch, " - Try again."

    end case
    put "\n\n     Enter any key to continue...." ..
    getch (ch)
end loop
