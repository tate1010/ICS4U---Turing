
var iColour, iHeight, iWidth, iCentreX, iCentreY : int := 100

proc draw
    Draw.FillOval (iCentreX - iWidth div 4, iCentreY - iHeight div 8, iWidth div 4, iHeight div 4, iColour)
    Draw.FillOval (iCentreX + iWidth div 4, iCentreY - iHeight div 8, iWidth div 4, iHeight div 4, iColour)
    Draw.FillOval (iCentreX, iCentreY + iHeight div 4, iWidth div 4, iHeight div 4, iColour)
    Draw.FillBox (iCentreX - iWidth div 15, iCentreY - iHeight div 2, iCentreX + iWidth div 15, iCentreY + iHeight * sin (59) div 2, iColour)
end draw


draw
