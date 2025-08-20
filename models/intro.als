// A minimal Alloy model introducing signatures, fields, facts, predicates, and a simple assertion.
// Domain: Directed graph with reachability.

// Basic atoms representing Nodes
sig Node {
  edges: set Node
}

// A fact constraining the model: no self loops for simplicity.
fact NoSelfLoops {
  no n: Node | n in n.edges
}

// Another fact: edges is acyclic (no cycles of length >=1) using transitive closure ^
fact Acyclic {
  no n: Node | n in n.^edges
}

// Derived relation: reachability (reflexive-transitive closure)
fun reach[]: Node -> Node { *edges } // * is reflexive transitive closure

// Example predicate generating an example instance with exactly 3 nodes.
pred threeNodes {
  #Node = 3
}

// Assertion: in an acyclic graph, reachability is a partial order (antisymmetric)
assert ReachIsAntisymmetric {
  all a, b: Node | a->b in reach[] and b->a in reach[] implies a = b
}

// Command to check the assertion within a scope of 5 nodes.
check ReachIsAntisymmetric for 5

// Command to run the predicate for exactly 3 nodes to see an instance.
run threeNodes for 3
