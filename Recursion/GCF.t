function GCF(var a:int ,var b:int ) :int 

var temp :int 

if  a = b then 
result a 

else
if a < b then
temp := a 
a := b 
b := temp
elsif a > b then 
temp := a 
a := b 
b := (temp-b)
end if 

result GCF(a,b)
end if 




end GCF




var a,b :int 
get a,b
put GCF(a,b)
