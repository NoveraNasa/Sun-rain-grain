# 🌾 Climate Impact on Agriculture in Germany (1980–2020)

In this project  named "Sun,Rain & Grain", we investigate the impact of seasonal rainfall and temperature on crop yields across different regions in Germany. Using weather data from the DWD Climate Data Center and agricultural production data, we build a reproducible Snakemake workflow to process, merge, and analyze the data. Our goal is to determine how seasonal climate variability influences agricultural output over time.

##  Project Idea

The goal is to explore how variables like temperature, precipitation, and sunshine duration impact:

- Crop yields over time and across regions  
- The distribution of crop types  
- Potential shifts in planting/harvesting patterns  

We combine long-term climate data from major DWD stations (1980–2020) with crop yield data aggregated at the district level (1979–2021). The analysis includes exploratory data analysis, correlation modeling, and climate-agriculture interaction studies.

##  Updated work

- Climate data is now **joined by district and year**, using a station-to-district mapping table.
- Merged dataset includes ~60,000 records covering multiple regions and years.
- EDA visualizations are generated on all merged rows, including:
  - Correlation matrix of climate variables and yields
  - Time series plots per district
  - Scatterplots of yields vs. temperature and precipitation
- Snakemake workflow has been refined for reproducibility and clean outputs.

---
## Repository Structure

```text
.
├── requirement.txt
├── CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE
├── CITATION.cff
├── README.md
├── Snakefile
├── config
│   └── config.yaml
├── data
│   ├── raw
│   │   ├── Agricultural_data.csv
│   │   ├── Frankfurt_01424_19851101_20241231_.txt
│   │   ├── Tegel_00430_19630101_20210505.txt
│   │   ├── bremen_00691_18900101_20241231.txt
│   │   ├── hannover_02014_19360101_20241231.txt
│   │   ├── koeln_02667_19570701_20241231.txt
│   │   ├── leipzig_02932_19340101_20241231.txt
│   │   ├── munich_01262_19920517_20241231.txt
│   │   ├── potsdam_0398718930101_20241231.txt
│   │   └── stuttgart_04931_19530101_20241231.txt
│   └── station_to_district.csv
├── docs
│   ├── Project5.drawio
│   └── requirements.md
├── notebooks
├── outputs
│   ├── agri_climate_merged.csv
│   ├── agriculture_clean.csv
│   ├── eda
│   │   ├── correlation_matrix.csv
│   │   ├── correlation_matrix.png
│   │   ├── scatter_yield_vs_RSK.png
│   │   ├── scatter_yield_vs_TMK.png
│   │   ├── time_series_Flensburg,_kreisfreie_Stadt.png
│   │   ├── time_series_Köln,_kreisfreie_Stadt.png
│   │   ├── time_series_Leipzig,_kreisfreie_Stadt.png
│   │   └── time_series_Potsdam,_kreisfreie_Stadt.png
│   └── parsed_climate.csv
└── src
    ├── eda_analysis.py
    ├── merge_agri_climate.py
    ├── parse_agriculture.py
    └── parse_climate.py
    ├── climate_clustering.py
    └── model_analysis.py

```

## Data Sources

- **Climate Data**: [DWD Climate Data Center](https://opendata.dwd.de/climate_environment/CDC/)
- **Agricultural Data**: [Thünen Institute](https://doi.org/10.3220/DATA20231117103252-0)

Both datasets are licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/).

## Requirements

- Python 3.11+
- Snakemake
- See `requirements.txt` for full list

Install via pip:

```bash
pip install -r requirements.txt
```

Or using Conda:

```bash
conda create -n sun-rain-grain --file requirements.txt
conda activate sun-rain-grain
```

- Clone this repository and set up your environment:

```bash
git clone https://gitup.uni-potsdam.de/khanal/sun-rain-grain.git
cd sun-rain-grain
```

## How to Run the Workflow

1. **Clone the repo**

```bash
git clone https://gitup.uni-potsdam.de/khanal/sun-rain-grain.git
cd sun-rain-grain
```

2. **Activate environment** (if using conda)

```bash
conda activate sun-rain-grain
```

3. **Execute full workflow**

```bash
snakemake --cores 1
```

Or run a specific rule:

```bash
snakemake outputs/agri_climate_merged.csv
```

## What the Workflow Does

| Step                  | Script                   | Output Description                                |
|-----------------------|--------------------------|---------------------------------------------------|
| Parse agriculture     | `parse_agriculture.py`   | Cleaned maize yield data                          |
| Parse DWD climate     | `parse_climate.py`       | District-wise average climate (TMK, RSK)          |
| Merge datasets        | `merge_agri_climate.py`  | Joined dataset on district and year               |
| Exploratory Analysis  | `eda_analysis.py`        | Correlations, scatter plots, time series          |
| Modeling              | `model_analysis.py`      | Linear/polynomial regression + lagged predictors  |
| Clustering            | `climate_clustering.py`  | KMeans-based district groupings                   |

---

## Outputs

- Correlation matrices (with and without lag)
- Time series and scatter plots for climate vs. yield
- Lagged regression summary
- Polynomial fits and prediction plots
- KMeans clustering visualization
- Outputs visualizations and model results to the `outputs/results` directory

---

## Tests

If tests are implemented:

```bash
pytest tests/
```

---

##  How to Contribute

- Please read the [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on how to contribute to this project.  
- See our [CODE OF CONDUCT](./CONDUCT.md) for expected behavior in this project.

##  Example: Load Climate Data (Pandas)

```python
import pandas as pd

df = pd.read_csv("data/raw/kl_Potsdam.txt", sep=";", skiprows=1)
df['MESS_DATUM'] = pd.to_datetime(df['MESS_DATUM'], format='%Y%m%d')
df[['TMK', 'RSK', 'SDK']].describe()
```

## Citation

If you use this workflow or any part of this project, please cite it using the metadata in the [`CITATION.cff`](CITATION.cff) file.

## License

This project is licensed under the MIT License (see \`LICENSE\`).  
The datasets are reused under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/), crediting DWD and Thünen Institute.

## Group 5: Sun Rain and Grain (Research Software Engineering)

- Poshan Khanal  
- Qazi Novera Tansue Nasa  
- Joudi Alzaeem

