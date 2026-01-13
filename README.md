# 🛒 Walmart Sales Analysis  

This project is all about exploring and analyzing Walmart sales data.  
This is the full workflow:  

1. **Cleaned the raw dataset** using Python (pandas).  
2. **Saved the cleaned dataset** for later use.  
3. **Imported it into PostgreSQL** using SQLAlchemy.  
4. **Wrote SQL queries** to analyze sales performance.  
5. **Documented the process** with notes and screenshots in Word.  
6. **Built a dashboard in Excel** to visualize the insights.  

---

## 🚀 What I Did  

- **Data Cleaning (Python + Pandas):**  
  - Handled missing values, corrected data types, and saved a new file: `Cleaned_Walmart_Sales.csv`.  

- **Database Work (PostgreSQL):**  
  - Imported the cleaned dataset into a PostgreSQL database.  
  - Wrote SQL queries to answer questions like:  
    - Which stores had the highest total sales?  
    - What were the average weekly sales per department?  
    - How did sales change over time?  

- **Documentation:**  
  - Took screenshots of queries + results.  
  - Created a Word document as reference material.  

- **Dashboard (Excel):**  
  - Used pivot tables and charts to create a sales dashboard.  
  - Summarized key metrics and trends.  

---

## 🛠 Tools & Tech  

- **Python:** Pandas, Matplotlib, Seaborn, SQLAlchemy  
- **PostgreSQL:** SQL queries & storage  
- **Excel:** Dashboard creation  
- **Word:** Reference documentation  

---

## 📂 Project Structure  

Walmart-Sales-Analysis/
│
├── data/                  # Raw & cleaned datasets
├── notebooks/             # Jupyter notebooks (data cleaning)
├── sql/                   # SQL queries + screenshots
├── dashboard/             # Excel dashboard
├── docs/                  # Word reference material
├── requirements.txt       # Python dependencies
└── README.md              # Project overview

## ⚡ How to Run  

1. Clone this repo  
git clone https://github.com/your-username/walmart-sales-analysis.git
cd walmart-sales-analysis

2. Install dependencies:
pip install -r requirements.txt

3. Open the notebook:
jupyter notebook notebooks/data_cleaning.ipynb
