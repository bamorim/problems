n = 10000000
limit = max(len(str(n))*9*9,n)
ends_with_89 = [None for _ in range(0,limit)]
ends_with_89[0] = 0
ends_with_89[88] = 1

count = 0
stack = []
for i in range(0,n):
    stack.append(i)
    while ends_with_89[stack[-1]] == None:
        currNum = stack[-1]+1
        nextNum = sum(map( lambda x: int(x)**2, list(str(currNum)) ))
        stack.append(nextNum-1)
    ends_with = ends_with_89[stack[-1]]
    while len(stack) > 0:
        ends_with_89[stack[-1]] = ends_with
        stack.pop()

print(sum(ends_with_89[0:n]))
