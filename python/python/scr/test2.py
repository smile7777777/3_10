def Find_Max_Subarray(A):
    # Compute Prefix Sum
    Prefix = [0] * len(A)  # Adjust Prefix array to the same size as A
    Prefix[0] = A[0]       # Initialize first element as A[0]
    
    for i in range(1, len(A)):
        Prefix[i] = Prefix[i - 1] + A[i]

    Nowmin = 0             # Start with 0 as the minimum prefix sum (empty subarray)
    Ans = float('-inf')    # Initialize the result as negative infinity

    # Find Maximum Subarray Sum
    for i in range(len(A)):
        Ans = max(Ans, Prefix[i] - Nowmin)  # Update max subarray sum
        Nowmin = min(Nowmin, Prefix[i])    # Update minimum prefix sum

    return Ans

# Test case
print(Find_Max_Subarray([10, -2, 3, 5, -3, -4]))  # Should return 16
