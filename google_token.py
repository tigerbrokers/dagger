#/usr/local/bin/python
import sys
import struct
import time
import hmac
import hashlib
import base64

def main(secret):
    value = int(time.time() / 30)

    # Convert value to bytes
    value = struct.pack('>q', value)

    # Decode base32 key to bytes
    secretkey = base64.b32decode(secret.upper())

    # Generate HMAC-SHA1 from time based on secret key
    hash = hmac.new(secretkey, value, hashlib.sha1).digest()

    # Compute the truncated hash
    offset = ord(hash[-1]) & 0x0F
    truncated_hash = hash[offset:offset + 4]

    # Truncate to a smaller number of digits
    truncated_hash = struct.unpack('>L', truncated_hash)[0]
    truncated_hash &= 0x7FFFFFFF
    truncated_hash %= 1000000

    return '%06d' % truncated_hash

if __name__=="__main__":
    secret = sys.argv[1]
    print main(secret)
