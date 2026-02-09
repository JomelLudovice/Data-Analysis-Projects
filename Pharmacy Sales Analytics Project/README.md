# Pharmacy Sales Analytics Project

## Project Overview
This project analyzes pharmacy sales data to evaluate **financial performance, geographic trends, store-level behavior, and product promotion effectiveness**. The analysis focuses on transforming transactional sales data into actionable insights that support **pricing, inventory planning, and promotional decision-making** at a business level.

---

## Objectives
- Assess overall sales and profitability performance across regions and locations  
- Identify high- and low-performing pharmacies and geographic areas  
- Evaluate product demand and the impact of promotions on sales outcomes  

---

## Tools & Technologies
- **SQL Server:** Data import, data cleaning, and aggregation  
- **Excel:** Pivot-based exploratory data analysis  
- **Power BI:** Data modeling, DAX measures, calculated columns, and interactive dashboard development  

---

## Dashboard Overview
The dashboard is structured into three analytical views to guide stakeholders from **macro-level performance** to **operational drivers**:
1. Geography & Finance  
2. Pharmacy & Location  
3. Product & Promotion  

---

## 1. Geography & Finance
<img width="1526" height="852" alt="01_geography finance_page_1" src="https://github.com/user-attachments/assets/1d83e4af-e252-4b2d-968b-15836015f473" />

**Key Findings:**
- **Revenue Concentration by Country:** Germany (€1.6M), France (€1.4M), and Italy (€1.3M) are the top revenue contributors, while Austria (€0.68M) underperforms—indicating uneven market maturity across countries.
- **Regional Performance Hotspots:** Lombardy (Italy), Hamburg (Germany), and Utrecht (Netherlands) lead regional revenue, showing that national performance is driven by a small number of high-performing regions.
- **Stable Demand with Seasonal Peak:** Monthly unit sales remain tightly ranged (34k–39k units) with stable margins (27–28%), while **July peaks at 39k units and €768k revenue**.

---

## 2. Pharmacy & Location
<img width="1526" height="845" alt="02_pharmacies location_page_2" src="https://github.com/user-attachments/assets/019e7a68-9243-4bc4-952b-8e61403a4ae2" />

**Key Findings:**
- **Performance Skew:** The top 10% of pharmacies generate **20% of total margin**, indicating moderate concentration where top performers matter, but overall profitability is broadly distributed.
- **Sales-to-Profit Efficiency:** An average **€5.43 margin per unit sold** suggests consistent profitability driven by volume efficiency rather than reliance on a small set of high-margin transactions.
- **Urban Demand Dominance:** Urban locations account for the highest customer volume, and the positive relationship between units sold and revenue confirms that higher foot traffic directly drives stronger financial performance.

---

## 3. Product & Promotion
<img width="1515" height="853" alt="03_product promotion_page_3" src="https://github.com/user-attachments/assets/332d8554-d725-47e5-9201-3a4bb3022b9f" />

**Key Findings:**
- **Limited Promotion Impact:** Non-promoted products account for **88% of units sold and 93% of total margin**, indicating that promotions play a supporting rather than primary role in revenue generation.
- **Category Profit Dynamics:** Prescription products deliver high margin at lower volumes, while OTC products drive high volume but lower margin—highlighting a clear trade-off between scale and profitability.
- **Brand Margin Leaders:** Margin contribution is driven by a mix of prescription and wellness brands, showing that profit leadership is not volume-dependent alone.

---

## Business Implications
- Optimize regional pricing and cost controls to address profitability gaps.
- Focus operational improvements and marketing efforts on underperforming pharmacy locations.
- Refine promotional strategies to balance sales uplift with margin sustainability.

---

## Notes
- Dashboard images are included to demonstrate analytical outcomes and insights.
- The analysis focuses on **business and market-level trends** rather than individual transaction-level recommendations.

---

## License
This project is licensed under the **MIT License**, allowing free use, modification, and distribution with attribution.

