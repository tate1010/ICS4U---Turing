unit 
class Heart      
export draw, setColour, setHeight, setWidth, setCentre
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
proc setCentre(ipCentreX,ipCentreY:int)
iCentreX := ipCentreX
iCentreY := ipCentreY
end setCentre

proc draw
    var x, y : array 1 .. 3 of int
    x (1) := iCentreX - iWidth div 2
    y (1) := iCentreY + iHeight div 8

    x (2) := iCentreX + iWidth div 2
    y (2) := iCentreY + iHeight div 8
    x (3) := iCentreX
    y (3) := iCentreY - iHeight div 2

    Draw.FillPolygon (x, y, 3, iColour)
    Draw.FillArc (iCentreX - iWidth div 4, iCentreY + iHeight div 8, iWidth div 4, iHeight * 3 div 8, 0, 180, iColour)
    Draw.FillArc (iCentreX + iWidth div 4, iCentreY + iHeight div 8, iWidth div 4, iHeight * 3 div 8, 0, 180, iColour)
end draw

end Heart
