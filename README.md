# db_mmp

Projeto Docker responsavel por subir o MySQL do Map My Path.

## Subir o banco

```bash
docker compose up -d
```

Na primeira inicializacao, o container executa os scripts em `docker/mysql/init` para criar as tabelas e popular os dados iniciais.

## Integracao com o web_mmp

O `web_mmp` deve usar:

- `DB_HOST=host.docker.internal`
- `DB_PORT=3306`
- `DB_NAME=db_mmp`
- `DB_USER=app_mmp`
- `DB_PASS=app_mmp`
