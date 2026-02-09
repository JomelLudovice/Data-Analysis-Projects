# Cebu City Airbnb Market Analysis

## Project Overview
This project analyzes the **Airbnb market in Cebu City, Philippines** to understand listing characteristics, pricing behavior, booking trends, and occupancy performance.

**Airbnb** is an online marketplace that connects hosts who offer short-term accommodations with guests seeking temporary lodging. It operates as a **digital platform**, enabling hosts to list properties and travelers to book stays through a web or mobile application.

**Market analysis** in this context involves examining supply, demand, pricing, and performance patterns across listings to identify trends, opportunities, and competitive dynamics within the short-term rental market.

By combining **SQL Server, Excel, and Power BI**, this project transforms raw listing and booking data into a structured, multi-page dashboard that delivers actionable insights for hosts, investors, and property managers.

---

## Objectives
- Analyze the supply and distribution of Airbnb listings across Cebu City
- Understand pricing patterns and booking behavior across different property types
- Evaluate occupancy performance to identify high- and low-performing listings
- Provide data-driven insights to support pricing, investment, and optimization decisions

---
## Dataset
**Source:** https://www.airroi.com/data-portal/markets/cebu-city-philippines

---

## Tools & Technologies

- **SQL Server**
  - Data import and table creation
  - Data cleaning and transformation
  - Filtering and preparation for analysis

- **Excel**
  - Exploratory Data Analysis (EDA)
  - Pivot tables for trend validation and metric exploration

- **Power BI**
  - Data modeling (connecting two tables)
  - DAX measures and calculated columns
  - Interactive dashboard development

---

## Dashboard Overview

The Power BI dashboard is structured into **four analytical pages**, each addressing a key aspect of the Cebu City Airbnb market.

---

## 1. Market Overview

<img width="1325" height="728" alt="01_powerBI_dashboard_page_1" src="https://github.com/user-attachments/assets/f91cce55-a102-4996-a3e4-7b6c5d80a16e" />

**Key Findings:**
- **Market Performance:** Cebu City Airbnb listings generated **₱78.8M in revenue from 300 listings (Jan–Dec 2025)**, with peak demand in **January (₱11M)** and weakest performance in **October (₱4.41M)**, highlighting strong seasonality.
- **Pricing & Yield Trend:** Average Daily Rate declined from **₱2,522 (TTM)** to **₱2,363 (last 90 days)**, alongside a sharper drop in **RevPAR (₱781 → ₱575)**, indicating softening short-term demand.
- **Pricing Realization:** From **January to August**, the average **booked rate exceeded the listed daily rate**, indicating that guests were willing to pay at or above published prices during high-demand periods. From **September to December**, this relationship reversed, with booked rates falling below listed rates—suggesting increased discounting and higher price sensitivity during off-peak months.

---

## 2. Listing Characteristics

<img width="1522" height="841" alt="02_powerBI_dashboard_page_2" src="https://github.com/user-attachments/assets/161e1ec1-ee44-4f2f-afab-ec3dc7ad60c9" />


**Key Findings:**
- **Supply Concentration:** The market is heavily concentrated in **condominium-type listings (73%)**, while **entire-home units account for 90% of room types**, indicating limited diversity in both property structure and accommodation format.
- **Unit Profile:** Inventory is primarily composed of **studio to 1-bedroom units**, aligning supply with short-stay and small-group travelers.
- **Guest Expectations:** Near-universal availability of core amenities (aircon, WiFi, TV, kitchen) points to a **commoditized market**, where pricing, location, and guest experience drive differentiation.


---

## 3. Booking

<img width="1522" height="842" alt="03_powerBI_dashboard_page_3" src="https://github.com/user-attachments/assets/99239fae-3268-4d8e-a858-05925c623b9c" />


**Key Findings:**
- **Guest Composition:** Demand is led by **small to mid-sized groups (1–6 guests)**, consistent with prevailing unit sizes.
- **Stay Patterns:** Most reservations fall within **short- to medium-term stays (1–90 days)**, reinforcing Airbnb’s role as a flexible accommodation option.
- **Advance Planning:** Longer booking lead times in **January (51 days)** and **December (47 days)** indicate strong advance planning during peak travel seasons.


---

## 4. Occupancy & Pricing Behavior

<img width="1527" height="805" alt="04_powerBI_dashboard_page_4" src="https://github.com/user-attachments/assets/9ecbc492-b45f-4ead-9cbc-67f8691c35ad" />


**Key Findings:**
- **Occupancy Leaders:** **Homes outperform condominiums in occupancy** (36% vs. 31% TTM), despite condos being the dominant supply type, signaling a potential demand–supply imbalance.
- **Pricing Power by Type:** Villas command the highest rates, reflecting premium positioning, while condos and private rooms operate within tighter pricing ranges due to higher competition.
- **Guest Experience Signal:** Villas achieve the highest overall ratings, while condominiums lead in review volume and location scores—highlighting a trade-off between **experience-driven satisfaction** and **scale-driven trust**.
---

## Business Implications
- Hosts can refine pricing and availability strategies to improve occupancy and revenue.
- Investors can identify high-performing neighborhoods and property types.
- Market-level insights support data-driven decisions in Cebu City’s short-term rental market.

---

## Notes
- Dashboard images are included to demonstrate analytical outcomes and insights.
- The analysis focuses on **market-level trends** rather than individual property recommendations.

---

## License
This project is licensed under the **MIT License**.

