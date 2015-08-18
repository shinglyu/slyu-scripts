import sys
from collections import Counter

showCount = 50 # show how many items
minLength = 4  # command that are shorter then this will not be shown
ignores = [
    'ls',
    'cd',
    'sudo',
    'git',
    'j',
]
histories = sys.stdin.readlines()
#print(len(histories))

history_n_grams = []

for history in histories:
    subcommands = history.split()
    acc = []
    for subcommand in subcommands:
        acc.append(subcommand)
        acc_str = " ".join(acc)
        if acc_str in ignores:
            continue
        if len(acc_str) < minLength:
            continue
        history_n_grams.append(acc_str)

#print history_n_grams
for cmd, count in Counter(history_n_grams).most_common(showCount):
    print  "{0}\t{1}".format(count, cmd)
