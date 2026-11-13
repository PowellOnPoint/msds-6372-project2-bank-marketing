# Bank Marketing Analysis

**MSDS 6372 — Applied Statistics: Inference and Modeling**
**Southern Methodist University** · Jacob Turner · Fall 2026

Classification: whether a client subscribes to a term deposit after a telephone marketing contact.

## Repository structure

```
Project 2/
├── Data/
│   ├── bank-full.csv                  # 45,211 rows; later extract
│   ├── bank.csv                       # 4,521 rows; 10% sample of bank-full.csv
│   ├── bank-names.txt
│   ├── bank-additional-full.csv       # 41,188 rows; earlier extract plus macro indicators
│   ├── bank-additional.csv            # 4,119 rows; 10% sample of bank-additional-full.csv
│   └── bank-additional-names.txt
├── Dev/                               # drafts
├── Docs/                              # pre-production writeups; prompt is local only
├── README.md
└── msds-6372-project2-bank.Rproj
```

## Project overview

A Portuguese bank ran telephone campaigns, from May 2008 through November 2010, offering a term deposit. The binary response `y` records whether the client subscribed (`yes` or `no`).

**Objective 1** EDA & Modeling for Interpretation

**Objective 2** Modeling for Prediction

## Data

| File | Rows | Columns including `y` | What the extract adds |
|---|---:|---:|---|
| `bank-full.csv` | 45,211 | 17 | Client fields include `balance`. Campaign timing uses `day` and `month`. `contact` includes `unknown`. |
| `bank.csv` | 4,521 | 17 | Publisher's 10% sample of `bank-full.csv`. |
| `bank-additional-full.csv` | 41,188 | 21 | Earlier client coding, plus `emp.var.rate`, `cons.price.idx`, `cons.conf.idx`, `euribor3m`, and `nr.employed`. |
| `bank-additional.csv` | 4,119 | 21 | Publisher's 10% sample of `bank-additional-full.csv`. |

## Project status

| Step | Pipeline stage | Status | Deadline | Notes | 
|---|---|---|---|---|
| 1 | Ingest & Tidy | In Progress| Friday, Nov 13, 2026 | Determine train/test split, null/duplicate check, chose dataset, cleaning summary|
| 2 | Exploratory Data Analysis | Not started | Tuesday, Nov 17, 2026 | Practical vs statistical significance of important factors, plots, PCA determination |
| 3 | Model: Objective 1 | Not started | Tuesday, Nov 24, 2026 | Additive models. Baseline: one continuous coefficient, one categorical coefficient for Obj 2. Interpretation: more additive terms if necessary, with confidence intervals. AIC determination. |
| 4 | Model: Objective 2 | Not started |  Tuesday, Dec 1, 2026 | 4-5 models. Complex logistic regression, LDA, QDA, and one nonparametric model. Validation table, threshold, ROC panel, final recommendation. |
| 5 | Communicate | Not started | Thursday, Dec 3, 2026. | Finish slides and r summary. Introduction, EDA, additive model, nonadditive model, model comparison, conclusions. |
| 6 | Submission | Not started | Monday, 6 December 2026. |  |

## Getting started

1. Clone `https://github.com/PowellOnPoint/msds-6372-project2-bank-marketing`.
2. Open `msds-6372-project2-bank.Rproj` in RStudio. The project uses UTF-8 and two-space indentation. The workspace is not saved on exit.
3. Read an extract with the semicolon separator. From `Dev/` or `Docs/`:

```r
bank <- read.csv("../Data/<file>.csv", sep = ";")
```

Categorical columns arrive as character vectors under R 4.0 and later. Convert a column to a factor when the model requires a factor.

4. Put draft notebooks in `Dev/` or `Docs/`. Copy a finished R file and the slide deck to the repository root.
5. Knit an `.Rmd` before pushing the matching HTML.


## Authors

- Aaron Powell – MSDS Candidate, Southern Methodist University (`PowellOnPoint`)
- Isabella Westlauer – MSDS Candidate, Southern Methodist University (`AST-Isabella`)

## Acknowledgments

- Course instructor: Dr. Jacob Turner.
- Moro, S., Rita, P., & Cortez, P. (2014). Bank Marketing [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5K306
- Moro, S., Cortez, P., & Rita, P. (2014). A data-driven approach to predict the success of bank telemarketing. *Decision Support Systems*. https://doi.org/10.1016/j.dss.2014.03.001
- Moro, S., Laureano, R., & Cortez, P. (2011). Using data mining for bank direct marketing: An application of the CRISP-DM methodology. In P. Novais et al. (Eds.), *Proceedings of the European Simulation and Modelling Conference — ESM'2011* (pp. 117–121). EUROSIS.
