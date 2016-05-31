unit
class MShapes
    inherit "Shape.tu"
    export slideTo

    process slideToInternal(x : int, y : int)
    
	loop
	    exit when x = getCentreX and y = getCentreY
	    if (x > getCentreX) then
		erase
		setCentre (getCentreX + 1, getCentreY)
		draw ()
	    elsif (x < getCentreX) then
		erase
		setCentre (getCentreX - 1, getCentreY)
		draw ()
	    end if

	    delay (1)
	    if (y > getCentreY) then
		erase
		setCentre (getCentreX, getCentreY + 1)
		draw ()
	    elsif (y < getCentreY) then
		erase
		setCentre (getCentreX, getCentreY - 1)
		draw ()

	    end if

	    delay (16)
	end loop
    end slideToInternal

    proc slideTo (x : int, y : int)
     loop
	    exit when x = getCentreX and y = getCentreY
	    if (x > getCentreX) then
		erase
		setCentre (getCentreX + 1, getCentreY)
		draw ()
	    elsif (x < getCentreX) then
		erase
		setCentre (getCentreX - 1, getCentreY)
		draw ()
	    end if

	    delay (1)
	    if (y > getCentreY) then
		erase
		setCentre (getCentreX, getCentreY + 1)
		draw ()
	    elsif (y < getCentreY) then
		erase
		setCentre (getCentreX, getCentreY - 1)
		draw ()

	    end if

	    delay (16)
	end loop
    end slideTo

end MShapes
