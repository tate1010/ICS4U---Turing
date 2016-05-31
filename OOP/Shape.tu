unit 
class shape
export setColour, setHeight, setWidth, setCentre, getHeight,getWidth,getCentreY,getCentreX,draw,erase,getColour
var iColour, iHeight, iWidth, iCentreX, iCentreY : int := 100


function getColour: int
result iColour
end getColour
function getHeight :int

result iHeight
end getHeight
function getWidth :int

result iWidth
end getWidth

function getCentreX :int
result iCentreX
end getCentreX

function getCentreY :int
result iCentreY
end getCentreY
proc setColour(ipColour:int)
iColour := ipColour
end setColour
proc setHeight(ipHeight:int)
iHeight := ipHeight
end setHeight
proc setWidth(ipWidth:int)
iWidth := ipWidth

end setWidth
proc setCentre(ipCentreX,ipCentreY:int)
iCentreX := ipCentreX
iCentreY := ipCentreY
end setCentre

deferred procedure draw

procedure erase
		% temporarily store the object's color
		var iOldColor : int := getColour
		% set the object's current color to the background color
		iColour := colorbg
		% draw the object in the background color
		draw()
		%reset the object's original color
		iColour := iOldColor
end erase
end shape
