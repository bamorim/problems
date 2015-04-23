# Lets do totally imperative
import sys

# Will keep (id, sequence) tuples
seqs = []

# Parse input
for line in sys.stdin:
    if line[0] == ">": # This is an Identifier
        seqs.append((line[1:].strip(), ""))
    elif len(seqs) > 0:
        (i, s) = seqs[-1]
        s = s + line.strip()
        seqs[-1] = (i,s)

# Calculate GC-content for a given sequence
def gc_content(s):
    count = 0
    gc_count = 0
    for c in s:
        if c == 'A' or c == 'T':
            count += 1
        elif c == 'C' or c == 'G':
            count += 1
            gc_count += 1
    return gc_count/count

maxContent = 0
maxTitle = ""

for (title,seq) in seqs:
    if gc_content(seq) > maxContent:
        maxContent = gc_content(seq)
        maxTitle = title

print(maxTitle)
print(maxContent*100)
