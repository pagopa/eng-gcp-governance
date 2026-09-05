# GCP Governance

This context defines the vocabulary for the repository's GCP governance
policy-as-code work. It distinguishes the governance objects that are defined,
composed, and applied to GCP resources.

## Language

### Governance objects

**Custom role**:
A named set of permissions created for an organization-level IAM use case,
limited to the permissions required by that use case.
_Avoid_: Policy, role binding

**Organization policy**:
A governance constraint that controls what GCP resources or configurations are
allowed within an organization hierarchy.
_Avoid_: IAM role, application policy

**Custom constraint**:
An organization policy condition defined for a repository-specific governance
requirement when a predefined constraint is not sufficient.
_Avoid_: Custom role, validation rule

**Policy assignment**:
The application of an organization policy to a GCP organization, folder, or
project target.
_Avoid_: Policy definition, IAM binding

**Inheritance**:
The behavior by which a policy value is received from an ancestor in the GCP
resource hierarchy.
_Avoid_: Import, delegation

**Governance workload**:
A GCP project or folder whose resource creation or configuration is subject to
the repository's roles or organization policies.
_Avoid_: Application workload, Terraform workspace
