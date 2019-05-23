

import collections



def solution(phone_book):
    answer = True
    for item in phone_book:
    	for i in phone_book:
    		if item == i:
    			continue
    		if item.startswith(i):
    			return False

    return answer
solution(["119", "97674223", "1195524421"])
# solution(["123", "456", "789"])