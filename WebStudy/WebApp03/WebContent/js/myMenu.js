/**
 *  myMenu.js
 */



/*
function myMenu1()
{
	
}


function myMenu2()
{
	
}
*/

function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if(status==1)
	{
		//	블럭 단위로 렌더링 하겠다..
		menu.style.display = "block";
	}
	else
	{
		//  그리지 않겠다.
		menu.style.display = "none";
	}
}