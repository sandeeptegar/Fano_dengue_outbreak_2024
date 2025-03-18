# Instructions to Run the Code

## 1. *Ae. albopictus* Population Dynamics

**Main code file:** albopictus_fano.ipynb  
**Supporting function file:** AlbopictusFun.jl  

### Output:  
This script reproduces the population dynamics of adult female *Aedes albopictus* and their oviposition activity.  

### Required Data:  
- Data files: `AMgam.csv`, `Car_Tol_1.csv`, `Fin_LSurv.csv`, `LDgam.csv`, `WL_re.csv`  
- Climate file: `latitude_longitude.csv`  
  (For Fano: latitude = 43.82, longitude = 13.026)
- Source: [ERA5-Land hourly data from 1950 to present](https://cds.climate.copernicus.eu/datasets/reanalysis-era5-land?tab=overview)   

---

## 2. Dengue Outbreak Simulation

**Main code file:** dengue_fano.ipynb  
**Supporting function files:** DengueFun.jl, ErrorFun.jl  

### Output:  
This script identifies the probable seeding dates and reproduces the dengue outbreak dynamics.  

### Required Data:  
- Data files: `AMgam.csv`, `Car_Tol_1.csv`, `Fin_LSurv.csv`, `LDgam.csv`, `WL_re.csv`  
- Climate file: `latitude_longitude.csv`  
  (For Fano: latitude = 43.82, longitude = 13.026)
- Reported cases: `fano_data.csv`
- Source: [Sacco et al. (2024)](https://doi.org/10.2807/1560-7917.ES.2024.29.47.2400713)  

---

## 3. Climate Averaging

**Main code file:** clim_avg.ipynb  

### Output:  
This script calculates the climate average for the period 2019–2023 on the selected dates.  

### Required Data:  
- Climate file: `fano_climate.csv` (same file used in the above scripts)  

---

## 4. How to Reproduce Climate Scenarios

### Scenario A (baseline):  
- Use the original climate file: `latitude_longitude.csv`  
- Run the Dengue Outbreak code  

### Scenario B:  
- Modify the original climate file by replacing the entries for September 13 and 14 with the corresponding averaged entries from 2019–2023.  
- Run the Dengue Outbreak code.  

### Scenario C:  
- Modify the original climate file by replacing the entries for September 13–24 with the corresponding averaged entries from 2019–2023.  
- Run the Dengue Outbreak code.  

---

## 5. Fano Population Estimates Near the Outbreak Epicenter

**Main code file:** fano_population.R  

### Output:  
This script calculates the average population density per 4 sq. km around the outbreak epicenter in Fano.  

### Required Data:  
- Population data per sq. km around Fano city center  
- Source: [Eurostat - Population density data](https://ec.europa.eu/eurostat/statistics-explained/index.php?oldid=596753)  
