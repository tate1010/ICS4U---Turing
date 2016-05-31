% Program: DrawDie.t
%  Author: 
%    Date: 

setscreen ("graphics:640;480,nocursor")
% global variables
var iaSpotCentre : array 1 .. 7, 1 .. 2 of int
var saDisplaySpot : array 1 .. 7 of string
var iHeight : int := 100
var iCentreX : int := 360
var iCentreY : int := 240
var iDieValue : int := 3
var iColour : int := black
var iSpotRadius : int := iHeight div 10

% locate the coordinates for the centre of each spot 
iaSpotCentre (1, 1) := iCentreX - 3 * iHeight div 10
iaSpotCentre (1, 2) := iCentreY + 3 * iHeight div 10
iaSpotCentre (2, 1) := iCentreX + 3 * iHeight div 10
iaSpotCentre (2, 2) := iCentreY + 3 * iHeight div 10
iaSpotCentre (3, 1) := iCentreX - 3 * iHeight div 10
iaSpotCentre (3, 2) := iCentreY
iaSpotCentre (4, 1) := iCentreX
iaSpotCentre (4, 2) := iCentreY
iaSpotCentre (5, 1) := iCentreX + 3 * iHeight div 10
iaSpotCentre (5, 2) := iCentreY
iaSpotCentre (6, 1) := iCentreX - 3 * iHeight div 10
iaSpotCentre (6, 2) := iCentreY - 3 * iHeight div 10
iaSpotCentre (7, 1) := iCentreX + 3 * iHeight div 10
iaSpotCentre (7, 2) := iCentreY - 3 * iHeight div 10

% identify which spots to diplay for each value of the die
saDisplaySpot (1) := "23456"
saDisplaySpot (2) := "456"
saDisplaySpot (3) := "6"
saDisplaySpot (4) := "135"
saDisplaySpot (5) := "6"
saDisplaySpot (6) := "456"
saDisplaySpot (7) := "23456"

% draw the die
drawbox (iCentreX - iHeight div 2, iCentreY - iHeight div 2, iCentreX +
    iHeight div 2, iCentreY + iHeight div 2, iColour)

for i : 1 .. 7
    if index (saDisplaySpot (i), intstr (iDieValue)) > 0 then
	drawfilloval (iaSpotCentre (i, 1), iaSpotCentre (i, 2), iSpotRadius,
	    iSpotRadius, iColour)
    end if
end for
