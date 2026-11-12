# Bank Marketing Analysis

**MSDS 6372 — Applied Statistics: Inference and Modeling**
**Southern Methodist University** · Jacob Turner · Fall 2026

Public group repository for Project 2. The classification target is whether a client subscribes to a term deposit after a telephone marketing contact.

## Repository structure

The repository root holds finished work: the submitted R file, the slide deck, and the recording link. `Dev/` holds exploratory scripts and draft notebooks. `Docs/` holds pre-production writeups. `Data/` holds the UCI extracts.

Code in `Dev/` or `Docs/` reads a file as `../Data/<file>.csv`. Code at the repository root reads the same file as `Data/<file>.csv`. R accepts the forward slash on macOS and on Windows. The field separator in every extract is a semicolon.

The instructor prompt, `Docs/Project2Details2026.docx`, stays on each machine. That file is listed in `.gitignore`.

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

Open `msds-6372-project2-bank.Rproj` in RStudio before knitting. Knit with rmarkdown to `html_document`.

## Project overview

A Portuguese bank ran telephone campaigns, from May 2008 through November 2010, offering a term deposit. The binary response `y` records whether the client subscribed (`yes` or `no`).

The project has two objectives, both estimated on a training sample and judged for prediction on a held-out validation sample.

Objective 1 is an additive logistic regression for interpretation. The mean model is additive on the logit scale. Training-set comparisons use AIC. The writeup reports coefficients, confidence intervals, and a practical-versus-statistical reading of the factors the group treats as important. Interactions stay out of this model unless the group later records a reason to break that rule.

Objective 2 prioritizes prediction. The Objective 1 fit is the baseline. The comparison set adds a complex logistic regression (interactions or polynomial terms), linear discriminant analysis, quadratic discriminant analysis, and at least one nonparametric classifier available in the course (k-nearest neighbors, a classification tree, or a random forest). Each model reports sensitivity, specificity, prevalence, positive predictive value, negative predictive value, and area under the ROC curve on the validation sample, and states the classification threshold that produced the confusion-matrix metrics. A panel of ROC curves supports the comparison. Principal components analysis is in scope when the correlation structure gives it a clear job. The metric the group chooses to prioritize, and the threshold rule that follows from that choice, are still open.

The submitted package is one R file, one PowerPoint deck, and one recording no longer than 20 minutes. The recording covers introduction, exploratory data analysis, the additive logistic regression, the nonadditive logistic regression, the model comparison, and the conclusions.

The work split is open. The group schedule sets that decision for Friday, 13 November 2026.

## Data

Both extracts from the UCI Bank Marketing record are in `Data/`. The analysis file is not chosen. Row counts below were checked against the files on 12 November 2026. The 10% files are the publisher's samples for heavier algorithms. Those samples are not a train/validation split.

| File | Rows | Columns including `y` | What the extract adds |
|---|---:|---:|---|
| `bank-full.csv` | 45,211 | 17 | Client fields include `balance`. Campaign timing uses `day` and `month`. `contact` includes `unknown`. |
| `bank.csv` | 4,521 | 17 | Publisher's 10% sample of `bank-full.csv`. |
| `bank-additional-full.csv` | 41,188 | 21 | Earlier client coding, plus `emp.var.rate`, `cons.price.idx`, `cons.conf.idx`, `euribor3m`, and `nr.employed`. |
| `bank-additional.csv` | 4,119 | 21 | Publisher's 10% sample of `bank-additional-full.csv`. |

`bank-names.txt` reports no missing values in `bank-full.csv`. `bank-additional-names.txt` codes missing categorical values as `unknown`. In both extracts, the level `divorced` on `marital` means divorced or widowed.

`duration` is the length of the last contact, in seconds. Call length is known only after the contact, and a duration of 0 implies `y = no` in the additional extract. A realistic pre-call prediction excludes `duration`. A model that includes `duration` is a benchmark.

`pdays` uses a sentinel for no previous contact: −1 in `bank-full.csv`, and 999 in `bank-additional-full.csv`.

## Project status

| Step | Pipeline stage | Status | Notes |
|---|---|---|---|
| 1 | Dataset in the repository | In progress | Both extracts are in `Data/`. The analysis file is not chosen. |
| 2 | Version control | In progress | This repository. Isabella Westlauer (`AST-Isabella`) is invited as a collaborator. |
| 3 | Work split | Not started | Group schedule: Friday, 13 November 2026. |
| 4 | Cleaning and train/validation split | Not started | Group schedule: Tuesday, 17 November 2026. Record the split fraction and the sampling method. |
| 5 | Training-set summaries, plots, interaction checks, LDA/QDA assumptions, PCA decision | Not started | Group schedule: Tuesday, 17 November 2026. |
| 6 | Objective 1 additive logistic regression | Not started | Equation, one continuous coefficient, one categorical coefficient, each with a confidence interval. Group schedule: Tuesday, 24 November 2026. |
| 7 | Metric priority and simple baseline | Not started | Sensitivity, specificity, PPV, and NPV named in the subscription context, and the priority stated before thresholds are chosen. Group schedule: Tuesday, 24 November 2026. |
| 8 | Objective 2 competing models | Not started | Complex logistic regression, LDA, QDA, and one nonparametric model. Validation table, threshold for each model, ROC panel, final recommendation. Group schedule: Tuesday, 1 December 2026. |
| 9 | Slides and R file | Not started | Introduction, EDA, additive model, nonadditive model, model comparison, conclusions. Group schedule: Thursday, 3 December 2026. |
| 10 | Recording and submission | Not started | Recording at most 20 minutes. Group schedule: Monday, 6 December 2026. |

The dates in this table are the group's schedule. `Project2Details2026.docx` does not print a Canvas deadline.

## Group schedule

Friday, 13 November 2026. Choose the analysis file, confirm this repository, and decide the work split.

Tuesday, 17 November 2026. Finish exploratory data analysis. Clean the analysis file and choose the train/validation fraction. Finish training-set summaries and plots, look for candidate interactions, and check the linear and quadratic discriminant assumptions. Decide whether principal components analysis has a clear use.

Tuesday, 24 November 2026. Finish and review Objective 1. The additive logistic regression has a written equation, and one continuous coefficient and one categorical coefficient are interpreted with confidence intervals. Write which validation metrics take priority, and fit the simple baseline. This week stays lighter because the DS 7330 project is due and Thursday, 26 November 2026, is Thanksgiving.

Tuesday, 1 December 2026. Finish and review Objective 2. Fit the complex logistic regression, linear discriminant analysis, quadratic discriminant analysis, and the nonparametric model. Build the validation metric table, justify each threshold, make the ROC panel, and choose the prediction model.

Thursday, 3 December 2026. Finish the slides and the R file. The deck covers the introduction, exploratory data analysis, the additive model, the nonadditive model, the model comparison, and the conclusions.

Monday, 6 December 2026. Record and submit.

## Technologies

- **Language:** R 4.6.x.
- **Tools:** RStudio and rmarkdown (`html_document`). Methods stay inside the course set: logistic regression, linear and quadratic discriminant analysis, k-nearest neighbors, classification trees, random forests, `glmnet`, and principal components analysis, as each unit taught them.
- **License:** None. This repository is course work. Use of the Bank Marketing files follows the UCI citation request in `Data/`.

## How to reproduce

1. Clone `https://github.com/PowellOnPoint/msds-6372-project2-bank-marketing`.
2. Open `msds-6372-project2-bank.Rproj` in RStudio. The project uses UTF-8 and two-space indentation. The workspace is not saved on exit.
3. Read an extract with the semicolon separator. From `Dev/` or `Docs/`:

```r
bank <- read.csv("../Data/<file>.csv", sep = ";")
```

Categorical columns arrive as character vectors under R 4.0 and later. Convert a column to a factor when the model requires a factor.

4. Put draft notebooks in `Dev/` or `Docs/`. Copy a finished R file and the slide deck to the repository root.
5. Knit an `.Rmd` before pushing the matching HTML.
6. Leave `.RData`, `.Rhistory`, RStudio's `.Rproj.user/`, Office lockfiles (`~$*`), knitted `*_files/` directories, and `Docs/Project2Details2026.docx` untracked.

## Authors

- Aaron Powell – MSDS Candidate, Southern Methodist University (`PowellOnPoint`)
- Isabella Westlauer – MSDS Candidate, Southern Methodist University (`AST-Isabella`)

## Acknowledgments

- Course instructor: Dr. Jacob Turner.
- Moro, S., Rita, P., & Cortez, P. (2014). Bank Marketing [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5K306
- Moro, S., Cortez, P., & Rita, P. (2014). A data-driven approach to predict the success of bank telemarketing. *Decision Support Systems*. https://doi.org/10.1016/j.dss.2014.03.001
- Moro, S., Laureano, R., & Cortez, P. (2011). Using data mining for bank direct marketing: An application of the CRISP-DM methodology. In P. Novais et al. (Eds.), *Proceedings of the European Simulation and Modelling Conference — ESM'2011* (pp. 117–121). EUROSIS.
