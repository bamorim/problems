import sys
# A sequence will be represented by a tuple (id, seq)
seqs = []

# Parse input
for line in sys.stdin:
    if line[0] == ">": # This is an Identifier
        seqs.append((line[1:].strip(), ""))
    elif len(seqs) > 0:
        (i, s) = seqs[-1]
        s = s + line.strip()
        seqs[-1] = (i,s)

# O(n) average and O(n^2) worst case
# Actually is O(n*m) where m is the number of different prefixes we can have.
# m is upper bounded by n and a^k, where a is the number of different characters in the alphabet and k is the prefix/suffix size
def build_graph(seqs,k):
    prefixes = {}
    adjacency_list = []
    for (i,seq) in seqs:
        prefix = seq[:k]
        if prefixes.get(prefix) == None:
            prefixes[prefix] = []
        prefixes[prefix].append(i)

    for (i,seq) in seqs:
        suffix = seq[-k:]
        for t in (prefixes.get(suffix) or []):
            if t != i:
                adjacency_list.append((i,t))
    return adjacency_list

## simpler versio using list comprehension, but slower. Θ(n^2)
# def build_graph(seqs,k):
#   [(s,t) for (s,ss) in seqs for (t,ts) in seqs if ss[-3:] == ts[:3] and t != s]

for (s,t) in build_graph(seqs,3):
    print(s,t)
