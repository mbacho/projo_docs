"""
The MIT License

Copyright (c) 2014, mbacho (Chomba Ng'ang'a)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


file : main.py
project : projo_docs

"""

__author__ = 'mbacho'

from os import (system, mkdir)
from os.path import (join, exists, isdir)
import sys
from shutil import rmtree
from jinja.exceptions import TemplateNotFound
from jinja.environment import Environment
from jinja import FileSystemLoader
from sys import argv

def clean_output(output_dir):
    if exists(output_dir) and isdir(output_dir):
        rmtree(output_dir)
    elif exists(output_dir):
        return False
    mkdir(output_dir)
    return True


def main(push_origin=False):
    filenames = ['milestone1.html', 'milestone2.html', 'milestone3.html']
    html_dir = 'gh-pages'
    if not clean_output(html_dir):
        sys.stderr.write('folder cleanup failed\n')
        sys.exit(1)
    env = Environment(loader=FileSystemLoader('src/templates'))
    for i in filenames:
        try:
            template = env.get_template(i)
            rendered = template.render()
            f = open(join(html_dir, i), 'wb')
            f.write(rendered)
            f.close()
            print i, "rendered"
        except TemplateNotFound, te:
            print i, "not found"

    system('cp src/index.html %s/' % html_dir)
    system('cp -R src/static %s/' % html_dir)
    if push_origin:
        system('ghp-import -p %s' % html_dir)


if __name__ == '__main__':
    main(len(argv)==2)

