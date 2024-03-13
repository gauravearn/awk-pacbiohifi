# awk_simulators_pacbiohifi_assembly
awk simulators for the pacbiohifi assembly reading from the graphs. easy to use awk for the coverage and the length files. udpating later on with the complete awk functionalities for the compilation into the direct kernels. added some more functions to the same such as gfa extraction and lav and pfa alterations.

```
#!/usr/bin/awk
# Universitat Potsdam
# Date: 2024-3-11
# each of these can be compiled into a specific AWK function. 

# for preparing the data for the visualization of the
coverage or the length of the assembled unitigs from the pacbiohifi assembly. 
# coverage 
for i in $(ls -la *.csv); \ 
        do cat $i | awk '{ print $2 }'; done
# length
for i in $(ls -la *.csv); \
        do cat $i | awk '{ print $2 }'; done
# filtering specific to the coverage values ( storing the coverage values in a
# hash value and then implementing the awk over the same)
coverage="value"
for i in $(for i in $(ls -la *.csv); \
      do cat $i | awk '{ print $2 }'; done); \ 
                do if [[ $i -ge "${coverage}" ]]; then echo $i; fi; done
length="value"
for i in $(for i in $(ls -la *.csv); \
      do cat $i | awk '{ print $3 }'; done); \ 
                do if [[ $i -ge "${length}" ]]; then echo $i; fi; done

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
