# CHDH-SNA
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/johankoskinen/CHDH-SNA">
      <img src="images/smallnet.jpg" alt="Logo" width="180" height="120">
   </a>

  <h3 align="center">Complex Human Data Hub - Social Network Analysis</h3>

  <p align="center">
    This is material for the SNA workshop at Melbourne Connect
    <br />
    <a href="https://github.com/johankoskinen/CHDH-SNA/tree/main/data"><strong>Explore the data »</strong></a>
    <br />
    <a href="https://github.com/johankoskinen/CHDH-SNA/tree/main/Markdowns"><strong>Explore the R-code »</strong></a>
    <br />
     <a href="https://github.com/johankoskinen/CHDH-SNA/tree/main/Slides"><strong>Explore the Teaching material »</strong></a>
    <br />
    <a href="https://github.com/johankoskinen/CHDH-SNA/issues">Report Bug</a>
    ·
    <a href="https://github.com/johankoskinen/CHDH-SNA/issues">Request Feature</a>
  </p>
</div>


<!-- OVERVIEW -->
## Overview of the workshop

The workshop is built around a set of slides and a set of RMarkdown files, with accompanying data sets, that you will find here

The schedule for the SNA workshop
1. Introduction to Social Network Analysis
2. Introduction to Bayesian analysis for Auto-logistic Actor Attribute Models
3. Auto-logistic Actor Attribute Models - Further issues
4. Modelling Social Influence and Selection with stochastic actor-oriented models (SAOMs)
5. Advanced topics in SAOMs

For details on venue and timings see [Eventbrite]([https://www.eventbrite.com/e/network-analysis-workshop-tickets-528916191567](https://www.eventbrite.com.au/e/social-network-analysis-workshop-tickets-795764040667))


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started



### Context

By network data, we will assume data where we have observations on binary tie-variables among a fixed set of nodes. In a typical dataset, network ties will be elicited through name-generators,[[1]](#1) such as

> Anongs the people in your organisation, list the people that you go to for advice

There are many other ways in which to collect and `operationalise' network ties. Here we will not deal with network inference such as inferring causal graphs or other network represenations

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### R-Prerequisites

There are plenty of tutorials and introductions to network analysis in R and we refer, for example to Borgatti et al (2022)[[2]](#2) for a comprehensive treatment (see also the accompanyhing online supplementary material)

No particular R-skills are expected. You should be able to download the RMarkdown files and run them locally. The RMarkdown files will read any data straight from [https://raw.githubusercontent.com/johankoskinen/CDHD-SNA/main/data/](https://raw.githubusercontent.com/johankoskinen/CDHD-SNA/main/data/).

Examples of loading and formatting network data is provided in
```sh
Markdowns/Data-Formatting.Rmd
```

You will find it in  [CHDH-SNA/Markdowns](https://github.com/johankoskinen/CHDH-SNA/tree/main/Markdowns)

No fancy R-wrappers will be used and the code is written entirely in base R and [Quick-R](https://www.statmethods.net/)
should be a sufficient source of help outside of Googling package specific issues. For the SAOM part of the workshop (sessions 2-4) the repository 
[https://www.stats.ox.ac.uk/~snijders/siena/](https://www.stats.ox.ac.uk/~snijders/siena/) contains all the resources you will ever need.

<h3 align="center"><a href="https://www.stats.ox.ac.uk/~snijders/siena/"><img src="images/rsienalogo.png" alt="R" width="100" height="100"></a></h3>

You *will*, however, need to come with a laptop with R and R-studio installed. In addition, you will want to install the packages
* sna
  ```sh
  install.packages(sna)
* network
  ```sh
  install.packages(network)  
  
* RSiena
  ```sh
  install.packages(RSiena)
  
 If you need to update your version of R, a handy guide is provided [here](https://www.linkedin.com/pulse/3-methods-update-r-rstudio-windows-mac-woratana-ngarmtrakulchol) 

 Please note that RSiena is no longer maintained on CRAN. Now the latest version fo RSiena and other packages is found here: [GitHub/RSiena](https://github.com/stocnet/rsiena/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [x] Install <a href="https://cran.r-project.org/"><img src="images/Rlogo.svg" alt="R" width="25" height="25"></a> (R version 4.2.1 (2022-06-23) may be required)
- [x] Install <a href="https://posit.co/download/rstudio-desktop/"><img src="images/RStudio-Logo-Flat.png" alt="R" width="88.35" height="31.025"></a>
- [ ] Download `CHDH-SNA-X.Rmd` (replace X by session number)
- [ ] Explore RMarkdown by
    - [ ] Stepping through code
    - [ ] Knit to html or pdf for future reference
- [ ] Consult slide pack

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

<img src="images/koskinen_johan.jpg" alt="Me" width="205.2" height="254.4">

Johan Koskinen - [@drjohankoskinen](https://twitter.com/drjohankoskinen) - johan.koskinen@stat.su.se

Project Link: [https://github.com/johankoskinen/CDHD-SNA](https://github.com/johankoskinen/CDHD-SNA)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## References
<a id="1">[1]</a> 
Robins, G. (2015).
Doing Social Networks Research: Network Research Design for Social Scientists.
Los Angeles: Sage.

<a id="2">[2]</a> 
Borgatti, S. P., Everett, M. G., Johnson, J. C., & Agneessens, F. (2022).
Analyzing Social Networks Using R.
Sage.
