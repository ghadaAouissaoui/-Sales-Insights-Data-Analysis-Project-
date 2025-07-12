# 📊 Sales Insights Dashboard – Power BI Project

Bienvenue dans mon projet **Power BI** réalisé dans le cadre de mon apprentissage en **Data Science** et **Business Intelligence**.

---

## 🎯 Objectifs du projet

- Créer un dashboard interactif Power BI connecté à MySQL
- Visualiser les ventes, clients, produits, marchés
- Appliquer DAX pour des KPI personnalisés
- Illustrer mes compétences en data analysis SQL & BI

---

## 🧱 Données utilisées

- Base de données `sales` contenant les tables :
  - `customers`
  - `transactions`
  - `products`
  - `markets`
  - `date`

---

## 📈 Contenu du dashboard

### Page 1 – Vue d’ensemble
- KPI : Revenus totaux, Ventes
- Tendance mensuelle
- Top 5 clients & produits
- 📌 Contribution au revenu par marché


## 🛠️ Technologies utilisées

- Power BI Desktop
- SQL (MySQL Workbench)
- DAX
- Power Query

---

## 🗃️ Analyse SQL utilisée

Voir le fichier : [`sql_analysis_script.sql`](./script.sql)

Exemples :
```sql
-- Total revenu et quantités
SELECT SUM(sales_amount), SUM(sales_qty) FROM sales.transactions;

-- Revenu par marché
SELECT market_code, SUM(sales_amount) FROM sales.transactions GROUP BY market_code;
