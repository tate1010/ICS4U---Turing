unit 
class Diamond
inherit suits in "suits.tu"  
   

body proc draw
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




end Diamond
