




def solution(participant, completion):
    answer = ''
    for item in completion:
    	participant.remove(item)
    answer = participant.pop()
    print(answer)
    return answer




solution(["leo", "kiki", "eden"], ["eden", "kiki"])
