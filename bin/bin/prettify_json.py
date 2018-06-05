#!/usr/bin/python3

import json
import sys


def main(input_file, output_file):
    with open(input_file, 'r') as fp:
        data = json.load(fp)
    with open(output_file, 'w') as fp:
        json.dump(data, fp, indent=4, sort_keys=True)
    print("Finished reformatting json")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: prettify_json.py input_path output_path")
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    sys.exit(main(input_file, output_file))
