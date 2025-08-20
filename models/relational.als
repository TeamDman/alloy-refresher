// A slightly richer example: simple model of a file system tree without cycles.

sig Dir {
  children: set Dir
}

fact NoSelf {
  no d: Dir | d in d.children
}

fact Acyclic {
  no d: Dir | d in d.^children
}

// Each directory has at most one parent (i.e., tree, not DAG)
fact UniqueParent {
  all d: Dir | lone (children.d) // inverse lookup: which parents have d as child
}

pred someTree {
  some Dir
}

assert NoCyclesEnforced {
  all d: Dir | d not in d.^children
}

check NoCyclesEnforced for 6
run someTree for 5
