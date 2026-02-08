## Project Overview

This project applies **Market Basket Analysis (MBA)** to the **Instacart** dataset to uncover product association patterns and cross-sell opportunities within an online grocery platform.

**Instacart** is an online grocery delivery and pickup service founded in 2012. It allows customers to order groceries from local retailers through a website or mobile app, with orders fulfilled by personal shoppers. Instacart operates as a **technology platform**, not a grocery store, connecting **customers, retailers, and shoppers** in a digital marketplace.

The objective of this analysis is to understand **how customers build their shopping baskets in an app-based environment** and translate those patterns into actionable insights for merchandising, recommendations, and marketing strategies.

---
## Dataset
**Source:** [Instacart Online Grocery Shopping Dataset  ](https://www.kaggle.com/datasets/yasserh/instacart-online-grocery-basket-analysis-dataset?resource=download&select=orders.csv)

The dataset consists of transaction-level order data representing customer purchases across multiple products.

Key entities used in this analysis include:
- **Orders** – Transaction-level records representing customer purchases  
- **Products** – Individual grocery items available on the platform  
- **Departments** – High-level product groupings used for category analysis  

---

## Data Preparation (SQL)

All transformations were performed using **SQL Server**.

### Key Steps
- Joined order, product, and transaction tables
- Generated **order-level product combinations**
- Filtered meaningful product pairs
- Aggregated metrics for analysis and visualization

### Output Table
The final table produced by the script:
- Represents **product-to-product associations**
- Is structured for **direct use in Excel dashboards**
- Supports KPI and visual analysis such as:
  - Frequency
  - Support
  - Confidence
  - Lift 
- Includes additional analytical views:
  - **Department-to-department pairings** (used for heatmap analysis)
  - **Top 10 Products by Order Count** for anchor product identification

---

## Market Basket Analysis Approach

- Analyzed **product co-occurrence within individual customer orders** to identify meaningful purchasing patterns  
- Quantified product relationships using **association metrics** such as frequency, support, confidence, and lift  
- Emphasized **interpretability and business usability**, ensuring results can be directly applied to cross-sell strategies, merchandising decisions, and in-app recommendations

---

## Dashboard & Visuals

📊 **Excel Dashboard**
<img width="1175" height="758" alt="instacart_mba_dashboard" src="https://github.com/user-attachments/assets/380ca5fb-0c95-491b-aba1-b4029c16407f" />
<img width="1260" height="608" alt="instacart_department_pairings_heatmap" src="https://github.com/user-attachments/assets/a0b28321-05ae-42dc-b708-97d5062b05e3" />


---
## Key Insights

- **The “Anchor” Effect:** Bananas (both Organic and Conventional) act as dominant basket drivers, appearing consistently across nearly all top-performing product association rules.
- **Strongest Product Association:** Organic Raspberries and Organic Strawberries exhibit the highest Lift score (3.63), indicating a strong natural affinity between complementary organic produce items.
- **Organic Category Loyalty:** Customers purchasing Organic Bananas show a **14%–20% confidence** of adding another organic item (Spinach, Avocado, or Berries) to their basket, highlighting strong category stickiness.
- **Cross-Sell Opportunity:** Organic Hass Avocados demonstrate the strongest individual pull toward bananas, with a **33% confidence rate**, making them a prime candidate for targeted cross-sell recommendations.
- **Department-Level Synergy:** Heatmap analysis reveals a dominant pairing between **Produce** and **Dairy & Eggs**, totaling **71,356 joint orders**. This pairing outperforms the second- and third-ranked department combinations by over **60%**, identifying it as the primary engine of cross-category traffic on the platform.

---
  
## Business Applications

This analysis supports multiple Instacart-specific business use cases, including:

- **Cross-sell recommendations** within the mobile and web app
- **Bundle strategy optimization** for frequently co-purchased items
- **In-app marketing strategies**, such as:
  - “Frequently bought together” suggestions
  - Personalized add-on prompts during checkout
  - Category-level promotions based on department synergies}

---

## Repository Structure
<img width="517" height="316" alt="structure mba" src="https://github.com/user-attachments/assets/57f9c05c-7115-4e41-b94e-fc0b6379be56" />

---

## License
This project is licensed under the **MIT License**.

