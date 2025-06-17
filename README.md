# PaAC_open_proj
4x4 bit approximate multiplier
This project implements a 4x4 bit approximation multiplier. Unlike a conventional multiplier that uses standard Half Adders (HAs) and Full Adders (FAs) with their typical defined functions, this design employs approximation techniques to reduce complexity while maintaining acceptable accuracy.
Design Methodology:
Step 1: Partial Product Generation
All normal multiplication terms were first generated:
Row 0: a₀b₀, a₁b₀, a₂b₀, a₃b₀
Row 1: a₀b₁, a₁b₁, a₂b₁, a₃b₁
Row 2: a₀b₂, a₁b₂, a₂b₂, a₃b₂
Row 3: a₀b₃, a₁b₃, a₂b₃, a₃b₃

Step 2: Propagate and Generate Term Formation
The partial products were then organized into propagate and generate terms for efficient addition:
Propagate (P): P = A ⊕ B (XOR operation)
Generate (G): G = A ∧ B (AND operation)

Specific term pairings were created:
(a₃b₀, a₀b₃)
(a₂b₁, a₁b₂)

Special Grouping: g₃₀ and g₂₁ were combined to form G in the middle column, where G = g₃₀ ∨ g₂₁.
Approximation Circuits
The following approximate arithmetic blocks were designed using approximation techniques:

Approximate Half Adder (Approx_HA)
Sum: S = A ∨ B (OR operation)
Carry: C = A ∧ B (AND operation)

Approximate Full Adder (Approx_FA)
Sum: S = (A ∨ B) ⊕ Cᵢₙ
Carry: Cₒᵤₜ = (A ∧ B) ∨ (B ∧ Cᵢₙ)

Approximate Compressor (Approx_Comp)
Sum: S = (A ⊕ B) ∨ (C ⊕ D)
Carry: Cₒᵤₜ = (A ∧ B) ∨ (C ∧ D)

Implementation Architecture
The approximate arithmetic blocks are deployed across columns as follows:

Column 0: Corresponding digit is directly assigned
Column 1: Approx_HA for adding 2 terms
Column 2: Approx_Comp for adding 4 terms
Column 3: Approx_Comp for adding 4 terms
Column 4: Approx_Comp for adding 4 terms
Column 5: Approx_FA for adding 3 terms
Column 6: Approx_HA for adding 2 terms

This architecture provides a balanced approach between computational efficiency and acceptable approximation error for the 4x4 bit multiplication operation.

Mean Relative Error: 12.67%
![image](https://github.com/user-attachments/assets/4bf8ed75-9d9f-4c20-bc21-3218bbb6866e)


