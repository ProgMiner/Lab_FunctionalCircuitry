#!/usr/bin/python3

from math import sqrt
from collections import Counter


lfsr1_buffer = [1, 0, 1, 0, 0, 0, 0, 0]
lfsr2_buffer = [1, 0, 1, 0, 0, 0, 0, 0]
crc8_buffer  = [1, 1, 1, 1, 1, 1, 1, 1]

# y = 1 + x^4 + x^6 + x^7 + x^8
def lfsr1_next():
    tmp = lfsr1_buffer[0] ^ lfsr1_buffer[4] ^ lfsr1_buffer[6] ^ lfsr1_buffer[7]

    lfsr1_buffer[7] = lfsr1_buffer[6]
    lfsr1_buffer[6] = lfsr1_buffer[5]
    lfsr1_buffer[5] = lfsr1_buffer[4]
    lfsr1_buffer[4] = lfsr1_buffer[3]
    lfsr1_buffer[3] = lfsr1_buffer[2]
    lfsr1_buffer[2] = lfsr1_buffer[1]
    lfsr1_buffer[1] = lfsr1_buffer[0]
    lfsr1_buffer[0] = tmp

# y = 1 + x + x^6 + x^7 + x^8
def lfsr2_next():
    tmp = lfsr2_buffer[7]

    lfsr2_buffer[7] = lfsr2_buffer[6] ^ tmp
    lfsr2_buffer[6] = lfsr2_buffer[5] ^ tmp
    lfsr2_buffer[5] = lfsr2_buffer[4]
    lfsr2_buffer[4] = lfsr2_buffer[3]
    lfsr2_buffer[3] = lfsr2_buffer[2]
    lfsr2_buffer[2] = lfsr2_buffer[1]
    lfsr2_buffer[1] = lfsr2_buffer[0] ^ tmp
    lfsr2_buffer[0] = 0

# y = 1 + x + x^3 + x^5 + x^6 + x^8
def crc8_next(bit):
    tmp = crc8_buffer[7]

    crc8_buffer[7] = crc8_buffer[6]
    crc8_buffer[6] = crc8_buffer[5] ^ tmp
    crc8_buffer[5] = crc8_buffer[4] ^ tmp
    crc8_buffer[4] = crc8_buffer[3]
    crc8_buffer[3] = crc8_buffer[2] ^ tmp
    crc8_buffer[2] = crc8_buffer[1]
    crc8_buffer[1] = crc8_buffer[0]
    crc8_buffer[0] = bit ^ tmp

def buffer_to_int(buf):
    return int(''.join(map(str, reversed(buf))), 2)

def int_to_buffer(n):
    return [(n >> i) & 1 for i in range(8)]


lfsr1_buffer = int_to_buffer(int(input('a initial: ')))
lfsr2_buffer = int_to_buffer(int(input('b initial: ')))

values = []

for i in range(256):
    lfsr1_next()
    lfsr2_next()

    a = buffer_to_int(lfsr1_buffer)
    b = buffer_to_int(lfsr2_buffer)

    values.append((a, b))
    result = a * int(sqrt(b))

    for i in range(12):
        crc8_next((result >> i) & 1)

    print('0x' + ''.join(map(str, reversed(crc8_buffer))) + ' '
        + str(a) + ' * sqrt(' + str(b) + ') = ' + str(result))

dup_cnt = 0
values_cnt = Counter(values)
for v, c in values_cnt.most_common():
    if c == 1:
        break

    dup_cnt += 1
    print('Duplicates: ', v, c)

print('Total duplicates: ', dup_cnt)
