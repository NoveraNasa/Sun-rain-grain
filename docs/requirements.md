# Project Requirements – Sun Rain and Grain

# Project Summary

This project investigates how climate change influences agricultural output in Germany using historical weather data from the **DWD Climate Data Center** and crop yield data from the **Thünen Institute** (1979–2021). The goal is to understand how temperature, precipitation, and sunshine duration affect crop yields, crop distribution, and agricultural patterns.

---

# Functional Requirements

Abstract Data Analysis Workflow

The analysis involves the following core steps:

- Loading agricultural and climate datasets
- Cleaning and preprocessing both data sources
- Merging datasets on matching `year` and `district`
- Conducting exploratory data analysis (EDA)
- Modeling climate–yield relationships
- Visualizing results (time trends, correlations, maps)
- Exporting results and insights

# UML Activity Diagram

The following diagram illustrates the abstract workflow used in this project:
You can view the detailed UML Activity Diagram for the data analysis workflow here:

[Open UML Diagram](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Project5.drawio&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Data%20Analysis%20Workflow%22%20id%3D%22UcVfH_5b2ANo5e-etYvy%22%3E3dlbb5swFADgXxNpe9jE1XEeW5q2k1opWqS2e3Tw4dI5GBmnSfbrZ4IJIdCOTUmtrpUqOLbB%2FnxiTDNyg%2BXmRpA8uecU2Mix6GbkXo0cZ4Kx%2BlsGtlXA95wqEIuUViG7CczTX6CDlo6uUgpFq6LknMk0bwdDnmUQylaMCMHX7WoRZ%2B275iSGTmAeEtaNPqZUJlUU%2B1YTv4U0Tuo725YuWZK6sg4UCaF8fRBypyM3EJzL6mi5CYCVdrVL1e76ldJ9xwRkckgD9EBnz8j18Mv1%2BuZxlt4GiH7RV3khbKUHPJdESN1jua0Z1KWUuDq5XCephHlOwrJkreZcxRK5ZOrMVoekyKtpiNINqDtfRiljAWdc7C7kUgI4ClW8kIL%2FhIMSFGJYRKpEdwmEhM2rY7X3girzgC9Biq2qUjfwNPq2nU3rgynUoeRg9upWRCdNvL9w46oONO1fMDsd5jtOqIpcqKwPV0yuBCkvckUk6dgLvspoabkD%2FoP%2FEXcURU7Yy03RAvnoNNy4rY272o7Vw%2B2fi9t9jTtgqfpcwn8jbfumqb0OdcCAZKNyMUJkme%2BGbc0E5IKHUBTnoKc%2BYOr10WNn4aLz0O%2FXdWP0fof%2BHkRcJ3cBsjipMtjKedynPEFjl5xJeWJaGXWUp5tcDZ1Ivut3lc3WRUbYtkhPSx7hEPrXlAX2PTXkc5C7yDT5uJvY5bYyzeKjZSXgQgAjMuXZad398rd3k7L7OYu755p2xx33b5kEkQuQR%2FDTsk71IP0Ohdq%2FnDbv32eTeOTvW6b9J31LDS93442y9WnGeHkQlPk%2Ffyg%2Bf%2FwVxx%2Bblq%2FfDw7pM9qR%2FeBvQahnt%2Fiur0G23SWl6nVbn6pUT3jM1ZN02kQvm3Qus6%2Bpc8d5rrmfQcqt%2Ft8BWUnengzYpPKpbP7V12c%2FdEnVm7ILbwurHvOVCOGtoVX11MtzDPKNek7%2FjFWPsZd2P07v7%2FyD%2FwmRnIFIrlEk1yySOxDJM4rkmUXyBiL5RpF8s0j%2BQCRkFAmZRUIDkcZGkcZmkcYDkbBRJGwWCQ9EmhhFmphFmgxEsq3zKKnT5iuXXdnB91bu9Dc%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E)
or you can open and edit the diagram file here:  
[Project5.drawio](docs/Project5.drawio)

# Non-Functional Requirements

| Category            | Description                                                                      |
|---------------------|----------------------------------------------------------------------------------|
| **Usability**       | Notebooks and scripts must be readable, reproducible, and documented             |
| **Reproducibility** | Full analysis must run from raw data to final results via versioned scripts      |
| **Scalability**     | Workflow should handle increasing amounts of data without performance degradation|
| **Portability**     | Should run on standard Python 3.8+ environments with documented dependencies     |
| **Maintainability** | Source code should be modular (in `src/`) for reuse and testing                  |
| **Licensing**       | Code is MIT-licensed, data under CC-BY 4.0 (DWD & Thünen Institute)              |
| **Collaboration**   | Use Git for branching, commits, merges, and issue tracking                       |


