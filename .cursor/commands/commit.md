# Commit Messages 


**Format**
<context>(<optional-scope>): <short description>


**Contexts**
experiment | feature | bugfix | hotfix | perf | docs | refactor | test | build


**Rules**
- Imperative mood (add/fix/remove/rename)
- No trailing period in the short description
- Max 72 characters in the header
- Scope is optional; use lower- or kebab-case (e.g., `api`, `dbt`, `mlflow`)


**Choosing a context (diff-first rubric)**
1. Only `tests/` changed → `test`
2. Only docs changed → `docs`
3. Only CI/Docker/deps → `build`
4. Behavior change → `feature` (or `bugfix`/`hotfix` if fixing a defect)
5. No behavior change but structure changed → `refactor`
6. Measurable speed/memory improvement → `perf`
7. Exploratory/MLFlow runs/notebooks/spikes → `experiment`


**Examples**
- `feature(api): add customer search endpoint`
- `bugfix(schema): set default currency to 'USD' to prevent NULL inserts`
- `perf(db): add composite index (client_id, created_at)`
- `refactor(features): extract date bins util`
- `test(api): add contract tests for invoice idempotency`


---


# Git Commands — Add & Commit


```bash
# Stage all changes (or stage selectively with `git add <path>`)
git add -A


# Commit with the required format
git commit -m "<context>(<scope>): <short description>"
# Example
git commit -m "feature(api): add customer search endpoint"

# Do not push the code to github