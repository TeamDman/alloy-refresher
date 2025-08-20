# Alloy Refresher

Simple Alloy model checking demonstration.

I use these vscode extensions.

Name: Alloy  
Id: ArashSahebolamri.alloy  
Description: support for the Alloy modelling language  
Version: 0.7.1  
Publisher: Arash Sahebolamri  
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=ArashSahebolamri.alloy 

Name: Alloy VSCode  
Id: DongyuZhao.alloy-vscode  
Description: Alloy analyzer language support  
Version: 0.1.6  
Publisher: Dongyu Zhao  
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=DongyuZhao.alloy-vscode  

This was made using GPT-5.


## Contents
- `models/intro.als` – Minimal directed acyclic graph example showing: signatures, fields, facts, function (reachability), predicate, assertion, and run/check commands.
- `models/relational.als` – Simple file-system like tree (directories) illustrating acyclicity and unique parent constraint.

## Quick Start
1. Install Alloy Analyzer from https://alloytools.org (download the JAR).
2. Launch it: `java -jar alloy*.jar` (or double‑click the JAR on most systems).
3. Open one of the `.als` files in `models/`.
4. Press `Execute` beside a `run` command to generate sample instances.
5. Press `Execute` beside a `check` command to search for counterexamples to assertions.

## What To Look At
### `intro.als`
Key pieces:
- `sig Node { edges: set Node }` defines a relation.
- Facts `NoSelfLoops` and `Acyclic` globally constrain every instance.
- `fun reach[] { *edges }` uses reflexive transitive closure.
- Assertion `ReachIsAntisymmetric` is checked with `check ReachIsAntisymmetric for 5`.
- `run threeNodes for 3` shows a small instance.

### `relational.als`
Highlights a tree structure:
- Acyclic and no self‑loops via facts.
- `UniqueParent` ensures each directory has at most one parent (`lone (children.d)`).
- Assertion `NoCyclesEnforced` redundantly states acyclicity so the check should pass (no counterexample) in given scope.

## Ideas To Extend
- Remove or weaken a fact (e.g., comment out `Acyclic`) and re‑run the assertion to see a counterexample.
- Add a `sig File` and relate files to directories; assert each file has exactly one parent.
- Model a small state machine: `sig State { next: set State }` and assert properties about reachability.
- Introduce a deliberate bug (e.g., allow a cycle) and inspect the counterexample.

## Cheat Sheet (Selected Alloy Ops)
- `^r` transitive closure (1+ steps)
- `*r` reflexive transitive closure (0+ steps)
- `~r` transpose relation
- Multiplicities: `lone`, `one`, `some`, `set`
- Cardinality: `#S` returns size of set `S`
