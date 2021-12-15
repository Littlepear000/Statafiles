** Title: This is a sample do-file - easy version
** Author: OneWorksheet
** Date Modified: 2021/11/28

clear
set more off
pwd

** Section 1. Load Data
	sysuse auto, clear
	
** Section 2. Process Data
	
	dis in red "Sample do file"
	exit
	
	gen expensive = (price > 10000)
	tostring headroom, replace
	reg price mpg
	pwcorr price mpg rep78 trunk weight length turn, sig
	
	//change the var names
	foreach v of varlist * {
		ren `v' auto_`v'
	}
	
** Section 3. Graph
	twoway scatter auto_price auto_mpg
	
** Section 4. Save Data and chart
	save "auto_processed", replace
	