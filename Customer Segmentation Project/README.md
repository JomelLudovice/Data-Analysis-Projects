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

- **61% of customers belong to the Active group**
- **Platinum customers contribute 54% of total revenue**, despite having fewer customers (813) than Loyal customers (944)
- **Revenue Concentration:**  
  The Active group represents ~60% of customers but generates **81% of total revenue**, making it the core business driver
- **“Can’t Lose Them” Risk:**  
  40 high-value customers have contributed nearly **$70,000** in revenue but have not ordered in over **200 days**, signaling urgent reactivation opportunities

---

## Repository Structure
