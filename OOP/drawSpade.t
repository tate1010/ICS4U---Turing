
var iColour, iHeight, iWidth, iCentreX, iCentreY : int := 100

proc draw
    var x, y : array 1 .. 3 of int
    x (1) := iCentreX - iWidth div 2
    y (1) := iCentreY - iHeight div 8
    x (2) := iCentreX + iWidth div 2
    y (2) := iCentreY - iHeight div 8
    x (3) := iCentreX
    y (3) := iCentreY + iHeight div 2

    Draw.FillPolygon (x, y, 3, iColour)
    Draw.FillArc (iCentreX - iWidth div 4, iCentreY - iHeight div 8, iWidth div 4, iHeight div 4, 180, 360, iColour)
    Draw.FillArc (iCentreX + iWidth div 4, iCentreY - iHeight div 8, iWidth div 4, iHeight div 4, 180, 360, iColour)
    Draw.FillBox (iCentreX - iWidth div 15, iCentreY - iHeight div 2, iCentreX + iWidth div 15, iCentreY, iColour)
end draw


draw
