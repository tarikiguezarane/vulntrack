# Cyber Resilience Act in a nutshell

The EU Cyber Resilience Act (Regulation (EU) 2024/2847) sets cybersecurity requirements for
products with digital elements placed on the EU market. Two obligations drive VulnTrack's design:

1. **Know your components.** Manufacturers must identify and document the components of their
   products, typically through a Software Bill of Materials (SBOM), and handle vulnerabilities
   in them without delay.
2. **Report actively exploited vulnerabilities and severe incidents** (applicable from
   11 September 2026) through the single reporting platform run by ENISA:
   - an **early warning within 24 hours** of becoming aware,
   - a **notification within 72 hours**,
   - a **final report** (within 14 days after a corrective measure is available for a
     vulnerability, within one month for a severe incident).

VulnTrack automates the first point (SBOM import, OSV matching, CISA KEV enrichment) and
tracks the deadlines of the second one.
