#1/bin/bash

watch "showq | grep Active; echo; echo '# of my jobs:'; qstat | grep elong | grep -v C | wc -l; echo; qstat | grep -v C"
