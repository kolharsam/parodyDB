# parodyDB

A toy full-text search extension for PostgreSQL, written in Rust using [pgrx](https://github.com/pgcentralfoundation/pgrx).

This is a learning project. The goal is not to build a production search engine — it's to deeply understand how full-text search works by building one from scratch, piece by piece.

## What is this book?

This book serves two purposes:

1. **A learning journal** — documenting the process of building parodyDB. What worked, what didn't, what was surprising.
2. **Reference documentation** — architecture, API, and the concepts behind the implementation.

## Current status

parodyDB can currently do a basic case-insensitive substring search:

```sql
SELECT parodydb_search('The quick brown fox', 'quick');  -- true
```

That's it. Everything else is ahead of us.
