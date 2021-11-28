** Title: This is a sample do-file
** Author: OneWorksheet
** Date Modified: 2021/11/28

cd "C:\Users\jijin\Downloads" //Input your working directory path here
clear
set more off


** Section 1. Load Data
	import excel "gdp and population.xlsx", sheet("GDP Wide") firstrow

	
** Section 2. Process Data

	//change the var names
	foreach v of varlist C-J {
		local varlabel: variable label `v' 
		ren `v' value`varlabel'
	}
	
	//pivot the data from wide to long
	reshape long value, i(Country Indicator) j(year)
	destring value, replace force

	
** Section 3. Graph
	twoway line value year if Country == "Algeria"
	

** Section 4. Save Data and chart
	graph save "Algeria GDP Trend", replace
	save "GDP long format", replace
	