#!/bin/bash
set -e;

# Configurações para o banco de dados Evolution
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Configurações básicas
    CREATE EXTENSION IF NOT EXISTS pgcrypto;
    
    -- Otimizações para o PostgreSQL
    ALTER SYSTEM SET max_connections = '1000';
    ALTER SYSTEM SET shared_buffers = '512MB';
    ALTER SYSTEM SET work_mem = '32MB';
    ALTER SYSTEM SET maintenance_work_mem = '128MB';
    ALTER SYSTEM SET effective_cache_size = '1GB';
    
    -- Confirma a inicialização do banco
    SELECT 'Inicialização do banco de dados Evolution concluída!' AS info;
EOSQL

echo "SETUP INFO: Banco de dados Evolution inicializado com sucesso!"