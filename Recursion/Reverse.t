function rev (a : string) : string
    if a = "" then
	result ""
    else
	result a(*) + rev (a(1..*-1))

    end if
end rev

var c : string
get c 
put rev(c)
