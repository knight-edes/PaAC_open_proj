# PaAC_open_proj
This is a 4x4 bit approximation multiplier. Unlike a conventional multiplier that uses standard Half Adders (HAs) and Full Adders (FAs) with their typical defined functions, this design employs approximation techniques to reduce complexity while maintaining acceptable accuracy.
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

Utilization Report: 11 LUTs were used.
![image](https://github.com/user-attachments/assets/feae9ca8-9c59-4982-9480-7002ed014b10)
![image](https://github.com/user-attachments/assets/79968b93-cba4-490c-b7f8-721ca7865745)
![image](https://github.com/user-attachments/assets/28317803-1ce4-4c02-a89d-ff2dda46d524)
![image](https://github.com/user-attachments/assets/2d2c3338-820b-47bd-b8c3-71edf9d5c941)
![image](https://github.com/user-attachments/assets/e99d3c3b-423a-4ff4-af53-654619ed6eda)
![image](https://github.com/user-attachments/assets/97853ed0-cde8-4fe7-b3d0-29ba134fbb44)
![image](https://github.com/user-attachments/assets/f82831c8-52d0-4f40-a9ba-375302e356cb)
//
Power Report:
![image](https://github.com/user-attachments/assets/9d7a9eca-e9fc-43e1-8180-306c20c2a3a9)
![image](https://github.com/user-attachments/assets/9c1df2f3-69ee-4e71-b584-5c1baa4724fb)
![image](https://github.com/user-attachments/assets/f3ddbd13-2e90-4292-b9c8-6d3a37552536)
![image](https://github.com/user-attachments/assets/72476c50-ddb9-4ee2-9eb6-4112359d6590)









