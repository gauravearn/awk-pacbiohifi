# awk-pacbiohifi
awk simulators for the pacbiohifi assembly reading from the graphs. easy to use awk for the coverage and the length files. 

```
# example usage more look into the code and the upcoming awk library.
#plotting the length right in the terminal after filtering out the short unitigs
# binning them according to the length filter and then making the sense of the assembled unitigs
lengthselectionsort="variable"
for i in $(cat test.cov | awk '{ print $3 }'); \
                do if [[ $i -ge "${lengthselectionsort}" ]] then; \ 
                                        echo $i; fi; done | youplot barplot

 for i in $(cat test.cov | awk '{ print $3 }'); \
                do if [[ $i -ge "${lengthselectionsort}" ]] then; \ 
                                        echo $i; fi; done | youplot histogram
```
![image](https://github.com/sablokgaurav/awk_simulators_pacbiohifi_assembly/blob/main/plotimage.png)

Gaurav \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany
