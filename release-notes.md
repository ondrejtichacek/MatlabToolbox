# v2.3.1 - 25th July 2016

* Minor tweak to magnitude calculation in matchEQ.
* Redefined TIR in mixture class as target w.r.t. sum of interfering sources. Updated documentation.

# v2.3 - 19th July 2016

* Corrected code to restore current directory when installation is complete.
* Added function to generate BSS mixtures by combining sources in various ways.
* Added property to iosr.bss.mixture to return interferer filenames as char array. Also corrected bug setting properties when interferer comprises multiple sources.

# v2.2.3 - 12th July 2016

Corrected boxPlot bug whereby x-separator line would disappear when setting y-axis limits to inf.

# v2.2.2 - 10th July 2016

Corrected calls to other toolbox functions.

# v2.2.1 - 8th July 2016

Fixed erroneous default 'method' in boxPlot.

# v2.2 - 7th July 2016

Added install function that downloads dependencies and sets path. Fixed bug in boxPlot where some set functions check the old value rather than the new value.

# v2.1 - 22nd June 2016

Added match EQ function.

# v2 - 6th June 2016

Restructured toolbox into a Matlab package in order to appropriately restrict namespace. Consolidated some file/function names into a consistent format.
