#1/bin/bash

watch "echo '# of my jobs:'; qstat | grep elong | grep -v C | wc -l; echo; qstat | grep -v C"
