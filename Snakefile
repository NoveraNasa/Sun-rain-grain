# === CONFIG ===
configfile: "config/config.yaml"

# === RULE: default target ===
rule all:
    input:
        "outputs/agriculture_clean.csv",
        "outputs/parsed_climate.csv",
        "outputs/agri_climate_merged.csv",
        "outputs/results/model_summary_interaction.txt",
        "outputs/results/actual_vs_predicted_yield_interaction.png",
        "outputs/results/residuals_vs_fitted.png",
        "outputs/results/poly_fit_yield_vs_TMK.png",
        "outputs/results/poly_fit_yield_vs_RSK.png",
        "outputs/results/city_climate_clusters.png"

# === RULE: Parse Agriculture Data ===
rule parse_agriculture:
    input:
        "data/raw/Agricultural_data.csv"
    output:
        "outputs/agriculture_clean.csv"
    shell:
        "python src/parse_agriculture.py -i {input} -o {output}"

# === RULE: Parse Climate Data ===
rule parse_climate:
    input:
        expand("data/raw/{city}", city=[
            "Frankfurt_01424_19851101_20241231_.txt",
            "Tegel_00430_19630101_20210505.txt",
            "bremen_00691_18900101_20241231.txt",
            "hannover_02014_19360101_20241231.txt",
            "koeln_02667_19570701_20241231.txt",
            "leipzig_02932_19340101_20241231.txt",
            "munich_01262_19920517_20241231.txt",
            "potsdam_0398718930101_20241231.txt",
            "stuttgart_04931_19530101_20241231.txt"
        ])
    output:
        "outputs/parsed_climate.csv"
    shell:
        "python src/parse_climate.py -i {input} -o {output}"

# === RULE: Merge Agriculture and Climate Data ===
rule merge_agriculture_climate:
    input:
        agri="outputs/agriculture_clean.csv",
        climate="outputs/parsed_climate.csv"
    output:
        "outputs/agri_climate_merged.csv"
    shell:
        """
        python src/merge_agri_climate.py \
            -a {input.agri} \
            -c {input.climate} \
            -o {output}
        """

# === RULE: Model Analysis (with interaction + residuals) ===
rule model_analysis:
    input:
        "outputs/agri_climate_merged.csv"
    output:
        "outputs/results/model_summary_interaction.txt",
        "outputs/results/actual_vs_predicted_yield_interaction.png",
        "outputs/results/residuals_vs_fitted.png",
        "outputs/results/poly_fit_yield_vs_TMK.png",
        "outputs/results/poly_fit_yield_vs_RSK.png"
    shell:
        "python src/model_analysis.py -i {input} -o outputs/results"

# === RULE: Climate Clustering ===
rule climate_clustering:
    input:
        "outputs/agri_climate_merged.csv"
    output:
        "outputs/results/city_climate_clusters.png"
    shell:
        "python src/climate_clustering.py -i {input} -o outputs/results"
