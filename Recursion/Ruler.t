import GUI


proc draw(low :int, high : int , n :int )
var mid :int 
mid := (low+high) div 2
if 5*n < 1 then


else

Draw.Line(mid,240,mid,240+5*n,black)
draw(low,mid,n div 2)
draw(mid,high,n div 2)

end if 
end draw

var x1,x2,n:int 
get x1,x2,n  
draw(x1,x2,n)
Draw.Box(x1,240,x2,240+5*n,black)
