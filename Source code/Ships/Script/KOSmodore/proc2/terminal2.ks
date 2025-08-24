@lazyglobal off.

run once "/KOSmodore/multimonitor.ks".
run once "/KOSmodore/proc2/tmasks2.ks".

	function exi{
		local P TO PROCESSOR("second").
		P:CONNECTION:SENDMESSAGE(" ready").
		//set hd to "".
		GoPage(PageBack()).
	}
	
	function enterhint{
		MesSec(emptyprog[Cuy],Cux).
		sendmsg(" enter").
		
	}

function InitTermMultiType0{
	parameter mainmonnum, secmonnum.
	    

		
		ClearTerminal(mainmonnum).
		
		mylabels:setlabel(0,"      [/hw]G[hw]    ").
		mylabels:setlabel(1,"    [/hw]H[hw]    ").
		mylabels:setlabel(2,"    [/hw]I[hw]    ").
		mylabels:setlabel(3,"    [/hw]J[hw]    ").
		mylabels:setlabel(4,"    [/hw]K[hw]    ").
		mylabels:setlabel(5,"    [/hw]L[hw]    ").
		
		mylabels:setlabel(7,"      [/hw]T[hw]    ").
		mylabels:setlabel(8,"    [/hw]U[hw]    ").
		mylabels:setlabel(9,"    [/hw]V[hw]    ").
		mylabels:setlabel(10,"    [/hw]W[hw]    ").
		mylabels:setlabel(11,"    [/hw]X[hw]    ").
		mylabels:setlabel(12,"    [/hw]Y[hw]    ").
		mylabels:setlabel(13,"   [/hw]Z[hw]       ").
		
		mybuttons:setdelegate(0, tyG@). 
		mybuttons:setdelegate(1, tyH@). 
		mybuttons:setdelegate(2, tyI@).
		mybuttons:setdelegate(3, tyJ@).  
		mybuttons:setdelegate(4, tyK@).
		mybuttons:setdelegate(5, tyL@).
		mybuttons:setdelegate(7, tyT@).
		mybuttons:setdelegate(8, tyU@).
		mybuttons:setdelegate(9, tyV@).
		mybuttons:setdelegate(10,tyW@).
		mybuttons:setdelegate(11,tyX@).
		mybuttons:setdelegate(12,tyY@).
		mybuttons:setdelegate(13,tyZ@).	
		
		mybuttons:setdelegate(-2,exi@). //CANCEL
		mybuttons:setdelegate(-3,CuUp@).             //UP
		mybuttons:setdelegate(-4,CuDown@).           //DOWN
		mybuttons:setdelegate(-5,CuLeft@).           //LEFT
		mybuttons:setdelegate(-6,CuRight@).          //RIGHT
		mybuttons:setdelegate(-1,InsertLineKST@).  //ENTER
		
		ClearTerminal(secmonnum).
		
		mylabels:setlabel(0,"      [/hw]A[hw]    ").
		mylabels:setlabel(1,"    [/hw]B[hw]    ").
		mylabels:setlabel(2,"    [/hw]C[hw]    ").
		mylabels:setlabel(3,"    [/hw]D[hw]    ").
		mylabels:setlabel(4,"    [/hw]E[hw]    ").
		mylabels:setlabel(5,"    [/hw]F[hw]    ").
		
		mylabels:setlabel(7,"      [/hw]M[hw]    ").
		mylabels:setlabel(8,"    [/hw]N[hw]    ").
		mylabels:setlabel(9,"    [/hw]O[hw]    ").
		mylabels:setlabel(10,"    [/hw]P[hw]    ").
		mylabels:setlabel(11,"    [/hw]Q[hw]    ").
		mylabels:setlabel(12,"    [/hw]R[hw]    ").
		mylabels:setlabel(13,"   [/hw]S[hw]       ").
		
		mybuttons:setdelegate(0, tyA@). 
		mybuttons:setdelegate(1, tyB@). 
		mybuttons:setdelegate(2, tyC@).
		mybuttons:setdelegate(3, tyD@).  
		mybuttons:setdelegate(4, tyE@).
		mybuttons:setdelegate(5, tyF@).
		mybuttons:setdelegate(7, tyM@).
		mybuttons:setdelegate(8, tyN@).
		mybuttons:setdelegate(9, tyO@).
		mybuttons:setdelegate(10,tyP@).
		mybuttons:setdelegate(11,tyQ@).
		mybuttons:setdelegate(12,tyR@).
		mybuttons:setdelegate(13,tyS@).	
		
		mybuttons:setdelegate(-1,enterhint@).  //ENTER
		mybuttons:setdelegate(-2,cicleset@).                //Exit
		mybuttons:setdelegate(-3,endhome@:bind(98)).          //UP
		//mybuttons:setdelegate(-3,sendmsg@:bind(" up")).     //UP
		mybuttons:setdelegate(-4,sendmsg@:bind(" down")).   //DOWN
		mybuttons:setdelegate(-5,T9backsE@).                //LEFT
		mybuttons:setdelegate(-6,T9spaceE@).                //RIGHT
}



function InitTermMultiType1{
	
	parameter mainmonnum, secmonnum.
	

	
	   		
		ClearTerminal(mainmonnum).
		
		mylabels:setlabel(0,"      [/hw]g[hw]    ").
		mylabels:setlabel(1,"    [/hw]h[hw]    ").
		mylabels:setlabel(2,"    [/hw]i[hw]    ").
		mylabels:setlabel(3,"    [/hw]j[hw]    ").
		mylabels:setlabel(4,"    [/hw]k[hw]    ").
		mylabels:setlabel(5,"    [/hw]l[hw]    ").
		
		mylabels:setlabel(7,"      [/hw]t[hw]    ").
		mylabels:setlabel(8,"    [/hw]u[hw]    ").
		mylabels:setlabel(9,"    [/hw]v[hw]    ").
		mylabels:setlabel(10,"    [/hw]w[hw]    ").
		mylabels:setlabel(11,"    [/hw]x[hw]    ").
		mylabels:setlabel(12,"    [/hw]y[hw]    ").
		mylabels:setlabel(13,"   [/hw]z[hw]       ").
		
		mybuttons:setdelegate(0, tygl@). 
		mybuttons:setdelegate(1, tyhl@). 
		mybuttons:setdelegate(2, tyil@).
		mybuttons:setdelegate(3, tyjl@).  
		mybuttons:setdelegate(4, tykl@).
		mybuttons:setdelegate(5, tyll@).
		mybuttons:setdelegate(7, tytl@).
		mybuttons:setdelegate(8, tyul@).
		mybuttons:setdelegate(9, tyvl@).
		mybuttons:setdelegate(10,tywl@).
		mybuttons:setdelegate(11,tyxl@).
		mybuttons:setdelegate(12,tyyl@).
		mybuttons:setdelegate(13,tyzl@).	
		
		mybuttons:setdelegate(-2,exi@). //CANCEL
		mybuttons:setdelegate(-3,CuUp@).             //UP
		mybuttons:setdelegate(-4,CuDown@).           //DOWN
		mybuttons:setdelegate(-5,CuLeft@).           //LEFT
		mybuttons:setdelegate(-6,CuRight@).          //RIGHT
		mybuttons:setdelegate(-1,InsertLineKST@).  //ENTER
		
		ClearTerminal(secmonnum).
		
		mylabels:setlabel(0,"      [/hw]a[hw]    ").
		mylabels:setlabel(1,"    [/hw]b[hw]    ").
		mylabels:setlabel(2,"    [/hw]c[hw]    ").
		mylabels:setlabel(3,"    [/hw]d[hw]    ").
		mylabels:setlabel(4,"    [/hw]e[hw]    ").
		mylabels:setlabel(5,"    [/hw]f[hw]    ").
		
		mylabels:setlabel(7,"      [/hw]m[hw]    ").
		mylabels:setlabel(8,"    [/hw]n[hw]    ").
		mylabels:setlabel(9,"    [/hw]o[hw]    ").
		mylabels:setlabel(10,"    [/hw]p[hw]    ").
		mylabels:setlabel(11,"    [/hw]q[hw]    ").
		mylabels:setlabel(12,"    [/hw]r[hw]    ").
		mylabels:setlabel(13,"   [/hw]s[hw]       ").
		
		mybuttons:setdelegate(0, tyal@). 
		mybuttons:setdelegate(1, tybl@). 
		mybuttons:setdelegate(2, tycl@).
		mybuttons:setdelegate(3, tydl@).  
		mybuttons:setdelegate(4, tyel@).
		mybuttons:setdelegate(5, tyfl@).
		mybuttons:setdelegate(7, tyml@).
		mybuttons:setdelegate(8, tynl@).
		mybuttons:setdelegate(9, tyol@).
		mybuttons:setdelegate(10,typl@).
		mybuttons:setdelegate(11,tyql@).
		mybuttons:setdelegate(12,tyrl@).
		mybuttons:setdelegate(13,tysl@).	
		
		mybuttons:setdelegate(-1,enterhint@).  //ENTER
		mybuttons:setdelegate(-2,cicleset@).                //Exit
		mybuttons:setdelegate(-3,endhome@:bind(98)).          //UP
		//mybuttons:setdelegate(-3,sendmsg@:bind(" up")).     //UP
		mybuttons:setdelegate(-4,sendmsg@:bind(" down")).   //DOWN
		mybuttons:setdelegate(-5,T9backsE@).                //LEFT
		mybuttons:setdelegate(-6,T9spaceE@).                //RIGHT
}

function InitTermMultiType2{
	
	parameter mainmonnum, secmonnum.
	

	
	   		
		ClearTerminal(mainmonnum).
		
		hdldmask().
		
		mylabels:setlabel(0,"     [/hw]6[hw]     ").
		mylabels:setlabel(1,"    [/hw]7[hw]    ").
		mylabels:setlabel(2,"    [/hw]8[hw]    ").
		mylabels:setlabel(3,"    [/hw]9[hw]    ").
		mylabels:setlabel(4,"    [/hw]0[hw]    ").
		//mylabels:setlabel(5,"    [/hw]5[hw]    ").
		
		//mylabels:setlabel(7,"      [/hw]t[hw]    ").
		//mylabels:setlabel(8,"    [/hw]u[hw]    ").
		//mylabels:setlabel(9,"    [/hw]v[hw]    ").
		//mylabels:setlabel(10,"    [/hw]w[hw]    ").
		//mylabels:setlabel(11,"    [/hw]x[hw]    ").
		//mylabels:setlabel(12,"    [/hw]y[hw]    ").
		
		
		mybuttons:setdelegate(0, ty6@). 
		mybuttons:setdelegate(1, ty7@). 
		mybuttons:setdelegate(2, ty8@).
		mybuttons:setdelegate(3, ty9@).  
		mybuttons:setdelegate(4, ty0@).
		//mybuttons:setdelegate(5, tyll@).
		//mybuttons:setdelegate(7, tytl@).
		//mybuttons:setdelegate(8, tyul@).
		//mybuttons:setdelegate(9, tyvl@).
		//mybuttons:setdelegate(10,tywl@).
		//mybuttons:setdelegate(11,tyxl@).
		//mybuttons:setdelegate(12,tyyl@).
		
		
		mybuttons:setdelegate(-2,exi@). //CANCEL
		mybuttons:setdelegate(-3,CuUp@).             //UP
		mybuttons:setdelegate(-4,CuDown@).           //DOWN
		mybuttons:setdelegate(-5,CuLeft@).           //LEFT
		mybuttons:setdelegate(-6,CuRight@).          //RIGHT
		mybuttons:setdelegate(-1,InsertLineKST@).  //ENTER
		
		ClearTerminal(secmonnum).
		
		mylabels:setlabel(0,"   Pag Up   ").
		mylabels:setlabel(1,"    [/hw]1[hw]    ").
		mylabels:setlabel(2,"    [/hw]2[hw]    ").
		mylabels:setlabel(3,"    [/hw]3[hw]    ").
		mylabels:setlabel(4,"    [/hw]4[hw]    ").
		mylabels:setlabel(5,"    [/hw]5[hw]    ").
		
		mylabels:setlabel(7,"  Pag Down  ").
		//mylabels:setlabel(8,"   A  B   ").
		//mylabels:setlabel(9,"    [/hw]8[hw]    ").
		//mylabels:setlabel(10,"    [/hw]9[hw]    ").
		//mylabels:setlabel(11,"    [/hw]0[hw]    ").
		//mylabels:setlabel(12,"    [/hw]r[hw]    ").
		//mylabels:setlabel(13,"   [/hw]s[hw]       ").
		
		//mybuttons:setdelegate(0, tyal@). 
		mybuttons:setdelegate(1, ty1@). 
		mybuttons:setdelegate(2, ty2@).
		mybuttons:setdelegate(3, ty3@).  
		mybuttons:setdelegate(4, ty4@).
		mybuttons:setdelegate(5, ty5@).
		//mybuttons:setdelegate(7, ty6@).
		//mybuttons:setdelegate(8, endhome@:bind(98)).
		//mybuttons:setdelegate(9, ty8@).
		//mybuttons:setdelegate(10,ty9@).
		//mybuttons:setdelegate(11,ty0@).
		//mybuttons:setdelegate(12,tyrl@).
		//mybuttons:setdelegate(13,tysl@).	
		mybuttons:setdelegate(-1,enterhint@).  //ENTER
		mybuttons:setdelegate(-2,cicleset@).                //Exit
		mybuttons:setdelegate(-3,endhome@:bind(98)).          //UP
		//mybuttons:setdelegate(-3,sendmsg@:bind(" up")).     //UP
		mybuttons:setdelegate(-4,sendmsg@:bind(" down")).   //DOWN
		mybuttons:setdelegate(-5,T9backsE@).                //LEFT
		mybuttons:setdelegate(-6,T9spaceE@).                //RIGHT
		
}