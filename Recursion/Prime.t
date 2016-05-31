function prime (a : int, var b : int) : string
  b := b - 1
    if b = 1 then
	result "prime number"

   

    elsif (a mod b) = 0 then
put b 
	result "not prime"

    else
  
    result    prime(a,b)

    end if


end prime

var a : int
var b : int
get a
b := a
put prime (a, b)

