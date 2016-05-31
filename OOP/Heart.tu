unit 
class Heart  
inherit suits in "suits.tu"        

body proc draw
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
