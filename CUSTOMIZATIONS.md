# Customizações altrsconsult/twenty

Fork de [twentyhq/twenty](https://github.com/twentyhq/twenty) com ajustes para deploy gerenciado pela Altrs Consult.

## Branch de trabalho

- `aw-custom` — branch de customizações (trabalho ativo)
- `main` — espelho do upstream + merges validados → dispara build de imagem

## Fluxo de trabalho

```
upstream (twentyhq/twenty)
        ↓ git fetch upstream && git merge upstream/main → aw-custom
aw-custom (customizações)
        ↓ PR / merge após validação
main
        ↓ git tag vX.X.X-aw.N && git push origin --tags
GitHub Actions → ghcr.io/altrsconsult/twenty:vX.X.X-aw.N + :latest
```

## Sync com upstream

```bash
git fetch upstream
git checkout aw-custom
git merge upstream/main
# resolver conflitos se houver
git push origin aw-custom
```

## Gerar nova release

```bash
# Após merge de aw-custom → main validado
git checkout main
git tag v2.6.0-aw.1
git push origin v2.6.0-aw.1
# GitHub Actions dispara automaticamente
```

## Convenção de tags

| Tag | Significado |
|---|---|
| `v2.6.0-aw.1` | Twenty v2.6.0 + customização aw revisão 1 |
| `v2.6.0-aw.2` | Twenty v2.6.0 + revisão 2 (nova customização) |
| `v2.7.0-aw.1` | Sync com upstream v2.7.0 + customizações |
| `latest` | Sempre aponta para a última tag validada |

## Customizações aplicadas

| Arquivo | Descrição | Data |
|---|---|---|
| — | (registrar aqui cada alteração feita) | — |

## Imagem

```
ghcr.io/altrsconsult/twenty:latest
ghcr.io/altrsconsult/twenty:vX.X.X-aw.N
```
