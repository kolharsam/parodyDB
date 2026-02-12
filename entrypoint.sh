#!/bin/bash
set -e

# Fix ownership of the mounted target volume so the non-root user can write to it
chown -R developer:developer /parodydb/target

# Run the command as the non-root user
exec gosu developer "$@"
