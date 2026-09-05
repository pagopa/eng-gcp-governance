# eng-gcp-governance

This project contains all PagoPA policies and assignments to governance GCP workloads.

## Contents

- [Project structure](#project-structure)
- [Requirements](#requirements)
- [How to use it](#how-to-use-it)
- [GCP docs](#gcp-docs)
- [Policy evaluation](#policy-evaluation)
- [Terraform lock.hcl](#terraform-lockhcl)
- [Validation](#validation)

## Project structure

* `src/01_custom_roles` contains custom roles created with least privileges principle
* `src/02_policy_custom` contains custom policies grouped by type definition
* `src/03_policy_assignments` contains policy initiatives assignments to management groups or projects.

## 📋 Requirements

In order to manage the suitable version of terraform it is strongly recommended to install the following tool:

* [tfenv](https://github.com/tfutils/tfenv): __Terraform__ version manager inspired by rbenv.

Once these tools have been installed, install the terraform version shown in:

* .terraform-version

Next, install Goocle Cloud SDK:

* brew install --cask google-cloud-sdk

To log in to Google Cloud:

* gcloud auth login

### How to use it

```bash
./terraform.sh plan|apply|destroy
```

## GCP docs

[Google Cloud docs](https://cloud.google.com/docs)
[GCP Organization policy docs](https://cloud.google.com/resource-manager/docs/organization-policy/creating-managing-policies)

## Policy evaluation

GCP policies are evaluated in real time when a resource is created or modified.

## Terraform lock.hcl

We have both developers who work with your Terraform configuration on their Linux, macOS or Windows workstations and automated systems that apply the configuration while running on Linux.
<https://www.terraform.io/docs/cli/commands/providers/lock.html#specifying-target-platforms>

So we need to specify this in terraform lock providers:

```sh
terraform init

rm .terraform.lock.hcl

terraform providers lock \
  -platform=windows_amd64 \
  -platform=darwin_amd64 \
  -platform=darwin_arm64 \
  -platform=linux_amd64
```

## Validation

Run the repository wrapper or the equivalent non-mutating Terraform checks from
the root you are changing:

```bash
terraform fmt -check -recursive
terraform init -backend=false -lockfile=readonly
terraform validate -no-color
```

For documentation-only changes, run `git diff --check`. The generated
repository structure reference below is retained as a separate generated
section.

No diagram is provided because the repository-wide policy flow is already
covered by the architecture documentation and the component README for
`src/03_policy_assignments`.

---
## Repository Structure & Details (Auto-generated)

### Scopo
Definisce ruoli IAM custom e Organization Policies GCP, assegnandole per applicare guardrail di sicurezza/compliance su progetti e cartelle; standardizza i permessi minimi e i blocchi organizzativi.

### Cartelle
- `src/01_custom_roles`: ruoli IAM custom JSON.
- `src/02_policy_custom`: Organization Policies (constraint) con configurazioni parametriche.
- `src/03_policy_assignments`: binding/assignment delle policies a org/folder/project.

### Script
Nessuno (solo definizioni).

### Workflow
Nessuno.

### Note
Backend GCS `tfapporg-terraform-state` (prefix `eng-gcp-governance/<subdir>`); valori org/progetto in `variables.tf`.
