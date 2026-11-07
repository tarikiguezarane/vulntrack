# Journal de progression

Une entrée par jour, la plus récente en haut.

## 2026-11-07 – Jour 1 : structure du monorepo

**Fait**
- Arborescence `backend/`, `frontend/`, `docs/`, `scripts/` (un README par dossier pour expliquer quand il sera rempli).
- `docker-compose.yml` local avec PostgreSQL 16 (healthcheck, port lié à `127.0.0.1`, mot de passe surchargeable via `.env`).
- `.gitignore` (Maven, Angular, `.env`), `.env.example`, licence MIT.
- README : problème du CRA, vision en 5 étapes, architecture visée (Mermaid), stack et arborescence. Notes `docs/architecture.md` et `docs/cra.md`.
- Test de structure `scripts/check-structure.sh` (fichiers obligatoires, `.env` jamais versionné, licence MIT) et première CI GitHub Actions : test de structure + shellcheck + `docker compose config`.

**Choix techniques**
- Monorepo : backend et frontend versionnés et livrés ensemble, une seule CI, un seul historique pour le portfolio.
- Port PostgreSQL lié à `127.0.0.1` : la base de dev n'est pas exposée sur le réseau local.
- Secrets uniquement via `.env` ignoré par Git ; le compose n'a qu'une valeur par défaut de dev clairement nommée.
- CI dès le jour 1 avec `permissions: contents: read` (moindre privilège du `GITHUB_TOKEN`).

**À retenir pour un entretien**
- CRA : obligations SBOM + signalement à l'ENISA des vulnérabilités activement exploitées (alerte précoce 24 h, notification 72 h, rapport final), applicable depuis le 11 septembre 2026.
- Pourquoi `127.0.0.1:5432:5432` plutôt que `5432:5432` : Docker publie sinon sur toutes les interfaces et contourne souvent le pare-feu de l'hôte.

**Limites connues**
- Pas encore de code applicatif : le backend arrive au jour 2, le frontend au jour 15.
- Lint et tests locaux validés (shellcheck, `docker compose config`, script de structure) ; la CI distante reste à vérifier sur GitHub.

## 2026-11-07 – Jour 0 : lancement

- Création du dépôt, de la feuille de route sur 30 jours (`ROADMAP.md`) et des instructions de travail quotidien (`CLAUDE.md`).
- Prochaine étape : Jour 1.
