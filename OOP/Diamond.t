var iColour, iHeight, iWidth, iCentreX, iCentreY : int := 100
proc setColour(ipColour:int)
iColour := ipColour
end setColour
proc setHeight(ipHeight:int)
iHeight := ipHeight
end setHeight
proc setWidth(ipWidth:int)
iWidth := ipWidth

end setWidth
proc setCentre(ipCentre:int)
iCentreX := ipCentre
iCentreY := ipCentre
end setCentre

proc draw (iColour, iHeight, iWidth, iCentreX, iCentreY : int)
    var x, y : array 1 .. 4 of int
    x (1) := iCentreX - iWidth div 2
    y (1) := iCentreY
    x (2) := iCentreX
    y (2) := iCentreY + iHeight div 2
    x (3) := iCentreX + iWidth div 2
    y (3) := iCentreY
    x (4) := iCentreX
    y (4) := iCentreY - iHeight div 2

    Draw.FillPolygon (x, y, 4, iColour)
end draw

% Main Program
for i :1..3

draw (Rand.Int(1,100), Rand.Int(1,600), Rand.Int(1,600), Rand.Int(1,600), Rand.Int(1,600))
end for 
