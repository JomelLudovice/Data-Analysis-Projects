# Customer Segmentation Analysis (RFM)

## Project Overview
This project performs **customer segmentation using RFM (Recency, Frequency, Monetary) analysis** on an online retail dataset. The goal is to classify customers based on purchasing behavior and translate these segments into **actionable business insights** for retention, reactivation, and revenue optimization.

The analysis is conducted entirely in **Excel**, emphasizing analytical logic, transparency of calculations, and business interpretation.

---

## Dataset

**Dataset Name:** `Online_retail_store`

Transaction-level e-commerce data with the following fields:

| Column | Description |
|------|-------------|
| **InvoiceNo** | Unique identifier for each transaction |
| **StockCode** | Unique product code |
| **Description** | Product name |
| **Quantity** | Number of units purchased per transaction |
| **InvoiceDate** | Date and time of purchase |
| **UnitPrice** | Price per unit of the product |
| **CustomerID** | Unique identifier for each customer |
| **Country** | Country where the customer is located |

---

## Data Preparation

- Filtered relevant transaction records
- Added a derived column:
  - **Total Price** = `UnitPrice × Quantity`
- Aggregated data at the **customer level**
- Computed key behavioral metrics:
  - **Recency** – days since last purchase
  - **Frequency** – number of transactions
  - **Monetary** – total customer spend

---

## RFM Methodology

### 1. RFM Scoring
- Customers were scored on **Recency, Frequency, and Monetary** using percentile-based ranking
- Higher scores represent stronger customer engagement and value

### 2. Segmentation Logic
Customers were classified into the following segments:

- **Platinum Customers**
- **Loyal Customers**
- **Potential Loyalists**
- **New Customers**
- **Promising**
- **Need Attention**
- **About to Sleep**
- **At Risk**
- **Can’t Lose Them**
- **Hibernating**
- **Lost**

### 3. Behavioral Grouping
Segments were further grouped for strategic analysis:

- **Active**
  - Platinum, Loyal, Potential Loyalists, New, Promising
- **Slipping**
  - Need Attention, About to Sleep
- **Inactive**
  - At Risk, Can’t Lose Them, Hibernating, Lost

---

## Tools & Technologies

**Excel (End-to-End Analysis)**
- Data aggregation and transformation
- Pivot tables for customer-level analysis
- RFM scoring and segmentation logic

### Key Excel Functions Used
- `IFS()` – customer segment classification
- `OR()` – conditional grouping logic
- `PERCENTRANK.INC()` – RFM score normalization
- `MATCH()` – score-to-segment mapping

Sample formulas and logic are included as images for transparency and reproducibility.
Segment:
<img width="400" height="295" alt="segment" src="https://github.com/user-attachments/assets/88e9bf8a-1397-43d7-8b87-37deb302203c" />

Group:
<img width="902" height="122" alt="group" src="https://github.com/user-attachments/assets/990fba88-aa0a-4826-b1a2-d1000d7546c7" />

---

## Dashboard & Visuals

📊 **Customer Segmentation Dashboard**
<img width="947" height="967" alt="03_dashboard_overview" src="https://github.com/user-attachments/assets/a4f95e63-eec8-4508-9a47-51a8b5e56ef8" />

The dashboard summarizes:
- Customer distribution by segment
- Revenue contribution per segment
- Active vs Slipping vs Inactive groups
- High-risk, high-value customer identification

---

## Key Insights

- **Active Customer Dominance:** 61% of customers fall into the **Active** group, representing the primary revenue-generating audience for the business.
- **Platinum Segment Influence:** Although smaller in size (813 customers vs. 944 Loyal customers), **Platinum customers drive 54% of total revenue**, demonstrating their outsized contribution to profitability.
- **Revenue Concentration:** The **Active group**, which comprises just over half of all customers, generates **81% of total revenue**, underscoring the strategic importance of retaining and nurturing this core segment.
- **Critical Retention Opportunity – “Can’t Lose Them”:** 40 high-value customers have spent nearly **$70,000** but have not purchased in over **200 days**, highlighting an urgent opportunity for targeted reactivation campaigns.

---

## Repository Structure
<img width="350" height="242" alt="structure" src="https://github.com/user-attachments/assets/955310c9-8220-481c-a4d0-14ffb1e91eb6" />

---

## Business Applications
- Targeted marketing campaigns
- Customer retention and reactivation strategies
- Revenue risk identification
- Customer lifecycle management

---

## License
This project is licensed under the **MIT License**.

