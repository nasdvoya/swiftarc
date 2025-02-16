## Intro

Please read "Zero to Production in Rust" by Luca Palmieri.

## Database

This project uses **PostgreSQL** as database with **sqlx** crate to interact with **PostgresSQL**.

```bash

# Run
./scripts/init_db.sh
# Or just migrate
SKIP_DOCKER=true ./scripts/init_db.sh

```
