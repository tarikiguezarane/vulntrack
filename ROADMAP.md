# Feuille de route – VulnTrack (30 jours)

**Profil visé : Full-stack.** Tracker de conformité au Cyber Resilience Act (CRA) pour PME : import du SBOM des produits,
recherche automatique des vulnérabilités connues (API OSV), tableau de bord des risques, alertes, et génération
du signalement à envoyer à l'ENISA (alerte précoce sous 24 h, notification sous 72 h, rapport final).

Stack : Angular, Spring Boot 3 (Java 21, Maven), PostgreSQL + Flyway, Keycloak (OAuth2/OIDC), API OSV,
Docker, GitHub Actions, images publiées sur GHCR (déployées par le projet `securepipeline`).

Règle : chaque jour, faire la première étape non cochée, puis la cocher. Une étape = un incrément qui marche et qui est testé.

## Semaine 1 – Backend et cœur métier
- [x] Jour 1 – Structure du monorepo : `backend/`, `frontend/`, `docs/`, `docker-compose.yml`, `.gitignore`, licence MIT, README (problème CRA, vision, architecture visée).
- [ ] Jour 2 – Squelette Spring Boot (Java 21) : actuator, PostgreSQL + Flyway, compose local, premier test d'intégration.
- [ ] Jour 3 – Modèle métier : Organisation, Produit, Composant (purl, version), Vulnérabilité, Constat (finding) + migrations + tests.
- [ ] Jour 4 – Import SBOM : parsing CycloneDX JSON (et SPDX JSON), endpoint d'upload, tests avec des SBOM d'exemple.
- [ ] Jour 5 – Client OSV : requêtes par lot via purl, mapping CVE/alias/sévérité CVSS, tests avec WireMock.
- [ ] Jour 6 – Service de correspondance : analyse asynchrone d'un produit, création et déduplication des constats, réanalyse planifiée.
- [ ] Jour 7 – Score de risque : CVSS + présence dans le catalogue CISA KEV (vulnérabilités exploitées), risque par produit.

## Semaine 2 – Sécurité, alertes et conformité CRA
- [ ] Jour 8 – Keycloak dans le compose (realm exporté), Spring Security en resource server OIDC/JWT, rôles admin / dev / auditeur.
- [ ] Jour 9 – Autorisations par rôle sur chaque endpoint + tests de sécurité.
- [ ] Jour 10 – Alertes : nouvelle vulnérabilité critique ou exploitée → alerte + e-mail (MailHog) ou webhook.
- [ ] Jour 11 – Workflow CRA : incident, échéances 24 h / 72 h / rapport final, statuts, modèle du signalement ENISA.
- [ ] Jour 12 – Export PDF : rapport de risque produit et signalement d'incident.
- [ ] Jour 13 – Journal d'audit (qui a fait quoi, quand) consultable par l'auditeur.
- [ ] Jour 14 – Dockerfile backend multi-étapes non-root + GitHub Actions (build, tests) + publication de l'image sur GHCR.

## Semaine 3 – Frontend Angular
- [ ] Jour 15 – Squelette Angular, Angular Material, routing, connexion OIDC avec Keycloak.
- [ ] Jour 16 – Liste des produits et upload de SBOM.
- [ ] Jour 17 – Tableau de bord des risques : répartition par sévérité, composants les plus exposés, évolution.
- [ ] Jour 18 – Vue des constats : filtres, statuts (ouvert / accepté / corrigé), triage.
- [ ] Jour 19 – Alertes + assistant de signalement CRA avec compte à rebours 24 h / 72 h.
- [ ] Jour 20 – Interface adaptée au rôle (admin / dev / auditeur) + vue du journal d'audit.
- [ ] Jour 21 – Dockerfile frontend (nginx non-root) + CI + publication de l'image sur GHCR.

## Semaine 4 – Qualité, sécurité et finition
- [ ] Jour 22 – Tests de bout en bout Playwright sur l'environnement compose.
- [ ] Jour 23 – Documentation OpenAPI (springdoc) + tests d'API.
- [ ] Jour 24 – Durcissement : validation des entrées, limite de taille d'upload, rate limiting, en-têtes de sécurité, revue OWASP Top 10.
- [ ] Jour 25 – Performance : SBOM de 2 000 composants, requêtes OSV par lot, cache.
- [ ] Jour 26 – Données de démonstration : SBOM de projets open source réels, organisation et utilisateurs de démo.
- [ ] Jour 27 – Prêt pour Kubernetes : probes, configuration par variables d'environnement, métriques Prometheus, traces OpenTelemetry.
- [ ] Jour 28 – Documentation : architecture (Mermaid), explication du CRA, guide utilisateur.
- [ ] Jour 29 – README final : badges CI, démarrage rapide, lien vers `securepipeline` pour le déploiement.
- [ ] Jour 30 – Release v1.0.0 : CHANGELOG, tag Git, bilan dans le journal.
