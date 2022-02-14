import sys

file_path = sys.argv[1]

with open(file_path, 'r') as f:
    raw_file = f.read()

raw_words = raw_file.splitlines()
words = []
for raw_word in raw_words:
    words.extend(raw_word.split())

tbls = []
for n in range(0, len(words)):
    if words[n].lower() in ['from', 'join']:
        tbls.append(n + 1)

for tbl in tbls:
    txt = words[tbl]
    if '.' in txt:
        schema, table = txt.split('.')
        src = '{{ ' + "source('{schema}', '{table}')".format(schema=schema, table=table) + ' }}'
        raw_file = raw_file.replace(txt, src)

with open(file_path, 'w') as f:
    f.write(raw_file)
