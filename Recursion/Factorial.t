function a (b : int) : int
    if b = 1 then
	result 1

    else
	result b * a (b - 1)

    end if

end a

var c :int 
get c 
put a(c)
