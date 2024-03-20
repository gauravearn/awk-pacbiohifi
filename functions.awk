#!/usr/bin/awk
# Universitat Potsdam
# Date: 2024-3-11
# updated: 2024-3-14
# Author: Gaurav Sablok
# each of these can be compiled into a specific AWK function. 
gem install youplot
# for preparing the data for the visualization of the coverage or the length of the assembled unitigs from the pacbiohifi assembly. 
# coverage 
for i in $(ls *.cov); \ 
           do cat $i | awk '{ print $2 }'; done
# length
for i in $(ls *.cov); \
             do cat $i | awk '{ print $2 }'; done
# filtering specific to the coverage values ( storing the coverage values in a hash value and then implementing the awk over the same)
coverage="value"
for i in $(for i in $(ls *.csv); \
      do cat $i | awk '{ print $2 }'; done); \ 
                do if [[ $i -ge "${coverage}" ]]; then echo $i; fi; done
length="value"
for i in $(for i in $(ls *.csv); \
      do cat $i | awk '{ print $3 }'; done); \ 
                do if [[ $i -ge "${length}" ]]; then echo $i; fi; done

# normalizing the coverage according to the length
coveragefile="name"
for i in $(cat "${coveragefile}" | awk '{ print $2 }'); \
                do for j in $(cat "${coveragefile}" | awk '{ print $3 }'); \
                                        do echo $i"\t"$j; done | awk '{ print $1*$2 }'
#plotting the length before filtering out the short unitigs
lengthselectionsort="variable"
for i in $(cat test.cov | awk '{ print $3 }'); \
                do if [[ $i -ge "${lengthselectionsort}" ]] then; \ 
                                        echo $i; fi; done | youplot barplot
# binning them according to the length filter and then making the sense of the assembled unitigs
 for i in $(cat test.cov | awk '{ print $3 }'); \
                do if [[ $i -ge "${lengthselectionsort}" ]] then; \ 
                                        echo $i; fi; done | youplot histogram

# estimating the total of the aligned length based on the computed alignments
pafalignments="aligned.paf"
cat aligned.paf | awk '{ print  $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7" \
                                    \t"$8"\t"$9"\t"$10"\t"$11"\t"$12 }' | \
                                    awk '{ print $4-$3 }' | awk '{ print $1 }' | \
                                                      gawk '{ sum += $1 }; END { print sum }'
cat aligned.paf | awk '{ print  $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7" \
                                    \t"$8"\t"$9"\t"$10"\t"$11"\t"$12 }' | \
                                    awk '{ print $9-$8 }' | awk '{ print $1 }' | \
                                                      gawk '{ sum += $1 }; END { print sum }'
# estimating the total of the aligned length based on the computed alignments
pafalignments="aligned.paf"
genomelength=""genomelength
# query aligned genome fractions  percentage as compared to the genome length of the reference genome
cat aligned.paf | awk '{ print  $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7" \
                                    \t"$8"\t"$9"\t"$10"\t"$11"\t"$12 }' | \
                                    awk '{ print $4-$3 }' | awk '{ print $1 }' | \
                                                      gawk '{ sum += $1 }; END { print sum }' | \
                                                                        awk '{ print $1/$genomelength*100 }'
# reference aligned genome fractions percentage as compared to the genome length of the reference genome
cat aligned.paf | awk '{ print  $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7" \
                                    \t"$8"\t"$9"\t"$10"\t"$11"\t"$12 }' | \
                                    awk '{ print $9-$8 }' | awk '{ print $1 }' | \
                                                      gawk '{ sum += $1 }; END { print sum }' | \
                                                                        awk '{ print $1/$genomelength*100 }'
 for i in $(cat test.cov | awk '{ print $3 }'); \
                do if [[ $i -ge "${lengthselectionsort}" ]] then; \ 
                                        echo $i; fi; done | youplot histogram
# calculating the alignment coverage and the genome fraction aligned
cat lastzalignment.txt | awk '{ print $10 }' | cut -f 1 -d "-" > length1.txt \ 
              && cat lastzalignment.txt | awk '{ print $10 }' | cut -f 2 -d "-" > \
                                          length2.txt && paste length1.txt length2.txt \ 
                                                    | awk '{ print $2-$1 }' | youplot barplot
 cat lastzalignment.txt | awk '{ print $12 }' | cut -f 1 -d "-" > length1.txt \ 
              && cat lastzalignment.txt | awk '{ print $12 }' | cut -f 2 -d "-" > \
                                          length2.txt && paste length1.txt length2.txt \ 
                                                    | awk '{ print $2-$1 }' | youplot barplot

