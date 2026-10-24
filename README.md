# AirWise India — AI-Powered Air Quality Prediction & Early Warning System

> **Inspired by India's National Clean Air Programme (NCAP)**  
> An intelligent, animated, full-stack environmental intelligence platform forecasting Indian AQI categories, mapping pollution danger zones, quantifying prediction uncertainty, and delivering life-saving public health advisories across all Indian states and union territories.

---

## 1. Project Overview & Problem Statement

Air pollution is one of the most critical public health challenges across the Indian subcontinent. Seasonal thermal inversions in the Indo-Gangetic Plains, post-harvest crop-residue stubble burning in October–November, dust storms in arid western zones, and heavy urban vehicular congestion often drive ground-level particulate matter concentrations to hazardous tiers.

**AirWise India** transforms passive monitoring dashboards into an active, predictive decision-support system by combining:
1. **Official CPCB / CAAQMS Telemetry:** Continuous ambient air quality monitoring data for all 8 standard pollutants ($\text{PM}_{2.5}$, $\text{PM}_{10}$, $\text{NO}_2$, $\text{SO}_2$, $\text{CO}$, $\text{O}_3$, $\text{NH}_3$, $\text{Pb}$).
2. **Micrometeorological Dispersion Physics:** Surface wind speeds, wind azimuth transport vectors, boundary-layer thermal inversion risks, and precipitation scavenging from IMD and Open-Meteo.
3. **Validated Machine Learning Forecasting:** Multi-horizon Random Forest ensemble predicting 6h, 24h, 3-day, and 7-day trajectories with calibrated empirical quantile uncertainty intervals ($80\%$ and $95\%$).
4. **Autonomous Early Warnings:** Categorized danger alerts (Severe Emergency, High-Risk, Rapid Deterioration, High $\text{PM}_{2.5}$, and Inversion Traps) with actionable, non-diagnostic protective guidance and direct 112 emergency service access.

---

## 2. Core Capabilities & 13 Dedicated Modules

| Module / Page | Purpose & Technical Highlight |
| :--- | :--- |
| **1. National Overview** | Hero dashboard, live India ticker, Top 5 cleanest vs Top 5 most polluted hotspots, NCAP mission progress (20%–40% PM reduction target across 131 non-attainment cities). |
| **2. Live AQI Dashboard** | Large animated SVG semicircle gauge, all 8 CPCB pollutant sub-indices, dominant pollutant identification, real-time meteorological sensor feeds, data provenance indicators. |
| **3. India Pollution Risk Map** | Full-screen interactive Leaflet map with OpenStreetMap tiles, 6 official Indian AQI color markers, station popups, current vs 24h forecast toggle, and state/severity filters. |
| **4. Location Detail Analysis** | Localized breakdown for any Indian location, local emission source profiles, neighboring station discovery, and dedicated **Delhi-NCR sub-zone disparity** (Delhi, Noida, Greater Noida, Ghaziabad, Gurugram, Faridabad). |
| **5. AI Forecast Dashboard** | 6-hour, 24-hour, 3-day, and 7-day multi-horizon predictions with shaded $80\%$ and $95\%$ calibrated prediction intervals, peak and lowest pollution windows, and actual vs predicted validation curves. |
| **6. Weather & Dispersion Intel** | Micrometeorological ventilation score gauge ($0–100$), thermal inversion risk detection, synoptic wind trajectory transport analysis, and plain-language atmospheric physics explainers. |
| **7. Danger Zone & Alert Center** | Categorized alert feed with distinct tiers (*Information*, *Caution*, *Warning*, *High-Risk Alert*, *Severe Pollution Alert*), filtering by state, city, severity, and alert type. |
| **8. Health & Safety Center** | Non-diagnostic health guidelines for all 6 AQI tiers, vulnerable population protocols (children, elderly, asthma/COPD, outdoor workers), indoor HEPA air filtration, and certified mask guide ($\text{N95/FFP2}$ vs surgical vs cloth). |
| **9. Emergency Instructions** | Direct red-flag emergency symptoms check, one-click mobile **112** call button, **102** ambulance access, hospital emergency transfer protocols, and statutory disclaimers. |
| **10. Multi-Location Comparison** | Side-by-side comparison of up to 4 stations with comparative Recharts bar charts, pollutant matrices, and an automated clearer-air assessment verdict. |
| **11. Historical Reports & CSV Export** | Historical trend charts across 24h, 7d, 30d, and seasonal cycles, plus downloadable clean CSV datasets with CPCB data provenance headers. |
| **12. How AirWise Works** | Interactive architecture flowchart, CPCB piecewise linear sub-index mathematics, feature engineering details, and model coverage limitations. |
| **13. Admin & Telemetry Health** | Real-time monitoring of CPCB ground sensors, IMD meteorological feeds, API network latencies, server status, and model evaluation metrics. |

---

## 3. Dynamic Location-Reactive Animated Background System

AirWise features an animated backdrop that adapts automatically to the selected Indian region and weather while maintaining dark-mode text contrast and readability:

- **Delhi-NCR:** Urban skyline silhouettes, iconic monuments, and a subtle particulate haze layer.
- **Jaipur, Rajasthan:** Warm amber and golden desert sunset tones with Hawa Mahal-inspired palace arches.
- **Mumbai, Maharashtra:** Arabian Sea coastal wave ripples, Marine Drive skyline, and marine breeze mist.
- **Bengaluru, Karnataka:** Garden City lush emerald canopy, cumulus clouds, and modern tech park towers.
- **Chennai, Tamil Nadu:** Coastal palms, Marina Beach wave contours, and maritime breeze.
- **Kolkata, West Bengal:** Howrah Bridge cantilever silhouette and Hooghly river ripples.
- **Shimla & Srinagar:** Himalayan snow-capped peaks, pine ridges, and cool mountain blue gradients.
- **Lucknow & Varanasi:** Sacred ghat steps, temple spires, and heritage architectural arches.
- **Ahmedabad, Hyderabad, Guwahati & All India:** Dynamic atmosphere adapting to geographic terrain and live weather parameters.

---

## 4. Machine Learning Forecasting Pipeline & Evaluation

### A. Time-Ordered Validation (Strict Anti-Leakage Split)
Trained on multi-year time-series data reflecting Indian meteorological realities (winter inversions, stubble burning in Oct–Nov, summer dust storms, and monsoon washout). Evaluated on an **80/20 chronological split** (train on past records, validate on future unseen records) to prevent lookahead data leakage.

### B. Benchmark: Random Forest Ensemble vs. Persistence Baseline
Following rigorous machine learning standards, our model was evaluated against a **simple persistence baseline** ($AQI_{t+k} = AQI_t$):

| Metric | Random Forest Ensemble | Persistence Baseline Model | Improvement |
| :--- | :---: | :---: | :---: |
| **Mean Absolute Error (MAE)** | **15.45** | 19.99 | **22.7% error reduction** |
| **Root Mean Squared Error (RMSE)** | **30.35** | 36.81 | **17.5% error reduction** |
| **CPCB Category Accuracy** | **85.32%** | 81.40% | **+3.92% gain** |
| **Weighted F1-Score** | **0.855** | 0.814 | **+0.041 gain** |
| **$R^2$ Variance Explained** | **0.956** | 0.935 | Strong predictive correlation |

### C. Calibrated Quantile Uncertainty Intervals
Instead of displaying arbitrary percentage confidence numbers, AirWise computes calibrated empirical residual quantiles from the validation set:
- **Illustrative 80% Prediction Interval:** $[\hat{y} - 18.59, \hat{y} + 27.01]$
- **Illustrative 95% Prediction Interval:** $[\hat{y} - 49.88, \hat{y} + 58.05]$

---

## 5. Technology Stack

- **Frontend:** React 18, TypeScript, Vite, Tailwind CSS, Lucide Icons, Framer Motion, Recharts, Leaflet with OpenStreetMap.
- **Backend:** Python 3.14, FastAPI, Pydantic, Uvicorn, Scikit-learn, NumPy, Pandas, Joblib.
- **Data Standards:** Central Pollution Control Board (CPCB) National AQI Breakpoints (2014/2015 Guidelines) and National Ambient Air Quality Standards (NAAQS).
- **APIs & Telemetry:** CPCB CAAQMS adapter interface, IMD meteorological adapter, Open-Meteo Air Quality & Weather API.

---

## 6. Project Directory Structure

```
AIR QUALITY PREDICTION/
├── backend/
│   ├── app/
│   │   ├── data/
│   │   │   └── india_stations.py          # 35+ verified CAAQMS stations across India
│   │   ├── models/
│   │   │   ├── train_pipeline.py          # Machine learning training & evaluation script
│   │   │   ├── aqi_forecast_model.joblib  # Trained Random Forest model artifact
│   │   │   └── model_evaluation_metrics.json # Saved validation metrics & quantiles
│   │   ├── routers/
│   │   │   ├── aqi.py                     # Current observation, historical trends, CSV export
│   │   │   ├── forecast.py                # Multi-horizon forecasts & model metrics
│   │   │   ├── alerts.py                  # Danger zones & warning rules
│   │   │   ├── weather.py                 # Dispersion scoring & wind trajectory analysis
│   │   │   ├── stations.py                # Hierarchical search & nearest station finder
│   │   │   └── admin.py                   # System reliability & data source status
│   │   ├── services/
│   │   │   ├── aqi_calculator.py          # Official CPCB sub-index piecewise interpolation
│   │   │   ├── prediction_service.py      # ML multi-horizon forecasting service
│   │   │   ├── weather_service.py         # Micrometeorological dispersion calculation
│   │   │   └── alert_engine.py            # Automated danger zone & warning rules
│   │   └── main.py                        # FastAPI application entrypoint with CORS
│   ├── database_schema.sql                # Complete PostgreSQL / SQLite schema
│   └── requirements.txt                   # Backend dependencies
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Navbar.tsx                 # Brand navbar, search, emergency, simulation
│   │   │   ├── DynamicBackground.tsx      # Location & weather reactive animated canvas
│   │   │   ├── LocationSelector.tsx       # Cascading selector, GPS, featured chips
│   │   │   ├── AqiGauge.tsx               # Animated SVG semicircle 6-color AQI gauge
│   │   │   ├── EmergencyModal.tsx         # 112 click-to-call modal
│   │   │   └── SimulationScenarioModal.tsx# Interactive NCR stubble smog presentation demo
│   │   ├── views/
│   │   │   ├── HomeOverviewView.tsx       # Home & National Overview
│   │   │   ├── LiveDashboardView.tsx      # Real-time CAAQMS station dashboard
│   │   │   ├── PollutionMapView.tsx       # Full Leaflet India Risk Map
│   │   │   ├── LocationDetailView.tsx     # Localized station & NCR sub-zone analysis
│   │   │   ├── ForecastDashboardView.tsx  # 6h/24h/3d/7d AI forecasts & eval plots
│   │   │   ├── WeatherIntelligenceView.tsx# Atmospheric dispersion & inversion analysis
│   │   │   ├── DangerAlertsView.tsx       # Dedicated danger zone & alert center
│   │   │   ├── PublicSafetyView.tsx       # Health guidance, sensitive groups, mask guide
│   │   │   ├── EmergencyView.tsx          # Dedicated emergency guidance page
│   │   │   ├── CompareLocationsView.tsx   # Up to 4 location side-by-side comparison
│   │   │   ├── HistoricalReportsView.tsx  # Trends & CSV data download
│   │   │   ├── HowAirWiseWorksView.tsx    # Architecture & CPCB mathematics
│   │   │   └── AdminDiagnosticsView.tsx   # Telemetry health & provider latencies
│   │   ├── api.ts                         # Frontend API client
│   │   ├── types.ts                       # TypeScript interfaces
│   │   ├── App.tsx                        # Master layout & view router
│   │   ├── main.tsx                       # React DOM root
│   │   └── index.css                      # Tailwind & Glassmorphism styles
│   ├── package.json
│   ├── tailwind.config.js
│   ├── vite.config.ts
│   └── tsconfig.json
├── .env.example                           # Safe configuration template without secrets
├── start_servers.bat                      # One-click Windows batch launcher
├── start_servers.ps1                      # PowerShell full-stack launcher
└── README.md                              # Complete system documentation
```

---

## 7. Installation & Quick Start

### Prerequisites
- Node.js LTS (v18+)
- Python 3.10+

### Option A: One-Click Launch (Windows)
Double-click `start_servers.bat` or run:
```powershell
.\start_servers.ps1
```

### Option B: Manual Setup

#### 1. Backend Setup
```bash
cd backend
pip install -r requirements.txt
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```
*Backend runs on `http://127.0.0.1:8000` with interactive Swagger API documentation at `http://127.0.0.1:8000/docs`.*

#### 2. Frontend Setup
```bash
cd frontend
npm install
npm run dev
```
*Frontend runs on `http://127.0.0.1:3000`.*

---

## 8. Competition Presentation Features

### Interactive Delhi-NCR Winter Smog & Stubble Burning Scenario
AirWise includes an interactive walkthrough mode built specifically for competition juries and live demonstrations (accessible via the **"Scenario Demo"** button on the navigation bar):

- **Phase 1 (10:00 AM):** Baseline Autumn Morning (AQI 165, Moderate). Fair convective mixing.
- **Phase 2 (02:30 PM):** Upstream Stubble Plume Transport. Steady North-Westerly winds ($4.1\text{ m/s}$) transport biomass smoke plumes from Punjab & Haryana into the Delhi-NCR basin.
- **Phase 3 (06:45 PM):** Twilight Inversion Trap. Winds drop to $0.9\text{ m/s}$, ground cools rapidly, creating a shallow thermal inversion lid ($280\text{ m}$) that spikes $\text{PM}_{2.5}$ to $195\text{ µg/m³}$ (AQI 348, Very Poor).
- **Phase 4 (08:00 PM):** AI Predictive Model Triggers. Random Forest forecasting engine projects emergency tier AQI ($432$, Severe) overnight with an $80\%$ uncertainty interval ($405–460$).
- **Phase 5 (08:15 PM):** Autonomous Public Safety Action. The system triggers high-risk alerts, school outdoor activity suspension advisories, and certified N95 respirator guidelines **12 hours before peak morning exposure**.

---

## 9. Data Sources, Integrity & Reliability Disclaimers

1. **Official CPCB Standards:** Sub-indices are calculated strictly according to Central Pollution Control Board guidelines ($I_p$ piecewise interpolation).
2. **Nearest Station Disclaimers:** When a rural district or unmonitored location is searched, AirWise displays its nearest verified CAAQMS station and explicitly displays the distance (e.g. *"Station is 14.2 km away — Nearby Station Reading"*) rather than silently inventing local measurements.
3. **Non-Diagnostic Public Safety:** Health instructions are non-diagnostic public environmental guidance. In medical emergencies, users are directed to dial **112**.

---

## 10. License

Developed for India's National Clean Air Programme (NCAP) awareness and air quality research. Open-source under the Apache 2.0 License.
