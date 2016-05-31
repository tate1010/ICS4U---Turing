function gemo (a :int ,r:int, n :int ) :int 

if n = 1 then
result a



else
result a*r**(n-1) +gemo(a,r,n-1)

end if 
end gemo 
var a :int 
var b :int 
var c :int 
get a,b,c

put gemo(a,b,c)

