# awk_simulators_pacbiohifi_assembly
awk simulators for the pacbiohifi assembly reading from the graphs. easy to use awk for the coverage and the length files. udpating later on with the complete awk functionalities for the compilation into the direct kernels. added some more functions to the same such as gfa extraction and lav and pfa alterations. added support for the functional aspect of the graph manipulations. Adding the support for the maf alignments. Added the support for the gnu visualziations. 

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

Gaurav Sablok \
Academic Staff Member \
Bioinformatics \
Institute for Biochemistry and Biology \
University of Potsdam \
Potsdam,Germany
