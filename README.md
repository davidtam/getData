getData
=======

##Getting and Cleaning Data Course Project


The repo contains the work for the course project.

There are the following files:

* [**UCI**](https://github.com/davidtam28/getData/tree/master/UCI) - the directory that contains the original data files, with so unused files stripped out.

* [**run_analysis.R**](https://github.com/davidtam28/getData/blob/master/run_analysis.R) - the actual R code that is used for cleaning up data and convert into required format.

* [**meanBySubjectAndActivity.txt**](https://github.com/davidtam28/getData/blob/master/meanBySubjectAndActivity.txt) - the file contains the "Tidy" data that is submitted as to the course.  [CodeBook for the tidy file can be found here](https://github.com/davidtam28/getData/blob/master/CodeBook.md)


## How to run the analysis


1. Checkout or clone this git repo (following example assume repo is checkout to C:\coursera\getData on a windows box)
2. Assuming R has been installed
3. Open up R and run the following

   ```
   # setup working directory of R
   setwd("C:/coursera/getData")
   # run the script which do the steps according to the course project
   source("run_analysis.R")
   ```

4. Once the command prompt returned the R environment would be populated with the data.
5. To look at the merged data of both test and train set run
 
  ```
  View(mergedData)
  ```

6. To look at the tidy data run

  ```
  View(meanBySubjectAndActivity)
  ```
