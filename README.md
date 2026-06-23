# Real-Time Bidding (RTB) Floor Price Optimization Engine

## 📌 Project Overview
In programmatic advertising, setting incorrect floor prices causes substantial value loss. If floors are too low, buyers win premium slots under market value; if floors are too high, the ad slots go completely unfilled. 

This repository contains an automated yield optimization engine built with SQL. It analyzes large-scale historical bidding logs, measures real-time auction win rates across different ad units and device formats, and executes rule-based conditional pricing strategies to maximize publisher ad revenue.

---

## 🏢 Business Problem Context
A publisher network noticed stagnant programmatic yield despite strong traffic volumes. Because floor prices were static and updated manually across thousands of line items, the network was unable to adapt to moving market demand. 

This project solves that scalability limitation by building an algorithmic data audit to flag mispriced inventory automatically.

---

## 🛠️ Tech Stack & Database Architecture
- **Language:** SQL (Structured Query Language)
- **Concepts Applied:** Aggregate Data Analysis, Conditional Logic Automation (`CASE WHEN`), Multi-dimensional Grouping, Statistical Threshold Filtering (`HAVING`).

The operational architecture relies on the core production logging table:
- `Bid_Landscape_Logs`: Houses every historical bid submission, CPM bid amount, location tag, and victory state.
