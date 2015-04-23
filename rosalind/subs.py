import sys
def indexes(outer,inner):
    results = []
    for i in range(len(outer)-len(inner)+1):
        for j in range(len(inner)):
            if outer[i+j] != inner[j]:
                break;
            elif j == len(inner)-1:
                results.append(i)
    return results

outer = sys.stdin.readline().strip()
inner = sys.stdin.readline().strip()
result = indexes(outer,inner)
print(str.join(" ",map(lambda i: str(i+1),result)))
