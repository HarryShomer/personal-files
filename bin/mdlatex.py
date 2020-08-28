#!/anaconda/bin/python3.6
"""

"""
import os
import sys
import shlex
import shutil
import argparse
import subprocess

def valid_args(file_name, dir_name):
    """
    Check if args passed are valid. If not will print a message and exit.

    File:
        - Must be passed (not None)
        - Must exit
        - Must be a markdown file

    Directory (if passed):
        - Must exit

    :param file_name: Name of .md file
    :param dir_name: Name of dir passed. If not passed will be None

    :return None
    """ 
    if file_name is None:
        sys.exit(parser.parse_args(['-h']))

    if not os.path.exists(file_name):
        sys.exit(f"Error: File '{file_name}' not found")

    if not file_name.endswith(".md"):
        sys.exit(f"Error: Input file must have an '.md' extension. File passed is of type '.{file_name.split('.')[-1]}'")

    ## TODO: XArgs checks if 1
    if dir_name is not None and os.path.exists(dir_name):
        sys.exit(f"Error: Directory {dir_name} doesn't exist")



def popen(cmd, stdin=None):
    """
    subprocess.PIPE
    """
    p = subprocess.Popen([*shlex.split(cmd)], stdin=stdin, stdout=subprocess.DEVNULL)
    output = p.communicate(timeout=3)[0]

    if p.returncode != 0:
        raise subprocess.CalledProcessError("Cmd Failed!")

    return output


def convert_file(file_name, dir_name):
    """

    :param file_name: Name of .md file
    :param dir_name: Name of dir passed. If not passed will be None
    
    """
    pdf_file = file_name.replace(".md", ".pdf")
    base_pdf_file = os.path.basename(pdf_file)

    md_to_json_cmd = f"pandoc -t json {file_name}"
    graphviz_filter_cmd = "graphviz_filter"
    json_to_pdf_cmd = f"pandoc -f json -V geometry:margin=1in -s -o {pdf_file}"

    # Delete pdf b4 just in case...trust me on this
    if os.path.exists(pdf_file):
        os.remove(pdf_file)

    print(f"Converting {file_name} to a latex pdf...\n", end="")
    try:
        p_out = popen(md_to_json_cmd)
        p_out = popen(graphviz_filter_cmd, stdin=p_out)
        subprocess.run([*shlex.split(json_to_pdf_cmd)], stdin=p_out, check=True)
    except subprocess.CalledProcessError:
        sys.exit("")  # Error message already printed by Pandoc
    finally:
        # Dir graphviz-filter creates for the graphs
        if os.path.exists("./graphviz-images"):
            shutil.rmtree("./graphviz-images")


    print(" - File converted SUCCESSFULLY")
    


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--f", "--file", help="File to convert", type=str)
    parser.add_argument("--d", "--dir", help="Dir to place resulting pdf in (optional)", type=str)
    args = parser.parse_args()

    valid_args(args.f, args.d)
    convert_file(args.f, args.d)


if __name__ == "__main__":
    main()





