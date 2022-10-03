import Hw5
import Lean.Elab.Print
import Lean.Elab.Command

theorem desiredType (A B : Prop) : (A → B) → (¬ B → ¬ A) := sorry 

open Lean
open Lean.Meta
open Lean.Elab.Command

def collectAxiomsOf (constName : Name) : MetaM (List String) := do
  let env ← getEnv
  let (_, s) := ((CollectAxioms.collect constName).run env).run {}
  let a := s.axioms.toList.map toString
  return a

#eval isDefEq (Expr.const ``desiredType []) (Expr.const ``problem1 [])
#eval collectAxiomsOf ``problem1
