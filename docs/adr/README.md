# Architectural Decision Records

This directory records repository-wide architecture decisions whose rationale
would otherwise be difficult to recover from the Terraform configuration.

- [Scope](#scope)
- [Index](#index)
- [Format](#format)
- [Status and supersession](#status-and-supersession)
- [Validation](#validation)

## Scope

Create an ADR only for a decision that is costly to reverse, surprising without
context, and based on a real trade-off. Routine implementation choices stay in
their owning code or documentation.

## Index

- [0001 - Single GCP governance context](0001-gcp-governance-single-context.md):
  proposed single-context knowledge layout.

## Format

- Name files `NNNN-<slug>.md` using the next unused four-digit number.
- Start with one H1 that names the decision.
- Use `Status: <value>` when the decision lifecycle must be explicit.
- State the context, decision, and rationale in one concise paragraph.
- Add options or consequences only when they help a later reader.

## Status and supersession

New decisions start as `proposed`. Mark one `accepted` only when repository
authority records that acceptance. An accepted ADR body is immutable; a changed
decision requires a new ADR, and both records must link the supersession.

## Validation

Check unique numbering, filename and title identity, status, local links, and
supersession symmetry before review.

No diagram is provided because this index records decision metadata rather than
three or more material relationships.
