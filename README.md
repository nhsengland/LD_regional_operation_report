# LEARNING DISABILITIES OPERATIONAL REPORT
## NHS England South West Intelligence and Insights

### About the Project

This is an operational report for learning disability inpatients, based on the assuring transformations dataset.

[Assuring Transformations dataset](https://digital.nhs.uk/data-and-information/data-collections-and-data-sets/data-collections/assuring-transformation/content)

It covers basic inpatients moves and progress towards inpatient targets.

_**Note:** Only public or fake data are shared in this repository._

### Project Stucture

- The main code is found in the root of the repository 
- No dummy data has been provided at this stage

### Built With

[R Studio](http://www.rstudio.com/.)  
[R Statistical Software](https://www.R-project.org/.)  

library(tidyverse)
library(janitor)
library(readxl)
library(DT)
library(NHSRplotthedots)
library(lubridate)
library(zoo)
library(rpivotTable)
library(flextable)
library(snakecase)
library(gt)
library(plotly)

In addition there is SQL query to obtain base data from NCDR


### Getting Started

#### Installation

To get a local copy up and running follow these simple steps.

To clone the repo:

`git clone https://github.com/ld_ops_rpt`


### Usage

Code reads in datafile created in SQL from NCDR

Run SQL query and save results as ld_dat_{%b%y}

Using R Studio within UDAL

Open the R project ‘LD Ops Rpt’

Open the markdown document ‘LD_ops_rpt.rmd’

After reading in the libraries there is a line of code that says 

LD_inpatients <- read_excel("ld_dat_{%b%y}.xlsx")  update this to match the excel sheet you have just saved

Ensure that the excel sheet is closed

Then click on knit 

#### Outputs
Report will be produced in an interactive HTML document

#### Datasets
Requires access to [NHSE_Sandbox_LDP_Shared]

No synthetic data is available at this time.

### Roadmap

Report is currently hard coded to SW region.  This can be adjusted to work for other regions.

### Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

_See [CONTRIBUTING.md](./CONTRIBUTING.md) for detailed guidance._

### License

Unless stated otherwise, the codebase is released under [the MIT Licence][mit].
This covers both the codebase and any sample code in the documentation.

_See [LICENSE](./LICENSE) for more information._

The documentation is [© Crown copyright][copyright] and available under the terms
of the [Open Government 3.0][ogl] licence.

[mit]: LICENCE
[copyright]: http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/
[ogl]: http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/

### Contact

To find out more about the South West Intelligence and Insights Team visit our [South West Intelligence and Insights Team Futures Page](https://future.nhs.uk/SouthWestAnalytics)) or get in touch at [england.southwestanalytics@nhs.net](mailto:england.southwestanalytics@nhs.net).

<!-- ### Acknowledgements -->

