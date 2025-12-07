# 🛒 Big Data Analytics: Diagnosing Profitability in Retail

<p align="center">
  <img src="[ضع-هنا-رابط-صورة-مميزة-تمثل-المشروع]" alt="Big Data Project Banner" width="90%"/>
</p>

## 🌟 Business Problem & Objective

In the fast-paced retail sector, understanding the true drivers of profitability is critical. This project addresses a common business challenge: a disconnect between high sales volume and inconsistent profits. The primary objective was to analyze a large transactional dataset for "MegaMart" to diagnose the root causes of profit loss and identify opportunities for sustainable growth.

This wasn't just about running queries; it was about designing an end-to-end Big Data strategy, from infrastructure proposal to multi-faceted data analysis.

---

## 🏗️ Proposed Big Data Architecture: A Modern Data Lakehouse

A key part of this project was to think beyond the immediate analysis and propose a scalable, enterprise-grade solution for handling MegaMart's data.

*   **Strategy:** An end-to-end **Data Lakehouse** architecture built on cloud services.
*   **Storage:** Leveraging **Object Storage (like AWS S3)** for cost-effective, scalable storage of both structured and unstructured data.
*   **Processing:** Utilizing a **Batch Processing** model with a Master-Worker architecture (inspired by MapReduce) to efficiently handle large-scale analytical jobs.
*   **Governance:** Implementing strong data governance, security, and privacy principles, including data lineage, encryption, and access controls.

This proposal demonstrates a strategic understanding of modern data engineering principles and how to solve Big Data challenges like Volume, Velocity, and Variety.

---

## 🧹 Data Quality & Curation

"Garbage in, garbage out." The first practical step was a rigorous data quality assessment and curation process using the **DigiXT platform**.

1.  **Initial Quality Check:** An automated test suite was run on the raw dataset, identifying critical issues including:
    *   **Completeness:** Over 22% of records had missing `order_date` values.
    *   **Validity:** 9 records contained a logical anomaly (negative `quantity`).
    *   **Outliers:** Significant outliers were detected in `sales` and `profit`, which were strategically preserved as they represent real business events.
2.  **Curation:** The dataset was cleaned by removing records with missing values and logical errors.
3.  **Final Validation:** The test suite was re-run on the cleaned data, confirming the resolution of all identified quality issues.

> **[📂 See the full Data Quality workflow and results in the `1_Data_Quality_and_Curation` folder.](./1_Data_Quality_and_Curation)**

---

## 🔬 Multi-Faceted Data Analysis

The core of the project involved a deep-dive analysis using both structured and unstructured data.

### 1. SQL-Based Exploratory Data Analysis (EDA)
Using the Trino SQL engine, a series of simple and advanced queries were executed to uncover key patterns. This included `GROUP BY` queries to analyze profitability at different discount levels and `JOIN` queries to identify "Superstar" products (high sales, high profit) and "Hidden Gem" products (high profit, low sales).

> **[💻 Explore all SQL scripts in the `2_SQL_Analysis` folder.](./2_SQL_Analysis)**

### 2. Unstructured Data - Sentiment Analysis with MongoDB
To understand the "why" behind the numbers, customer reviews (unstructured text data) were analyzed.
*   **Technology:** A **MongoDB** NoSQL database was created to store and query customer reviews.
*   **Process:** Reviews were tagged with a sentiment (Positive/Negative) and inserted as documents into a collection.
*   **Insight:** The Aggregation Pipeline was used to count sentiment distribution, revealing a correlation between negative reviews (e.g., "bad quality") and products associated with high discounts and low profitability.

> **[📂 See the MongoDB process in the `3_Sentiment_Analysis_MongoDB` folder.](./3_Sentiment_Analysis_MongoDB)**

---

## 💡 Key Findings & Business Recommendations

1.  **The "Discount Trap":** The analysis proved a direct link between high discounts and profit loss, with a critical **"tipping point" at a 30% discount**, where sales consistently become unprofitable.
2.  **Product Vulnerability:** A one-size-fits-all discount strategy is damaging. "Vulnerable" categories like 'Tables' and 'Bookcases' lose money even with modest discounts.
3.  **Geographic Disparities:** Performance varies significantly by region, with some cities like Philadelphia and Houston being major loss centers.
4.  **Sentiment as a Warning System:** Negative customer reviews are a powerful early warning signal for problematic products that are draining profit.

**Top Recommendation:** Implement a data-driven, category-specific discount policy. Cap discounts on "vulnerable" products, focus marketing on "superstar" and "hidden gem" products, and integrate customer sentiment into the regular business intelligence cycle.

---

## 🛠️ Technologies & Skills

*   **Big Data Concepts:** `Data Lakehouse Architecture`, `Batch Processing`, `Distributed Storage`, `Data Governance`
*   **Databases:** `SQL (Trino)`, `NoSQL (MongoDB)`
*   **Platforms & Tools:** `DigiXT`, `MongoDB Compass`, `Git`, `GitHub`
*   **Core Skills:** `Data Quality Assurance`, `Exploratory Data Analysis (EDA)`, `Sentiment Analysis`, `Business Acumen`

---

## 📂 Project Documentation

*   **[`4_Documentation/`](./4_Documentation):** Contains the final detailed project report and presentation.

---

## 👥 The Team

This project was a successful collaboration between:

*   **Hessa Khalfan** ([@Heskal](https://github.com/Heskal ))
*   **Maryam Ali**

---

## 📜 License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.
